import test from 'node:test';
import assert from 'node:assert/strict';
import {readFile} from 'node:fs/promises';
import {pathToFileURL} from 'node:url';
import {checkContract} from './contract.mjs';
import {internalStructure,definitionOverview} from './projection.mjs';
import {openModelServer} from './lsp.mjs';
const fixture=JSON.parse(await readFile('.build/sysml-model.json','utf8'));
test('frozen-grant mutation: a 999 second timer must fail',()=>{
 const {models,sources}=structuredClone(fixture);const file='model/behavior/state-machine.sysml';
 assert(sources[file].includes('accept after lockedGreen'));
 sources[file]=sources[file].replace('accept after lockedGreen','accept after 999 [s]');
 assert.throws(()=>checkContract(models,sources),/Green must expire/);
});
test('a removed native verify relationship must fail',()=>{
 const {models,sources}=structuredClone(fixture);
 models['model/verification/verification.sysml'].relationships=models['model/verification/verification.sysml'].relationships.filter(r=>r.target!=='reqMaximumWaiting');
 assert.throws(()=>checkContract(models,sources),/No verify link/);
});
test('IBD projection resolves inherited parts and ports, all four lamp targets',()=>{
 const m=internalStructure(fixture.models['model/structure/ibd.sysml'],fixture.models);
 assert.equal(m.elements.length,9);assert.equal(m.relationships.filter(r=>r.type==='connection').length,10);
 for(const name of ['North','South','East','West'])assert(m.elements.find(e=>e.name==='light'+name).children.some(e=>e.name==='lampsIn'));
 assert(m.elements.find(e=>e.name==='sensor').children.some(e=>e.name==='countsIn'));
});
test('definition overview retains five type targets and four distinct lamp roles',()=>{
 const m=definitionOverview(fixture.models['model/structure/bdd.sysml']);
 assert.equal(m.elements.length,6);assert.equal(m.relationships.length,5);
 const lights=m.relationships.find(r=>r.target==='TrafficLights');
 assert(lights);for(const name of ['lightNorth','lightSouth','lightEast','lightWest'])assert(lights.name.includes(name));
});
test('native ANTLR parser rejects malformed SysML instead of trusting comments',async()=>{
 const server=await openModelServer(process.cwd());
 try{
  const uri=pathToFileURL(process.cwd()+'/.build/invalid.sysml').href,text='package Broken { attribute value : Integer = (1 + ); }';
  server.notify('textDocument/didOpen',{textDocument:{uri,languageId:'sysml',version:1,text}});
  await server.request('sysml/model',{textDocument:{uri}});
  const result=await server.request('sysml/validateText',{documents:[{uri,text}]});
  assert(result.documents[0].diagnostics.some(d=>d.severity===1));
 }finally{server.close();}
});
