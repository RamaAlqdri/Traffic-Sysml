# AGENT.md — Project Rules and Context

## Project
**Smart Traffic Light Modeling using MBSE**

Repository ini adalah proyek akademik untuk memodelkan Smart Traffic Light yang menggunakan kepadatan kendaraan untuk menentukan prioritas dan durasi lampu hijau.

Output final:
- laporan LaTeX → PDF
- presentasi LaTeX Beamer → PDF
- model diagram-as-code
- traceability dan dokumentasi evidence

## Mandatory skills
Codex harus menggunakan:
1. `academic research`
2. `ponytail`

Keduanya wajib.

### academic research
Gunakan untuk:
- membaca dan menyintesis jurnal,
- extraction evidence,
- literature review,
- citation/bibliography checking,
- membedakan evidence dan asumsi.

### ponytail
Gunakan untuk:
- workflow proyek multi-step,
- pengelolaan pekerjaan multi-file,
- perencanaan dan tracking pekerjaan,
- iterasi/refinement proyek.

Jika mekanisme invocation skill tidak diketahui:
- inspeksi skill yang tersedia di environment,
- gunakan mekanisme resmi,
- jangan membuat syntax palsu,
- catat invocation aktual di `logs/progress.md`.

## Authoritative sources
Urutan otoritas:
1. Instruksi tugas dan materi kuliah yang disediakan pengguna.
2. Jurnal di `references/`.
3. Asumsi desain yang dinyatakan secara eksplisit.
4. Pengetahuan umum hanya untuk glue/explanation dan tidak boleh menggantikan evidence.

Jika terjadi konflik:
- dokumentasikan,
- prioritaskan instruksi tugas,
- jangan menyelesaikan konflik secara diam-diam.

## Reference policy
Folder `references/` sudah disiapkan pengguna.

Rules:
- jangan hapus,
- jangan overwrite,
- jangan rename tanpa kebutuhan,
- baca semua 3 referensi,
- jangan fabricate citation,
- jangan fabricate DOI,
- jangan fabricate numerical results,
- jangan mengutip hasil yang tidak ditemukan.

Setiap requirement harus memiliki salah satu:
- `source: lecture`
- `source: <journal>`
- `source: design-assumption`

## Modeling stack
### Mermaid
Wajib digunakan untuk:
- Requirement Diagram

Extension:
- `.mmd`

### PlantUML
Wajib digunakan untuk:
- Use Case Diagram
- Activity Diagram
- Sequence Diagram
- State Machine Diagram
- Block Definition Diagram (BDD)
- Internal Block Diagram (IBD)

Extension:
- `.puml`

PlantUML dipakai sebagai diagram-as-code. Jika stereotype SysML penuh tidak tersedia, gunakan representasi PlantUML yang paling jelas dan konsisten, serta jelaskan mapping ke konsep SysML di laporan.

## LaTeX stack
Laporan:
- LaTeX modular
- BibLaTeX/Biber atau BibTeX; pilih satu dan konsisten

Presentasi:
- Beamer

Prefer:
- source text sebagai source of truth
- diagram SVG/PDF untuk kualitas vektor bila toolchain mendukung

## Project structure
Target:

```
.
├── AGENT.md
├── references/
├── research/
├── model/
│   ├── requirements/
│   ├── behavior/
│   ├── structure/
│   └── traceability/
├── assets/
│   └── diagrams/
├── report/
│   ├── main.tex
│   └── sections/
├── presentation/
│   └── main.tex
└── logs/
```

Buat folder yang belum ada, tetapi jangan merusak struktur existing.

## Scope system
System of Interest:
**Smart Traffic Light System**

Minimum capability:
- memperoleh data kendaraan/kepadatan,
- menghitung atau menginterpretasikan tingkat kepadatan,
- menentukan ruas prioritas,
- menyesuaikan green time,
- mengendalikan sinyal lampu,
- menghindari conflicting green state.

Opsional hanya bila punya rationale:
- dashboard operator,
- fail-safe mode,
- emergency vehicle priority,
- min/max green time.

Jangan memasukkan fitur hanya agar model terlihat kompleks.

## Model consistency rules
Nama konsep harus konsisten lintas semua artefak.

