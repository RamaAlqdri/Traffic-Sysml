"""Generate the catalogue and report cards from validated SysML requirement documentation."""
from pathlib import Path
import json
import re
import sys
root = Path(__file__).resolve().parents[1]
data = json.loads((root / '.build/sysml-contract.json').read_text())
groups = {'Functional': 'Fungsional (F)', 'Performance': 'Kinerja dan batas waktu (P)', 'Safety': 'Keselamatan (S)', 'Interface': 'Antarmuka (I)', 'Reliability/Failure Handling': 'Keandalan dan penanganan kegagalan (R)', 'Design Constraint': 'Batasan desain (D)'}
def tex(value):
    # Model documentation is text, never executable LaTeX.
    escapes = {'\\': r'\textbackslash{}', '{': r'\{', '}': r'\}', '$': r'\$', '#': r'\#', '&': r'\&', '%': r'\%', '_': r'\_', '^': r'\textasciicircum{}', '~': r'\textasciitilde{}', '≥': r'$\geq$', '→': r'$\rightarrow$'}
    return ''.join(escapes.get(char, char) for char in value)
assert tex(r'\input{secret}') == r'\textbackslash{}input\{secret\}', 'Model text must not become a TeX command'
intro = (root / 'report/sections/04-requirements.tex').read_text().split(r'\Needspace', 1)[0]
report = [intro]
md = ['# Katalog requirement baseline\n\nDihasilkan dari `model/requirements/requirements.sysml` melalui `make build`. Berkas `.sysml` adalah sumber utama; jangan mengedit keluaran ini secara terpisah. Seluruh nilai baseline tetap asumsi ASM-*. Verification method bukan verdict passed.\n']
last = None
for req in data['requirements']:
    fields = dict(re.findall(r'^([\w ]+): (.*)$', req['documentation'], re.M))
    assert set(fields) == {'Name', 'Type', 'Statement', 'Source', 'Rationale', 'Verification Method', 'Trace'}, req['id']
    md.append('\n## ' + req['id'] + ' — ' + fields['Name'] + '\n' + '\n'.join('- ' + k + ': ' + fields[k] for k in ['Type', 'Statement', 'Source', 'Rationale', 'Verification Method', 'Trace']) + '\n')
    if fields['Type'] != last:
        last = fields['Type']
        report.append(r'\Needspace{16\baselineskip}' + '\n' + r'\subsection{' + groups[last] + '}\n\n')
    args = [req['id'] + ' --- ' + fields['Name'], fields['Statement'], fields['Source'], fields['Rationale'], fields['Verification Method'].replace('; ', ' / '), fields['Trace'] + '.']
    report.append('\\requirementcard\n' + ''.join('{' + tex(v) + '}\n' for v in args) + '\n')
report.append('\\clearpage\n')
for name, content in [('model/requirements/requirements.md', ''.join(md)), ('report/sections/04-requirements.tex', ''.join(report))]:
    path = root / name
    if '--check' in sys.argv:
        assert path.read_text() == content, 'Stale generated requirement view: ' + name
    elif not path.exists() or path.read_text() != content:
        path.write_text(content)
print('24 SysML requirements synchronized to catalogue/report cards.')
