import {build} from 'esbuild';
import puppeteer from 'puppeteer';
import {createServer} from 'node:http';
import {readFile,writeFile,mkdir} from 'node:fs/promises';
import {resolve,extname,sep} from 'node:path';
import {pathToFileURL} from 'node:url';
const extension=resolve('node_modules/sysml-v2-support');
export async function renderModels(models, views) {
 await mkdir('.build',{recursive:true});
 const result=await build({stdin:{contents:`export {modelSnapshot} from '${extension}/src/visualization/core/modelSnapshot.ts';export {diagramShell} from '${extension}/src/visualization/core/diagramShell.ts';`,resolveDir:process.cwd()},bundle:true,platform:'node',format:'esm',write:false,plugins:[{name:'vscode-resource-adapter',setup(b){b.onResolve({filter:/^vscode$/},()=>({path:'vscode',namespace:'stub'}));b.onLoad({filter:/.*/,namespace:'stub'},()=>({contents:'export const Uri={joinPath:(base,...parts)=>base+"/"+parts.join("/")};'}));}}]});
 await writeFile('.build/renderer-adapter.mjs',result.outputFiles[0].text);
 const {modelSnapshot,diagramShell}=await import(pathToFileURL(resolve('.build/renderer-adapter.mjs')).href);
 const server=createServer(async(req,res)=>{
  try {const file=resolve(extension,'media','.'+new URL(req.url,'http://local').pathname);if(!file.startsWith(extension+sep+'media'+sep))throw Error('Invalid asset path');res.setHeader('Content-Type',extname(file)==='.js'?'application/javascript':'text/css');res.end(await readFile(file));}catch{res.writeHead(404);res.end();}
 });
 await new Promise(r=>server.listen(0,'127.0.0.1',r));
 let browser;
 try {
  browser=await puppeteer.launch({headless:true,args:['--allow-file-access-from-files'],...(process.env.CHROME_BIN?{executablePath:process.env.CHROME_BIN}:{})});
  const base=`http://127.0.0.1:${server.address().port}`;
  for(const view of views) {
   const page=await browser.newPage();page.on('pageerror',e=>console.error(view.name,e.message));page.on('console',m=>{if(m.type()==='error')console.error(view.name,m.text());});await page.setViewport({width:view.name==='requirements'?850:1800,height:1200});
   await page.evaluateOnNewDocument(()=>{let seed=123456789;Math.random=()=>{seed=(1664525*seed+1013904223)>>>0;return seed/4294967296;};window.__exports=[];window.acquireVsCodeApi=()=>({postMessage:m=>window.__exports.push(m),getState:()=>null,setState:()=>{}});});
   let html=diagramShell({cspSource:base,asWebviewUri:x=>x},base.replace(/\/$/,''),'pinned-headless');
   // The upstream shell expects /media paths; our local asset server is rooted there.
   html=html.replaceAll(base+'/media/',base+'/');
   html=html.replace('</head>',`<style>:root{--vscode-foreground:#111;--vscode-input-background:#fff;--vscode-input-foreground:#111;--vscode-button-secondaryBackground:#eee;--vscode-button-border:#777;--vscode-charts-lines:#777;--vscode-editor-inactiveSelectionBackground:#eee;--vscode-focusBorder:#185c94;--vscode-menu-separatorBackground:#777;--vscode-errorForeground:#a52d2d;--vscode-editor-font-family:Arial;--vscode-charts-blue:#185c94;--vscode-charts-green:#276836;--vscode-charts-orange:#a35413;--vscode-charts-red:#a52d2d;--vscode-charts-purple:#6a4188;--vscode-charts-yellow:#8a6b12;--vscode-button-background:#185c94;--vscode-button-foreground:#fff;--vscode-font-family:Arial;--vscode-editor-background:#fff;--vscode-editor-foreground:#111;--vscode-panel-border:#888;--vscode-textLink-foreground:#12578c;--vscode-descriptionForeground:#333;--vscode-editorWidget-background:#fff;--vscode-contrastBorder:#777;--vscode-sideBar-background:#fafafa}</style></head>`);
   const path=resolve('.build',view.name+'.html');await writeFile(path,html);await page.goto(pathToFileURL(path).href);
   await page.waitForFunction(()=>window.__exports.some(x=>x.command==='webviewReady'),{timeout:30000});
   const model=models[view.file];if(!model?.elements?.length)throw Error('Empty model: '+view.file);
   const snapshot=modelSnapshot(model);
   // Upstream occurrence is a message ordinal, not elapsed seconds. Do not print it as time.
   snapshot.sequenceDiagrams=(snapshot.sequenceDiagrams||[]).map(d=>({...d,messages:d.messages.map(m=>({...m,occurrence:0,payload:m.name+' : '+(m.payload||'')}))}));
   const payload={...snapshot,currentView:view.view,explicitDiagram:true,readOnly:true,exportOnRender:true,exportRequestId:1};
   await page.evaluate(p=>window.postMessage(p,'*'),payload);
   try{await page.waitForFunction(()=>window.__exports.some(x=>['diagramSVG','renderError'].includes(x.command)),{timeout:60000});}catch(e){await page.screenshot({path:'.build/export-failure-'+view.name+'.png'});throw new Error(view.name+': '+e.message);}
   const exported=await page.evaluate(()=>window.__exports.find(x=>['diagramSVG','renderError'].includes(x.command)));
   if(exported.command==='renderError')throw Error(view.name+': '+exported.message);
   if(!exported.data.includes('<svg')||!exported.data.includes('<text'))throw Error('Empty SVG: '+view.name);
   const svg=await page.evaluate(data=>{const node=new DOMParser().parseFromString(data,'image/svg+xml').documentElement;node.style.position='absolute';node.style.top='-10000px';document.body.append(node);const content=node.querySelector('g');if(!content)throw Error('SVG has no diagram content');const b=content.getBBox();const x=b.x-24,y=b.y-24,w=Math.ceil(b.width)+48,h=Math.ceil(b.height)+48;node.setAttribute('viewBox',`${x} ${y} ${w} ${h}`);node.setAttribute('width',w);node.setAttribute('height',h);const bg=document.createElementNS('http://www.w3.org/2000/svg','rect');for(const [key,value] of Object.entries({x,y,width:w,height:h,fill:'#fff'}))bg.setAttribute(key,value);node.prepend(bg);node.removeAttribute('style');const result=new XMLSerializer().serializeToString(node);node.remove();return result;},exported.data);
   await writeFile('assets/diagrams/'+view.name+'.svg',svg);console.log('Rendered SysML v2:',view.name);await page.close();
  }
 }finally{if(browser)await browser.close();await new Promise(r=>server.close(r));}
}
