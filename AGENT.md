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
1. `academic-research-suite` (padanan `academic research` di environment ini)
2. `ponytail` (skill terpasang: `ponytail:ponytail`)

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

## Lecture prerequisite

Materi kuliah MBSE/SysML asli **wajib tersedia dan diperiksa sebelum modeling (Tahap 2–7)**. Lokasi default `lecture/mbse-material.pdf`; nama/format lain diperbolehkan bila identitas dan lokasinya dicatat. File placeholder tidak memenuhi gate.

Jika belum tersedia:
- selesaikan audit dan persiapan independen; literature review boleh berjalan,
- catat blocker di `logs/issues.md` dan status gate di `logs/progress.md`,
- jangan menyatakan Tahap 0 lulus penuh, membuat model, atau menggantikan materi kuliah dengan jurnal/sumber web secara diam-diam.

Metadata PDF bukan bukti analisis isi. Jangan membuat file kuliah atau mengklaim sudah membacanya jika sumber belum tersedia.

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

Setiap requirement harus memiliki `source` berupa satu atau lebih ID terdaftar:
- `EVID-TRF-*`: evidence jurnal traffic,
- `EVID-MBSE-*`: evidence jurnal MBSE,
- `EVID-LEC-*`: evidence materi kuliah,
- `ASM-*`: asumsi desain di `research/design-assumptions.md`.

Jangan memakai label umum `lecture`, `journal-1`, atau `design-assumption` sebagai satu-satunya source. Evidence matrix menyimpan `ID`, `Source` (file dan identitas/citation key), `Page/Section` (halaman PDF/cetak, bagian/tabel/gambar), `Claim`, `Exact context`, `Used for`, `Confidence` beserta alasan, dan `Notes`. Confidence menilai dukungan klaim, bukan sertifikasi kebenaran sumber. Lokasi belum terverifikasi harus ditandai; asumsi tidak boleh disamarkan sebagai evidence.

## Modeling stack

**Model wajib mengikuti SysML. Mermaid dan PlantUML hanya textual rendering tools untuk merepresentasikan elemen dan relasi SysML secara konsisten.** Semantik model tidak ditentukan oleh sintaks renderer.

Sebelum modeling, catat versi SysML dan subset/notasi yang dipakai berdasarkan materi kuliah. Jangan mencampur versi. Kepatuhan yang dinyatakan harus dibatasi pada pemeriksaan yang benar-benar dilakukan; rendering bukan bukti kepatuhan formal.

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

Mermaid/PlantUML dipakai untuk rendering diagram-as-code. Jika notasi SysML tidak didukung langsung, gunakan stereotype/label/anotasi eksplisit dan dokumentasikan pemetaannya. Keterbatasan tool tidak membolehkan perubahan atau pelemahan semantik SysML. Jika representasi belum memadai, catat issue dan perbaiki sebelum QC model dinyatakan lulus.

Dalam bagian **Pemetaan SysML** di `model/traceability/traceability-matrix.md`, catat ID elemen, jenis SysML, owner/context, file/view, alias/notasi renderer, relasi beserta jenis/arah/endpoint, dan keterbatasan representasi. Gunakan ID yang sama untuk elemen yang sama lintas view; pemetaan tidak membuat model terpisah untuk setiap tool.

Aturan semantik minimum:
- Requirement, behavior, structure, dan verification harus memiliki hubungan bermakna yang eksplisit.
- BDD mendefinisikan block/type; IBD merepresentasikan part usage, port, connector, dan flow dalam context block. Part harus ditautkan ke type BDD yang sesuai.
- Actor/use case, activity/action, interaction/message, state/transition, block/part, port, connector, serta verification/test case harus dibedakan sesuai konsep SysML yang dipakai.
- Relasi `satisfy`, `verify`, `deriveReqt`, `refine`, dan `allocate` digunakan bila relevan dengan jenis, arah, dan endpoint yang dijelaskan; panah generik tanpa pemetaan tidak cukup.
- Katalog requirement, definisi elemen/relasi, traceability, dan source diagram bersama-sama merepresentasikan model SysML yang konsisten. Gambar hasil render merupakan artefak turunan.

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
├── MASTER_PROMPT.md
├── Makefile
├── references/
├── lecture/
│   └── mbse-material.pdf  # materi pengguna; jangan membuat placeholder PDF
├── research/
├── model/
│   ├── requirements/
│   ├── behavior/
│   ├── structure/
│   ├── traceability/
│   └── verification/
│       └── verification-scenarios.md
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
- menangani sensor/data invalid, hilang, atau stale, termasuk fail-safe/default timing dan pemulihan.
- memenuhi minimum green, maximum green, maximum waiting time/anti-starvation, dan interval keputusan yang terdefinisi.