Contoh:
Jika block bernama `Traffic Controller`, jangan secara acak menggunakan:
- `Main Controller`
- `Smart Controller`
- `Signal Brain`

kecuali definisi memang berbeda.

Setiap:
- actor
- use case
- activity
- block
- message
- state

harus konsisten dan traceable bila relevan.

## Requirement writing rules
Requirement harus:
- atomic,
- testable/verifiable,
- tidak ambigu,
- tidak menggabungkan banyak kewajiban dalam satu statement.

Gunakan format:
- ID
- Name
- Statement
- Type
- Source
- Rationale
- Verification Method
- Trace

Gunakan kata "shall" pada versi Inggris atau "harus" pada versi Indonesia secara konsisten.

## Evidence policy
Jangan menyamakan:
- literature finding,
- system requirement,
- design choice.

Contoh:
"Jurnal X menggunakan CNN" ≠ sistem tugas harus menggunakan CNN.

Jika desain mengambil inspirasi tanpa mewajibkan teknologi jurnal:
jelaskan sebagai design rationale.

## Academic writing rules
Bahasa default laporan: Bahasa Indonesia akademik.

Istilah teknis dapat menggunakan bahasa Inggris bila lebih presisi.

Hindari:
- klaim bombastis,
- "terbukti" tanpa evidence,
- angka tanpa sumber,
- fabricated benchmark,
- fabricated simulation.

Semua kutipan/sitasi harus dapat ditelusuri.

## Diagram rules
Setiap diagram:
- memiliki judul/caption,
- punya tujuan,
- tidak berdiri sendiri tanpa narasi,
- dirujuk dalam laporan,
- source text tersimpan.

Diagram harus terbaca saat dimasukkan ke PDF.

## Traceability rules
Minimal:
Requirement → Behavioral Element → Structural Element → Verification Scenario

Buat matrix.

Tidak boleh ada requirement utama tanpa implementasi/model.
Tidak boleh ada fungsi utama yang tidak punya rationale.

## Verification rules
Jika tidak ada implementasi/simulator nyata:
gunakan istilah:
- verification scenario
- expected behavior
- conceptual validation

Jangan menyebut:
- experimental result
- measured performance
- achieved improvement

tanpa data nyata.

## Logging policy
Folder `logs/` wajib.

### `logs/progress.md`
Append:
- timestamp
- stage
- action
- files changed
- validation
- next step
- skills used

### `logs/decisions.md`
Gunakan format ADR ringan:
- Decision
- Context
- Options
- Chosen
- Rationale
- Consequences

### `logs/issues.md`
Catat:
- issue
- severity
- cause
- attempted fix
- status

### `logs/build.md`
Catat:
- command
- tool version bila relevan
- result
- warnings
- errors

Jangan hapus history.

## Build policy
Sebelum selesai:
- render Mermaid
- render PlantUML
- compile report
- compile presentation
- check bibliography
- check missing references
- check diagram readability

Jika build gagal:
- perbaiki jika memungkinkan,
- log error,
- jangan menyatakan sukses sebelum benar-benar sukses.

## Safety for repository
Dilarang:
- `rm -rf` terhadap root proyek,
- menghapus reference,
- overwrite source pengguna tanpa backup/rationale,
- mengubah banyak file di luar scope.

Sebelum refactor besar:
- inspeksi struktur,
- lakukan perubahan minimal,
- catat keputusan.

## Definition of Done
Proyek selesai hanya jika tersedia:
- literature review berbasis 3 referensi,
- requirement catalog,
- Mermaid Requirement Diagram,
- PlantUML Use Case,
- PlantUML Activity,
- PlantUML Sequence,
- PlantUML State Machine,
- PlantUML BDD,
- PlantUML IBD,
- traceability matrix,
- verification scenarios,
- laporan LaTeX,
- presentasi Beamer,
- bibliography,
- diagram render,
- logs,
- hasil build atau documented build limitation.

Dan:
- `academic research` digunakan,
- `ponytail` digunakan.

## Communication
Jangan bertanya untuk detail yang dapat disimpulkan dari repository dan sumber.
Jika ada ambiguity yang materially mengubah desain, dokumentasikan asumsi terbaik di:
`research/design-assumptions.md`
dan lanjutkan secara konservatif.
