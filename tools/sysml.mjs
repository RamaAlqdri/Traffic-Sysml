import {openModelServer} from './lsp.mjs';
import {checkContract} from './contract.mjs';
import {renderBehaviorViews} from './behavior-views.mjs';
import {renderModels} from './render.mjs';
import {internalStructure,definitionOverview} from './projection.mjs';
import {readFile,readdir,mkdir,writeFile} from 'node:fs/promises';
import {pathToFileURL} from 'node:url';
import {createHash} from 'node:crypto';
const server=await openModelServer(process.cwd());
try{
 const files=(await readdir('model',{recursive:true})).filter(x=>x.endsWith('.sysml')).sort().map(x=>'model/'+x);
 const sources=Object.fromEntries(await Promise.all(files.map(async f=>[f,await readFile(f,'utf8')])));
 const uri=f=>pathToFileURL(process.cwd()+'/'+f).href;
 for(const file of files)server.notify('textDocument/didOpen',{textDocument:{uri:uri(file),languageId:'sysml',version:1,text:sources[file]}});
 const models={};for(const file of files)models[file]=await server.request('sysml/model',{textDocument:{uri:uri(file)}});
 const validation=await server.request('sysml/validateText',{documents:files.map(f=>({uri:uri(f),text:sources[f]}))});
 await mkdir('.build',{recursive:true});await writeFile('.build/sysml-diagnostics.json',JSON.stringify(validation,null,2));
 const errors=validation.documents.flatMap(d=>d.diagnostics.filter(x=>x.severity===1).map(x=>`${d.uri}:${x.range.start.line+1}: ${x.message}`));
 if(errors.length)throw Error(errors.join('\n'));
 const contract=checkContract(models,sources);
 const receipt={...contract,toolchain:{parser:'sysml-v2-lsp@0.42.0',renderer:'sysml-v2-support@a4f3e48630842c173117aa1736bf46115929bc13'},validatorHashes:Object.fromEntries(await Promise.all(['tools/contract.mjs','tools/lsp.mjs','tools/sysml.mjs','package-lock.json'].map(async f=>[f,createHash('sha256').update(await readFile(f)).digest('hex')]))),sourceHashes:Object.fromEntries(files.map(f=>[f,createHash('sha256').update(sources[f]).digest('hex')])),diagnosticCounts:{errors:0,advisories:validation.documents.reduce((n,d)=>n+d.diagnostics.length,0)}};
 await writeFile('.build/sysml-model.json',JSON.stringify({models,sources},null,2));
 await writeFile('.build/sysml-contract.json',JSON.stringify(receipt,null,2));
 await writeFile('model/verification/sysml-validation.json',JSON.stringify(receipt,null,2));
 console.log(`Validated ${files.length} SysML v2 files; 24 requirements / 21 verify cases; frozen grant contract PASS.`);
 if(!process.argv.includes('--check')){
  const views=JSON.parse(await readFile('tools/views.json','utf8'));
  // Select a legible partial view from parsed elements, never a second hand-authored model.
  for(const view of views){if(view.names){const model=structuredClone(models[view.file]);model.elements=model.elements.flatMap(e=>e.children.filter(c=>view.names.includes(c.name))).map(e=>view.name==='requirements'?{...e,children:[],attributes:{...e.attributes,documentation:(/^Statement: (.*)$/m.exec(e.attributes.documentation||'')||[])[1]||e.attributes.documentation}}:e);models[view.file+'#'+view.name]=model;view.file+='#'+view.name;}}
  models['model/structure/ibd.sysml']=internalStructure(models['model/structure/ibd.sysml'],models);
  for(const view of views)if(view.name==='bdd')models[view.file]=definitionOverview(models[view.file]);
  renderBehaviorViews(models,sources);
  await renderModels(models,views.filter(view=>!['use-case','activity','state-machine'].includes(view.name)));
 }
}finally{server.close();}
