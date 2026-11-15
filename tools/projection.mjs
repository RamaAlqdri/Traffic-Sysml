import {flatten} from './contract.mjs';
// Resolve inherited parts/ports for the renderer, which otherwise sees usages as empty boxes.
export function expandParts(model, models) {
 const definitions=new Map(Object.values(models).flatMap(m=>flatten(m.elements)).filter(e=>['part def','port def'].includes(e.type)).map(e=>[e.name,e]));
 function visit(e,seen=new Set()){
  const type=(e.attributes?.partType||'').replace(/^~/,'');
  const def=['part','port'].includes(e.type)?definitions.get(type):null;
  let children=e.children||[];
  if(def&&!seen.has(type)){
   const overrides=new Map(children.map(c=>[c.type+':'+c.name,c]));
   for(const c of def.children||[])if(!overrides.has(c.type+':'+c.name))overrides.set(c.type+':'+c.name,c);
   children=[...overrides.values()];seen=new Set([...seen,type]);
  }
  return {...e,children:children.map(c=>visit(c,seen))};
 }
 return {...model,elements:model.elements.map(e=>visit(e))};
}
export function internalStructure(model,models){
 const expanded=expandParts(model,models), all=flatten(expanded.elements);
 const system=all.find(e=>e.name==='smartTrafficLight'&&e.type==='part');
 const source=all.find(e=>e.name==='trafficDataSource'&&e.type==='part');
 if(!system||!source)throw Error('Missing SysML context parts');
 const parts=[source,...system.children.filter(e=>e.type==='part')];
 const relationships=model.relationships.filter(r=>['connection','flow'].includes(r.type)).map(r=>({...r,source:r.source.replace(/^smartTrafficLight\./,''),target:r.target.replace(/^smartTrafficLight\./,'')}));
 return {...expanded,elements:parts,relationships};
}
export function lifecycle(model,models){
 const definition=flatten(model.elements).find(e=>e.type==='state def'&&e.name==='SignalLifecycle');
 const owner=flatten(models['model/structure/bdd.sysml'].elements).find(e=>e.type==='part def'&&e.name==='SignalController');
 const usage=owner.children.find(e=>e.type==='exhibit state'&&e.name==='lifecycle');
 if(!definition||!usage)throw Error('Missing exhibited SignalLifecycle');
 // Display the actual exhibited state usage, including its definition's nested states.
 return {...model,elements:[{...usage,children:definition.children}]};
}
export function definitionOverview(model){
 const definitions=flatten(model.elements).filter(e=>e.type==='part def'&&!['TrafficDataSource','RoadUsers'].includes(e.name));
 const names=new Set(definitions.map(e=>e.name)),relationships=[];
 for(const definition of definitions){
  const groups=new Map();
  for(const part of definition.children.filter(e=>e.type==='part')){
   const target=part.attributes.partType;if(!names.has(target))continue;
   if(!groups.has(target))groups.set(target,[]);groups.get(target).push(part.name);
  }
  for(const [target,parts] of groups)relationships.push({type:'composition',source:definition.name,target,name:parts.join(', ')});
 }
 return {...model,elements:definitions.map(e=>({...e,children:[]})),relationships};
}
