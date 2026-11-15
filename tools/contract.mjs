import assert from 'node:assert/strict';
export const flatten=elements=>elements.flatMap(e=>[e,...flatten(e.children||[])]);
export function nodeText(source,node){const lines=source.split('\n');return lines.slice(node.range.start.line,node.range.end.line+1).join('\n').replace(/\/\*[\s\S]*?\*\/|\/\/[^\n]*/g,'').replace(/\s+/g,' ').trim();}
export function checkContract(models,sources){
 const types=models['model/structure/types.sysml'].elements.find(e=>e.name==='StlTypes');
 const parameters=Object.fromEntries(types.children.filter(e=>e.type==='attribute').map(e=>{
  const value=/^(\d+)(?: \[s\])?$/.exec(e.attributes.value||'');assert(value,`Invalid parameter ${e.name}`);return[e.name,Number(value[1])];}));
 assert.deepEqual(parameters,{minimumGreen:10,maximumGreen:30,maximumWaitingTime:210,observationInterval:1,staleThreshold:3,yellowDuration:3,allRedDuration:1,fallbackGreen:10,greenLow:10,greenMedium:20,greenHigh:30,lowUpperBound:5,mediumUpperBound:15,recoveryFrames:3},'SysML parameter differs from approved ASM baseline');
 for(const element of flatten(models['model/structure/bdd.sysml'].elements))if(element.type==='attribute'&&Object.hasOwn(parameters,element.name))assert.equal(element.attributes.value,'StlTypes::'+element.name,`Duplicate parameter must reference StlTypes: ${element.name}`);
 const state=flatten(models['model/behavior/state-machine.sysml'].elements);
 const transition=name=>{const e=state.find(e=>e.type==='transition'&&e.name===name);assert(e,`Missing transition ${name}`);return nodeText(sources['model/behavior/state-machine.sysml'],e);};
 assert.match(transition('greenExpiry'),/accept after lockedGreen\b/,'Green must expire at frozen grant duration');
 assert.match(transition('grantAccepted'),/assign lockedGreen := grant\.greenSeconds \* 1 \[s\]/,'Accepted grant must freeze green duration');
 assert.match(transition('grantAccepted'),/greenSeconds >= 10 and grant\.greenSeconds <= 30/);
 assert.match(transition('rejectedGrant'),/greenSeconds < 10 or rejected\.greenSeconds > 30/);
 assert.match(transition('rejectedGrant'),/then safetyHold/);
 assert.match(transition('infeasiblePlan'),/accept infeasible : InfeasiblePlanEvent.*then safetyHold/);
 for(const [name,seconds] of [['startupDone',parameters.allRedDuration],['yellowExpiry',parameters.yellowDuration],['clearanceDone',parameters.allRedDuration]])assert(transition(name).includes(`accept after ${seconds} [s]`),name);
 const requirements=flatten(models['model/requirements/requirements.sysml'].elements).filter(e=>e.type==='requirement');
 assert.equal(requirements.length,24);assert.equal(new Set(requirements.map(e=>e.shortName)).size,24);
 const verified=new Set(models['model/verification/verification.sysml'].relationships.filter(r=>r.type==='verify').map(r=>r.target));
 const satisfied=new Set(models['model/traceability/allocation.sysml'].relationships.filter(r=>r.type==='satisfy').map(r=>r.target));
 for(const req of requirements){assert(verified.has(req.name),`No verify link: ${req.shortName}`);assert(satisfied.has(req.name),`No satisfy link: ${req.shortName}`);}
 const cases=flatten(models['model/verification/verification.sysml'].elements).filter(e=>e.type==='verification case def');assert.equal(cases.length,21);
 const sequence=models['model/behavior/sequence.sysml'].sequenceDiagrams[0];assert.equal(sequence.messages.length,21);
 for(const [i,msg] of sequence.messages.entries())assert.equal(msg.name,`m${String(i+1).padStart(2,'0')}`,'Sequence declaration order must match intended succession');
 const actionNodes=flatten(models['model/behavior/activity.sysml'].elements);
 const actionIDs=actionNodes.filter(e=>e.type==='action def').map(e=>/^ACT-(\d+)/.exec(e.attributes.documentation||'')?.[0]).filter(id=>id&&id!=='ACT-00');
 assert.equal(actionIDs.length,10);assert.equal(new Set(actionIDs).size,10);
 assert.equal(flatten(models['model/traceability/allocation.sysml'].elements).filter(e=>e.type==='allocation').length,10);
 const action=flatten(models['model/behavior/activity.sysml'].elements).find(e=>e.name==='ManageTraffic');assert(action);
 assert.match(nodeText(sources['model/behavior/activity.sysml'],action),/if sampleOrTick then validateFrame/);
 const context=sources['model/structure/ibd.sysml'];assert.match(context,/trafficDataSource\.countsOut to smartTrafficLight\.sensor\.countsIn/);
 return {parameters,requirements:requirements.map(e=>({id:e.shortName,name:e.name,documentation:e.attributes.documentation})),verificationCases:cases.map(e=>e.shortName),scope:'Native parser + static contract checks; not a SysML execution engine or hardware test'};
}
