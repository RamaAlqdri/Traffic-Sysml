import {spawn} from 'node:child_process';
import {createRequire} from 'node:module';
import {pathToFileURL} from 'node:url';
const require = createRequire(import.meta.url);
export async function openModelServer(root) {
  const child = spawn(process.execPath, [require('sysml-v2-lsp').serverPath, '--stdio'], {stdio:['pipe','pipe','pipe']});
  let buffer = Buffer.alloc(0), next = 0;
  const pending = new Map(), diagnostics = new Map();
  const send = value => {const b=Buffer.from(JSON.stringify(value));child.stdin.write(`Content-Length: ${b.length}\r\n\r\n`);child.stdin.write(b);};
  child.stderr.on('data', b => process.stderr.write(b));
  child.stdout.on('data', b => {
    buffer=Buffer.concat([buffer,b]);
    while(true) {
      const end=buffer.indexOf('\r\n\r\n');if(end<0)return;
      const size=Number(/Content-Length: (\d+)/i.exec(buffer.subarray(0,end).toString())?.[1]);
      if(!Number.isFinite(size))throw new Error('Invalid LSP framing');
      if(buffer.length<end+4+size)return;
      const msg=JSON.parse(buffer.subarray(end+4,end+4+size));buffer=buffer.subarray(end+4+size);
      if(msg.method && msg.id!==undefined) {
        send({jsonrpc:'2.0',id:msg.id,result:msg.method==='workspace/configuration'?msg.params.items.map(item=>item.section==='sysml.experimental'?{validateText:{enabled:true,maxDocuments:30,maxLines:10000,maxCharacters:200000,maxTotalCharacters:1000000}}:item.section==='sysml.workspace'?{preloadOnOpen:'never'}:{}):null});
      } else if(msg.method==='textDocument/publishDiagnostics')diagnostics.set(msg.params.uri,msg.params.diagnostics);
      else if(pending.has(msg.id)){const p=pending.get(msg.id);pending.delete(msg.id);clearTimeout(p.timer);msg.error?p.reject(new Error(JSON.stringify(msg.error))):p.resolve(msg.result);}
    }
  });
  child.on('exit',code=>{for(const p of pending.values()){clearTimeout(p.timer);p.reject(new Error(`SysML LSP exited ${code}`));}pending.clear();});
  const request=(method,params)=>new Promise((resolve,reject)=>{const id=++next;const timer=setTimeout(()=>{pending.delete(id);reject(new Error(`LSP timeout: ${method}`));child.kill();},120000);pending.set(id,{resolve,reject,timer});send({jsonrpc:'2.0',id,method,params});});
  const notify=(method,params)=>send({jsonrpc:'2.0',method,params});
  try {
    await request('initialize',{processId:process.pid,rootUri:pathToFileURL(root).href,workspaceFolders:[{uri:pathToFileURL(root).href,name:'Traffic'}],capabilities:{workspace:{configuration:true,workspaceFolders:true}}});
    notify('initialized',{});
  } catch(e){child.kill();throw e;}
  return {request,notify,diagnostics,close:()=>child.kill()};
}