Opsional hanya bila punya rationale:
- dashboard operator,
- emergency vehicle priority,

Fail-safe minimum dan min/max green bukan fitur opsional.

Jangan memasukkan fitur hanya agar model terlihat kompleks.

### Baseline desain

Gunakan baseline ini hanya bila instruksi tugas/materi kuliah/evidence relevan tidak menetapkan lain. Catat sebagai asumsi, bukan fakta jurnal:

- Satu simpang empat lengan North/South/East/West, satu pendekat terkendali per arah; jumlah lajur harus didefinisikan tersendiri.
- Fase pejalan kaki dan fase belok khusus di luar baseline. Definisikan gerakan, fase yang diizinkan, dan matriks konflik sebelum modeling; jangan mengasumsikan pasangan arah aman bersamaan.
- Input `vehicleCount` per pendekat pada `observationInterval`. Definisikan area/titik pengamatan dan apakah menghitung kendaraan lewat atau kendaraan dalam area. Hitungan adalah proksi, bukan otomatis kepadatan fisik.
- Normalisasi terhadap kapasitas jika tersedia dan sebanding secara satuan/basis pengamatan. Jika tidak tersedia, gunakan kategori rendah/sedang/tinggi dengan ambang yang terdokumentasi sebagai `ASM-*`.
- Prioritas nominal: kepadatan tertinggi → waktu tunggu terlama → round-robin deterministik. Definisikan kesetaraan nilai/kategori, urutan awal, dan update pointer.
- Pada batas fase yang aman, kebutuhan memenuhi maximum waiting time mengalahkan prioritas kepadatan. Verifikasi kelayakannya terhadap jumlah fase, minimum green, dan waktu transisi.
- Tetapkan `minimumGreen`, `maximumGreen`, `maximumWaitingTime`, `observationInterval`, `decisionUpdateInterval`, serta batas stale, satuan dan definisi awal/reset waktu tunggu. Utamakan angka sumber yang relevan; jika tidak ada, beri ID `ASM-*`, rationale, keterbatasan, dan metode verifikasi. Angka contoh bukan fakta atau nilai default tanpa dasar.
- Keputusan di batas siklus kontrol/fase yang terdefinisi sesuai interval keputusan. Sampel baru tidak terus mengubah durasi green aktif. Jelaskan pembulatan/penundaan interval yang jatuh di tengah fase. Interlock keselamatan dan failure handling tidak harus menunggu batas keputusan nominal.
- Definisikan transisi keselamatan, termasuk yellow/all-red bila digunakan, kondisi fallback, dan syarat kembali ke mode normal. Nyatakan cakupan jaminan waktu tunggu nominal serta keterbatasan saat kegagalan.

Perubahan baseline harus mengutip sumber/rationale, dicatat di `logs/decisions.md`, dan diterapkan konsisten ke requirement, model, skenario verifikasi, laporan, dan slide.

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
- Source (`EVID-*`/`ASM-*`, lokasi melalui evidence matrix)
- Rationale
- Verification Method
- Trace

Gunakan kata "shall" pada versi Inggris atau "harus" pada versi Indonesia secara konsisten.
Setiap `ASM-*` harus menjelaskan keputusan/nilai, satuan bila relevan, rationale, sumber yang sudah diperiksa, dampak, dan cara verifikasi. Semua parameter harus cukup jelas untuk diuji sebelum gate requirements lulus.

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
Evidence/Assumption → Requirement → Behavioral Element → Structural Element → Verification Scenario

Buat matrix.
Gunakan ID elemen stabil; periksa dua arah. Keterhubungan diagram saja tidak membuktikan pemenuhan requirement.

