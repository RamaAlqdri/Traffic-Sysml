import { writeFileSync } from 'node:fs';
import { execFileSync } from 'node:child_process';

const style = 'graph [bgcolor="transparent",pad=.16,nodesep=.35,ranksep=.42,fontname="Helvetica"]; node [shape=box,style="rounded,filled",fillcolor="#EEF2FB",color="#405681",fontname="Helvetica",fontsize=13,margin=".15,.09"]; edge [color="#405681",fontcolor="#263651",fontname="Helvetica",fontsize=11,arrowsize=.7];';
const quote = JSON.stringify;
const edge = (from, to, label = '', attrs = '') =>
  `${quote(from)} -> ${quote(to)} [label=${quote(label)} ${attrs}];`;
const node = (id,label,attrs='') => `${quote(id)} [label=${quote(label)} ${attrs}];`;
function svg(body) {
  return execFileSync('dot', ['-Tsvg'], {
    input: `digraph { ${style}\n${body.join('\n')} }`, encoding:'utf8',
  });
}
function render(name,body){
  writeFileSync(`assets/diagrams/${name}.svg`,svg(body));
}
function panel(markup,x,y){
  const [width,height]=markup.match(/viewBox="0.00 0.00 ([\d.]+) ([\d.]+)"/).slice(1).map(Number);
  return {width,height,markup:`<g transform="translate(${x},${y})">${markup.slice(markup.indexOf('>',markup.indexOf('<svg'))+1,markup.lastIndexOf('</svg>'))}</g>`};
}

