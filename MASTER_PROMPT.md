# MASTER PROMPT — Smart Traffic Light MBSE Project

Anda adalah coding/research agent yang bekerja di repository lokal untuk menyelesaikan proyek akademik **Model-Based Systems Engineering (MBSE) — Smart Traffic Light berbasis kepadatan kendaraan**.

## Tujuan akhir
Hasil akhir proyek harus berupa:

1. **Laporan akademik dalam LaTeX** yang dapat dikompilasi ke PDF.
2. **Presentasi dalam LaTeX Beamer** yang dapat dikompilasi ke PDF.
3. Model sistem menggunakan kombinasi:
   - **Mermaid** untuk Requirement Diagram.
   - **PlantUML** untuk Use Case, Activity, Sequence, State Machine, BDD, dan IBD.
4. Semua klaim akademik penting harus ditopang oleh referensi di folder `references/`.
5. Progres pekerjaan harus dicatat di folder `logs/`.

## Skill wajib
Dua skill Codex berikut **WAJIB digunakan** selama pengerjaan proyek:
- `academic research`
- `ponytail`

Aturan:
- Sebelum melakukan penulisan akademik atau sintesis literatur, aktifkan/gunakan skill `academic research`.
- Sebelum atau selama perencanaan/pelaksanaan pekerjaan multi-file dan iteratif, aktifkan/gunakan skill `ponytail`.
- Jangan mengklaim skill telah digunakan bila belum benar-benar dipanggil.
- Jika nama invocation/sintaks skill berbeda di environment lokal, inspeksi skill yang terpasang dan gunakan mekanisme resmi yang tersedia.
- Catat penggunaan skill di `logs/progress.md`.

## Sumber wajib
Gunakan:
1. Materi kuliah MBSE/SysML yang tersedia di proyek.
2. Tiga referensi jurnal yang sudah ada pada folder `references/`:
   - 2 jurnal mengenai traffic/adaptive traffic signal/vehicle density.
   - 1 jurnal mengenai MBSE.
3. Jangan mengganti jurnal tersebut tanpa alasan yang terdokumentasi.
4. Jangan membuat kutipan, DOI, judul, hasil eksperimen, angka, atau kesimpulan yang tidak ditemukan pada sumber.
5. Jika sebuah informasi tidak ditemukan di sumber, tuliskan bahwa informasi tersebut merupakan **asumsi desain**, bukan temuan jurnal.

## Prinsip pengerjaan
Kerjakan proyek dari awal secara bertahap dan dapat diaudit.

### Tahap 0 — Audit repository
- Baca `AGENT.md`.
- Inventarisasi seluruh file.
- Periksa isi `references/`.
- Identifikasi materi kuliah.
- Verifikasi tool lokal:
  - LaTeX compiler (`latexmk`, `pdflatex`, atau `xelatex`)
  - Mermaid CLI jika tersedia
  - PlantUML / Java jika tersedia
- Jangan menghapus file pengguna.
- Jangan memindahkan isi `references/` tanpa kebutuhan.

### Tahap 1 — Literature review
Gunakan skill `academic research`.

Untuk setiap jurnal:
- identitas bibliografi,
- masalah penelitian,
- tujuan,
- metode,
- input,
- output,
- temuan utama,
- limitation,
- relevansi terhadap Smart Traffic Light,
- bagian mana yang boleh dipakai sebagai dasar requirement.

Buat:
- `research/literature-review.md`
- `research/evidence-matrix.md`
- `research/design-assumptions.md`

Bedakan secara tegas:
- **evidence dari jurnal**
- **materi kuliah**
- **asumsi desain kelompok**

### Tahap 2 — Problem formulation
Susun:
- latar belakang,
- rumusan masalah,
- tujuan sistem,
- scope,
- out-of-scope,
- stakeholder,
- operational scenario.

Sistem minimal:
- mendeteksi atau menerima data kepadatan kendaraan,
- membandingkan kepadatan antarruas,
- menentukan prioritas,
- memberikan green time lebih lama kepada ruas yang lebih padat,
- tetap menjaga constraint keselamatan.

Jangan menambahkan AI/ML jika tidak diperlukan oleh referensi/desain.

### Tahap 3 — Requirements
Buat katalog requirement yang traceable.

Minimal kelompok:
- Functional Requirements
- Performance Requirements
- Safety Requirements
- Interface Requirements
- Reliability/Failure Handling
- Design Constraints

Setiap requirement:
- ID unik (`REQ-F-001`, dst.)
- statement
- rationale
- source
- verification method
- traceability

Buat:
- `model/requirements/requirements.md`
- `model/requirements/requirements.mmd`

Requirement Diagram harus dibuat dengan **Mermaid**.

### Tahap 4 — Behavioral model
Gunakan **PlantUML**.

Buat:
- `model/behavior/use-case.puml`
- `model/behavior/activity.puml`
- `model/behavior/sequence.puml`
- `model/behavior/state-machine.puml`

Ketentuan:
- nama elemen konsisten dengan requirements,
- skenario utama harus traceable,
- jangan membuat diagram dekoratif yang tidak menjawab requirement.

### Tahap 5 — Structural model
Gunakan **PlantUML**.

Buat:
- `model/structure/bdd.puml`
- `model/structure/ibd.puml`

Model minimal mempertimbangkan:
- Vehicle Detection / Sensor
- Density Analysis
- Traffic Controller
- Signal Controller
- Traffic Lights
- Operator/Monitoring Interface jika relevan

BDD menjelaskan definisi blok/komponen.
IBD menjelaskan hubungan internal, port/interface, dan flow data/command.

### Tahap 6 — Traceability
Buat:
- `model/traceability/traceability-matrix.md`

Trace minimal:
Requirement → Use Case/Activity → Block → Verification.