Tidak boleh ada requirement utama tanpa implementasi/model.
Tidak boleh ada fungsi utama yang tidak punya rationale.

## Verification rules

Simpan skenario di `model/verification/verification-scenarios.md`. Setiap `VER-*` mencantumkan requirement, kondisi awal, input/timeline, stimulus, expected behavior, kriteria lulus/gagal, metode, status `not-run`/`passed`/`failed`/`blocked`, dan bukti jika sudah diperiksa.

Cakup kepadatan seimbang/timpang/berubah; tie-break dan round-robin; minimum/maximum green; maximum waiting time/anti-starvation; update di batas fase; transisi/conflicting green; data invalid/hilang/stale, fallback, dan pemulihan. Periksa kelayakan kombinasi batas waktu. Expected behavior yang belum diperiksa tidak berstatus `passed`; walkthrough/analisis model harus mencatat langkah dan bukti, tanpa klaim pengujian perangkat nyata.
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

Entry point dari root: `make build`. Build harus memeriksa prasyarat, merender tujuh diagram, lalu mengompilasi laporan dan presentasi; gagal dengan exit code nonzero jika ada tahap gagal, dan append output/command/versi ke `logs/build.md`. Gunakan konfigurasi lokal yang tercatat, dependency lockfile bila relevan, serta satu engine LaTeX dan satu backend bibliography. Sesuai revisi pengguna 5 November 2026, laporan wajib mengikuti template UB yang dicatat di report/TEMPLATE-UB.md dengan Calibri asli, XeLaTeX dan Biber. Presentasi mandiri tetap pdfLaTeX/BibTeX; masing-masing artefak memakai satu backend konsisten. Jangan memakai versi `latest` sebagai spesifikasi reproducibility. Catat font dan toolchain; satu command saja tidak menjamin hasil identik lintas mesin.
Sebelum selesai:
- render Mermaid
- render PlantUML
- compile report
- compile presentation
- check bibliography
- check missing references
- check diagram readability
- check semantik SysML dan pemetaan notasi, ownership/type-part, serta jenis/arah/endpoint relasi; parsing/rendering saja tidak memverifikasi semuanya

Jika build gagal:
- perbaiki jika memungkinkan,
- log error,
- jangan menyatakan sukses sebelum benar-benar sukses.
- tandai `build-unverified`; dokumentasi kegagalan tidak memenuhi Definition of Done.

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
- `make build` berhasil untuk source terkini dan PDF final yang sudah diperiksa.

Dan:
- `academic research` digunakan,
- `ponytail` digunakan.
- versi/subset SysML dan pemetaan renderer terdokumentasi,
- kesesuaian semantik SysML serta konsistensi antar-view diperiksa terpisah dari keberhasilan render.

### Milestone dan status build

- `source-complete`: seluruh source research/evidence/asumsi, requirements, tujuh diagram, traceability, verification scenarios, bibliography, laporan, presentasi, dan build configuration tersedia serta konsisten secara statis; belum berarti build sukses.
- `build-unverified`: penanda build belum dijalankan/berhasil diverifikasi untuk source terkini, termasuk tool tidak tersedia atau build gagal; dapat menyertai `source-complete`, bukan milestone sukses.
- `build-verified`: seluruh diagram dirender dan kedua LaTeX berhasil dikompilasi tanpa error kritis, missing images/references, atau unresolved citations. Exit code saja tidak cukup; periksa log.
- `release-complete`: source-complete dan build-verified terpenuhi, PDF final tersedia dan diperiksa visual, citation/evidence/traceability/terminologi serta semantik SysML lolos QC, warning signifikan ditangani atau diberi disposition, dan log mutakhir.

Hanya `release-complete` berarti **proyek selesai**. Perubahan source/toolchain membuat verifikasi build sebelumnya kedaluwarsa; tandai `build-unverified` dan ulangi build/pemeriksaan terdampak. Starter belum mencapai `source-complete`. Keterbatasan yang dicatat tidak menggantikan keberhasilan build.

## Communication
Jangan bertanya untuk detail yang dapat disimpulkan dari repository dan sumber.
Jika ada ambiguity yang materially mengubah desain, dokumentasikan asumsi terbaik di:
`research/design-assumptions.md`
dan lanjutkan secara konservatif.