export function renderBehaviorViews(models,sources) {
  const use = 'model/behavior/use-case.sysml';
  const cases = models[use].elements[0].children.filter(element=>element.type==='use case def');
  const names = {ObserveTraffic:'Amati kondisi kendaraan',ServeApproach:'Layani pendekat',MaintainSafeSignals:'Jaga keselamatan sinyal',HandleDataFailure:'Tangani gangguan data'};
  const actors = new Set();
  const useEdges = [];
  for (const element of cases) for (const member of element.children) {
    const type = member.attributes.partType;
    if(member.type==='actor'){
      actors.add(type);
      useEdges.push(edge(type,element.name,'','dir=none'));
    }
    if(member.type==='include use case') useEdges.push(edge(element.name,type,'«include»','style=dashed'));
  }
  for (const match of sources[use].matchAll(/\bdependency \w+ from (\w+) to (\w+);/g)){
    useEdges.push(edge(match[1],match[2],'dependency\n[dataFault]','style=dashed'));
  }
  render('use-case', [
    'rankdir=LR;',
    ...Array.from(actors, actor=>node(actor,`«aktor eksternal»\n${actor}`,'shape=plaintext style=""')),
    'subgraph cluster_system { label="SmartTrafficLightSystem"; color="#96A6C2"; style=rounded; margin=18;',
    ...cases.map(c=>node(c.name,`${c.shortName}\n${names[c.name] ?? c.name}`,'shape=ellipse style=filled')),
    '{rank=same; ObserveTraffic; ServeApproach;}',
    '}',
    ...useEdges,
  ]);

  const activity = 'model/behavior/activity.sysml';
  const graph = models[activity].activityDiagrams.find(view=>view.name==='ManageTraffic');
  const labels = {start:'Mulai',done:'Selesai',startup:'Semua merah 1 s',loopTop:'Siklus kendali',runningNow:'Masih Running?',acceptEvent:'Terima kejadian',eventKind:'Sampel / detak?',validateFrame:'Validasi data',cacheOk:'Data segar dan valid?',classify:'Klasifikasikan hitungan',advanceTimer:'Majukan pewaktu',boundaryNow:'Batas fase aman?',selectMode:'Pilih mode',rank:'Urutkan pendekat',planOk:'Rencana layak?',prepare:'Siapkan durasi',apply:'Terapkan perintah',markServed:'Catat giliran',stmStep:'Jalankan transisi',holdRequest:'Minta SafetyHold'};
  const decisions = new Set(graph.decisions.map(d=>d.name));
  const edges = [];
  let previous, decision;
  // The language server's activity flows omit else branches. Read the validated
  // succession clauses to retain both paths and their decision labels.
  const clauses = sources[activity].split(/\bfirst start;/)[1];
  if (!clauses) throw new Error('Missing ManageTraffic initial succession');
  previous='start';
  for(const match of clauses.matchAll(/\b(first|then|if|else)\s+(\w+)(?:\s+then\s+(\w+))?\s*;/g)){
    const [,kind,a,b]=match;
    if(kind==='first'){
      previous=a;
      if(b) edges.push([a,b,'']);
    }else if(kind==='then'){
      edges.push([previous,a,'']);
      previous=a;
    }else if(kind==='if'){
      decision=previous;
      edges.push([decision,b,'Ya']);
    }else{
      edges.push([decision,a,'Tidak']);
    }
  }
  const second = new Set(['boundaryNow','selectMode','rank','planOk','prepare','apply','markServed','stmStep','holdRequest']);
  const panels=[false,true].map(right=>{
    const own=id=>second.has(id)===right;
    const portal=id=>({boundaryNow:'A',loopTop:'B',advanceTimer:'A',stmStep:'B',holdRequest:'B'})[id];
    const links=edges.filter(([a])=>own(a));
    if(right) links.unshift(['A','boundaryNow','']);
    else links.push(['B','loopTop','']);
    return svg([
      'rankdir=TB; nodesep=.24; ranksep=.27;',
      ...Object.entries(labels).filter(([id])=>own(id)).map(([id,label])=>node(id,label,decisions.has(id)?'shape=diamond style=filled fillcolor="#FFF2D2"':id==='start'||id==='done'||id==='loopTop'?'shape=oval style=filled':'')),
      node('A','A','shape=circle width=.32 fixedsize=true'),
      node('B','B','shape=circle width=.32 fixedsize=true'),
      ...links.map(([a,b,label])=>edge(a,own(b)||b==='A'||b==='B'?b:portal(b),label,b==='loopTop'?'constraint=false':'')),
    ]);
  });
  const left=panel(panels[0],0,33);
  const right=panel(panels[1],left.width+25,33);
  const width=left.width+right.width+25;
  const height=Math.max(left.height,right.height)+43;
  writeFileSync('assets/diagrams/activity.svg',
    `<svg xmlns="http://www.w3.org/2000/svg" width="${width}pt" height="${height}pt" viewBox="0 0 ${width} ${height}">
    <g font-family="Helvetica" font-size="16" font-weight="bold" text-anchor="middle" fill="#263651">
    <text x="${left.width/2}" y="22">1. Terima kejadian dan periksa data</text>
    <text x="${left.width+25+right.width/2}" y="22">2. Tentukan fase berikutnya</text></g>
    ${left.markup}${right.markup}</svg>`);

  const state = models['model/behavior/state-machine.sysml'];
  const stateNames={startup:'Startup\nSemua merah',ready:'Ready\nPilih rencana',green:'Green\nSatu pendekat',yellow:'Yellow\nPendekat aktif',clearance:'Clearance\nSemua merah',safetyHold:'SafetyHold\nSemua merah'};
  const triggers={'after1[s]':'1 s','grant:GrantEvent':'Grant sah (10–30 s)','rejected:GrantEvent':'Grant di luar batas','afterlockedGreen':'Durasi hijau habis','after3[s]':'3 s','invalid:InvalidCommandEvent':'Perintah tidak sah','infeasible:InfeasiblePlanEvent':'Rencana tidak layak','restartEvent:RestartEvent':'Restart'};
  render('state-machine',[
    'rankdir=LR; compound=true; nodesep=.55; ranksep=.55;',
    node('initial','','shape=point width=.12'),
    'subgraph cluster_running { label="Running"; color="#96A6C2"; style=rounded; margin=18;',
    ...Object.entries(stateNames).filter(([k])=>k!=='safetyHold').map(([k,v])=>node(k,v)),
    '}',
    node('safetyHold',stateNames.safetyHold,'fillcolor="#FFF2D2"'),
    edge('initial','startup'),
    ...state.relationships.filter(r=>r.type==='transition').map(r=>edge(
      r.source==='running'?'clearance':r.source,r.target==='running'?'startup':r.target,
      triggers[r.name]??r.name,
      `${r.source==='running'?'ltail=cluster_running ':''}${r.target==='running'?'lhead=cluster_running ':''}${r.target==='ready'&&r.source==='clearance'||r.target==='running'?'constraint=false':''}`,
    )),
  ]);
}