Pastikan tidak ada requirement penting yang yatim.

### Tahap 7 — Verification scenarios
Buat skenario uji konseptual:
- kepadatan seimbang,
- satu ruas sangat padat,
- perubahan kepadatan,
- sensor gagal,
- pencegahan conflicting green,
- minimum/maximum green time jika digunakan.

Jangan mengarang hasil eksperimen.
Jika belum ada simulasi nyata, labeli sebagai **verification scenario / expected behavior**, bukan measured result.

### Tahap 8 — Rendering diagram
Render Mermaid dan PlantUML ke format yang cocok untuk LaTeX:
- prioritaskan SVG/PDF bila workflow mendukung,
- PNG hanya jika diperlukan.

Simpan output di:
- `assets/diagrams/`

Pastikan file source diagram tetap menjadi sumber kebenaran.

### Tahap 9 — Laporan LaTeX
Buat struktur modular:

`report/`
- `main.tex`
- `sections/`
- `bibliography.bib`

Isi minimal:
1. Pendahuluan
2. Landasan Teori
   - MBSE
   - SysML
   - Adaptive/Smart Traffic Signal
3. Studi Literatur
4. Analisis Permasalahan
5. Requirements
6. Perancangan Model
   - Requirement Diagram
   - Use Case
   - Activity
   - Sequence
   - State Machine
   - BDD
   - IBD
7. Traceability dan Verification Scenario
8. Diskusi
9. Kesimpulan
10. Daftar Pustaka

Aturan akademik:
- gunakan sitasi yang valid,
- jangan menulis klaim tanpa sumber jika klaim tersebut bersifat eksternal,
- bedakan hasil jurnal dan keputusan desain,
- hindari plagiarisme,
- parafrase dengan benar.

### Tahap 10 — Presentasi LaTeX Beamer
Buat:
- `presentation/main.tex`

Target sekitar 10–14 slide:
1. Judul
2. Latar belakang masalah
3. Evidence dari jurnal traffic
4. Mengapa MBSE
5. Scope dan tujuan
6. Requirements
7. Behavioral model
8. Structural model
9. Traceability
10. Verification scenarios
11. Temuan/desain utama
12. Kesimpulan

Jangan memasukkan seluruh isi laporan ke slide.
Slide harus ringkas dan visual.

### Tahap 11 — Build & quality control
Kompilasi:
- report PDF
- presentation PDF

Periksa:
- LaTeX error
- broken reference
- missing image
- bibliography error
- diagram tidak terbaca
- overfull box yang signifikan
- konsistensi istilah
- traceability
- konsistensi citation

Bila compiler/tool tidak tersedia:
- jangan mengklaim build berhasil,
- catat keterbatasan di log,
- tetap pastikan source secara statis konsisten.

## Struktur repository target
Pertahankan folder `references/` milik pengguna.

Struktur yang disarankan:

.
├── AGENT.md
├── references/
├── research/
│   ├── literature-review.md
│   ├── evidence-matrix.md
│   └── design-assumptions.md
├── model/
│   ├── requirements/
│   │   ├── requirements.md
│   │   └── requirements.mmd
│   ├── behavior/
│   │   ├── use-case.puml
│   │   ├── activity.puml
│   │   ├── sequence.puml
│   │   └── state-machine.puml
│   ├── structure/
│   │   ├── bdd.puml
│   │   └── ibd.puml
│   └── traceability/
│       └── traceability-matrix.md
├── assets/
│   └── diagrams/
├── report/
│   ├── main.tex
│   ├── sections/
│   └── bibliography.bib
├── presentation/
│   └── main.tex
└── logs/
    ├── progress.md
    ├── decisions.md
    ├── issues.md
    └── build.md

## Logging wajib
Setelah satu milestone selesai, update `logs/progress.md`.

Setiap keputusan desain penting:
- tulis di `logs/decisions.md`.

Setiap blocker/error:
- tulis di `logs/issues.md`.

Setiap build:
- tulis perintah, tanggal/waktu, hasil, warning/error di `logs/build.md`.

Jangan menghapus log lama. Append perubahan.

## Aturan Git-friendly / code-based
- Semua diagram harus memiliki source text.
- Hindari file biner sebagai sumber utama.
- Gunakan nama file konsisten dan lowercase-kebab-case.
- Jangan menyimpan generated artifact yang tidak diperlukan.
- Jangan mengubah `references/` kecuali untuk metadata/bibliography extraction yang diperlukan.
- Jangan membuat ulang gambar secara manual jika bisa digenerate dari `.mmd` / `.puml`.

## Quality gates
Sebelum menyatakan proyek selesai, pastikan:
- [ ] skill `academic research` benar-benar digunakan
- [ ] skill `ponytail` benar-benar digunakan
- [ ] 3 jurnal pada `references/` dianalisis
- [ ] requirement memiliki sumber atau label asumsi desain
- [ ] Mermaid Requirement Diagram valid
- [ ] seluruh PlantUML valid
- [ ] terminology konsisten
- [ ] traceability matrix tersedia
- [ ] report LaTeX tersedia
- [ ] presentation Beamer tersedia
- [ ] bibliography valid
- [ ] report berhasil build atau limitation dicatat
- [ ] presentation berhasil build atau limitation dicatat
- [ ] log lengkap

## Cara bekerja
Jangan langsung membuat seluruh dokumen final dalam satu langkah.

Gunakan urutan:
Audit → Research → Requirements → Behavioral Model → Structural Model → Traceability → Verification → Report → Presentation → Build/QC.

Pada setiap tahap:
1. baca evidence yang relevan,
2. buat output,
3. validasi,
4. catat ke log,
5. baru lanjut.

Mulai sekarang dengan Tahap 0.
