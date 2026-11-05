# MASTER PROMPT — Smart Traffic Light MBSE Project

Anda adalah coding/research agent yang bekerja di repository lokal untuk menyelesaikan proyek akademik **Model-Based Systems Engineering (MBSE) — Smart Traffic Light berbasis kepadatan kendaraan**.

## Tujuan akhir
Hasil akhir proyek harus berupa:

1. **Laporan akademik dalam LaTeX** yang dapat dikompilasi ke PDF.
2. **Presentasi dalam LaTeX Beamer** yang dapat dikompilasi ke PDF.
3. Model sistem **wajib mengikuti SysML**. Mermaid dan PlantUML hanya digunakan sebagai **textual rendering tools** untuk merepresentasikan elemen dan relasi SysML secara konsisten:
   - **Mermaid** merender representasi SysML Requirement Diagram.
   - **PlantUML** merender representasi SysML Use Case, Activity, Sequence, State Machine, BDD, dan IBD.
4. Semua klaim akademik penting harus ditopang oleh referensi di folder `references/`.
5. Progres pekerjaan harus dicatat di folder `logs/`.

## Skill wajib
Dua skill Codex berikut **WAJIB digunakan** selama pengerjaan proyek:
- `academic-research-suite` (padanan `academic research` di environment ini)
- `ponytail` (skill terpasang: `ponytail:ponytail`)

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
6. Materi kuliah MBSE/SysML **wajib tersedia dan diperiksa sebelum modeling dimulai**. Lokasi default: `lecture/mbse-material.pdf`; nama/format lain boleh digunakan bila identitas dan lokasinya dicatat. File placeholder tidak memenuhi prasyarat.
7. Jika materi kuliah belum tersedia, selesaikan audit dan pekerjaan persiapan yang independen, catat blocker, lalu hentikan sebelum Tahap 2–7. Analisis jurnal pada Tahap 1 boleh dilakukan, tetapi tidak menggantikan materi kuliah. Jangan mengunduh atau mengganti materi kuliah secara diam-diam.

## Baseline desain dan parameter

Baseline berikut adalah **asumsi desain awal**, bukan fakta jurnal. Gunakan hanya jika instruksi tugas, materi kuliah, atau evidence yang relevan tidak menetapkan lain. Catat perubahan beserta alasannya di `logs/decisions.md` dan perbarui artefak terdampak.

- Satu simpang empat lengan: North, South, East, West; satu pendekat yang dikendalikan per arah. Jumlah lajur tidak otomatis diasumsikan satu.
- Fase pejalan kaki dan fase belok khusus berada di luar baseline. Tetapkan gerakan kendaraan yang dimodelkan, fase yang diizinkan, dan matriks konflik sebelum modeling; jangan menganggap pasangan arah aman bersamaan tanpa definisi tersebut.
- Input baseline: `vehicleCount` per pendekat selama `observationInterval`. Definisikan apakah hitungan merupakan kendaraan yang lewat atau kendaraan dalam area pengamatan agar arti data konsisten.
- Bila kapasitas pendekat tersedia dan sebanding secara satuan serta basis pengamatan, normalisasi hitungan terhadap kapasitas tersebut. Bila tidak, gunakan kategori rendah/sedang/tinggi dengan ambang dan rationale di `research/design-assumptions.md`. Jangan menyebut vehicle count sebagai kepadatan fisik tanpa penjelasan proksi.
- Tetapkan `minimumGreen`, `maximumGreen`, `maximumWaitingTime`, `observationInterval`, `decisionUpdateInterval`, serta ambang data kedaluwarsa. Definisikan satuan, kondisi awal/reset waktu tunggu, dan hubungan interval observasi dengan interval keputusan.
- Cari dasar angka dalam sumber terlebih dahulu. Jika tidak ada nilai yang relevan, tetapkan sebagai asumsi desain ber-ID `ASM-*`, dengan rationale, keterbatasan, dan cara verifikasi. Jangan menetapkan angka contoh sebagai fakta atau menyalin angka jurnal di luar konteksnya.
- Prioritas normal: kepadatan tertinggi → waktu tunggu terlama → round-robin deterministik. Definisikan kesetaraan kepadatan/kategori, urutan awal, dan pembaruan pointer round-robin.
- Pengendali wajib mencegah starvation: pada batas fase yang aman, kebutuhan memenuhi `maximumWaitingTime` mengalahkan prioritas kepadatan. Periksa kelayakan batas tunggu terhadap jumlah fase, minimum green, dan waktu transisi; jangan menjanjikan batas yang mustahil dipenuhi.
- Keputusan dihitung ulang pada batas siklus kontrol/fase yang didefinisikan, mengikuti `decisionUpdateInterval`; durasi green aktif tidak terus diubah oleh sampel baru. Definisikan pembulatan/penundaan keputusan bila interval jatuh di tengah fase. Interlock keselamatan dan respons kegagalan tetap dapat bekerja segera.
- Pendekat yang berkonflik tidak boleh green bersamaan. Minimum/maximum green serta transisi keselamatan, termasuk yellow/all-red bila digunakan, harus konsisten di seluruh model.
- Penanganan sensor/data gagal adalah **wajib minimum**: definisikan deteksi data invalid, hilang, atau stale; perilaku fail-safe/default timing; syarat pemulihan; dan prioritas keselamatan. Nyatakan cakupan jaminan maximum waiting time pada kondisi nominal dan keterbatasannya saat kegagalan.

## Prinsip pengerjaan
Kerjakan proyek dari awal secara bertahap dan dapat diaudit.

### Kontrak pemodelan SysML

- SysML menjadi dasar semantik model. Sintaks Mermaid/PlantUML tidak boleh menentukan atau menggantikan makna elemen, relasi, ownership, maupun interface sistem.
- Identifikasi dan catat versi SysML serta subset/notasi yang dipakai berdasarkan materi kuliah sebelum modeling. Jangan mencampur versi atau mengklaim kepatuhan formal/certification yang belum diperiksa.
- Gunakan identitas elemen yang stabil lintas view: requirement, actor/use case, activity/action, interaction/message, state/transition, block, part property, port, connector, dan verification/test case sesuai kebutuhan.
- BDD harus mendefinisikan block/type dan relasinya; IBD harus merepresentasikan penggunaan part, port, connector, dan flow di dalam context block. Kaitkan part ke type yang didefinisikan pada BDD; jangan menganggap kotak/garis generik otomatis memenuhi makna SysML.
- Nyatakan jenis, arah, dan endpoint relasi SysML yang digunakan, termasuk `satisfy`, `verify`, `deriveReqt`, `refine`, dan `allocate` bila relevan; jangan menggantinya dengan panah tanpa makna yang dijelaskan.
- Catat pemetaan elemen/relasi SysML ke representasi Mermaid/PlantUML dalam bagian **Pemetaan SysML** di `model/traceability/traceability-matrix.md`: ID elemen, jenis SysML, owner/context, file/view, notasi/alias renderer, relasi beserta endpoint, serta keterbatasan representasi. Ini mendokumentasikan model yang sama, bukan membuat definisi elemen yang berbeda per tool.
- Jika renderer tidak mendukung notasi langsung, gunakan stereotype/label/anotasi yang eksplisit dengan pemetaan terdokumentasi. Keterbatasan renderer tidak membolehkan pelemahan semantik SysML; representasi yang belum memadai harus dicatat sebagai issue dan diperbaiki sebelum QC model dinyatakan lulus.
- Keberhasilan parsing/rendering hanya memverifikasi sintaks tool. QC terpisah wajib memeriksa semantik SysML, konsistensi antar-view, dan traceability.

### Tahap 0 — Audit repository
- Baca `AGENT.md`.
- Inventarisasi seluruh file.
- Periksa isi `references/`.
- Identifikasi materi kuliah.
- Jika belum ada, catat blocker materi kuliah; jangan menganggap Tahap 0 lulus penuh atau memulai modeling.
- Verifikasi tool lokal:
  - LaTeX compiler (`latexmk`, `pdflatex`, atau `xelatex`)
  - Mermaid CLI jika tersedia
  - PlantUML / Java jika tersedia
- Jangan menghapus file pengguna.
- Jangan memindahkan isi `references/` tanpa kebutuhan.
- Catat inventaris, lokasi materi, metadata awal 3 PDF, versi/ketersediaan tool, dan hasil gate. Metadata PDF tidak berarti isi jurnal sudah dianalisis.

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

Setiap evidence pada `research/evidence-matrix.md` wajib memiliki:

```yaml
ID: EVID-TRF-001  # EVID-TRF-* untuk traffic; EVID-MBSE-*; EVID-LEC-* untuk kuliah
Source: path file dan identitas bibliografi/citation key
Page/Section: halaman PDF dan halaman cetak bila berbeda; bagian/tabel/gambar yang relevan
Claim: klaim terbatas pada yang didukung sumber
Exact context: konteks, kondisi, metode, dan batas penerapan; kutipan singkat bila diperlukan
Used for: ID requirement atau bagian dokumen yang memakai evidence ini
Confidence: high | medium | low, disertai alasan dan keterbatasan pembacaan
Notes: keterbatasan sumber, konflik, atau pemeriksaan yang masih diperlukan
```

Confidence adalah penilaian dukungan terhadap klaim, bukan sertifikat kebenaran atau skor mutu jurnal. Evidence dengan lokasi belum terverifikasi tidak boleh menjadi dasar klaim terverifikasi. Asumsi dicatat terpisah sebagai `ASM-*`, bukan dibuat menjadi evidence jurnal/kuliah.

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
- evidence ID (`EVID-*`) atau assumption ID (`ASM-*`), beserta lokasi sumber melalui evidence matrix
- verification method
- traceability

Buat:
- `model/requirements/requirements.md`
- `model/requirements/requirements.mmd`

Requirement Diagram harus dibuat dengan **Mermaid**.
Field `source` harus menunjuk ID terdaftar, misalnya `source: [EVID-TRF-001, ASM-001]`; jangan berhenti pada nama file jurnal. Setiap `ASM-*` memuat keputusan/nilai, satuan bila relevan, rationale, sumber yang sudah diperiksa, dampak, dan cara verifikasi.
Seluruh parameter baseline wajib tercakup oleh requirement yang atomic dan dapat diverifikasi. Asumsi harus memiliki nilai/aturan yang cukup jelas untuk pengujian sebelum gate requirements dinyatakan lulus.

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
Evidence/Assumption → Requirement → Use Case/Activity → Block → Verification Scenario.

Pastikan tidak ada requirement penting yang yatim.
Gunakan ID elemen yang stabil; telusuri dua arah dan jelaskan elemen yang tidak berlaku. Keberadaan hubungan saja belum membuktikan requirement terpenuhi.

### Tahap 7 — Verification scenarios
Buat `model/verification/verification-scenarios.md` dengan ID `VER-*`, requirement terkait, kondisi awal, input/timeline, stimulus, expected behavior, kriteria lulus/gagal, metode, dan status `not-run`/`passed`/`failed`/`blocked` beserta evidence pelaksanaan jika ada.

Skenario uji konseptual minimal:
- kepadatan seimbang,
- satu ruas sangat padat,
- perubahan kepadatan,
- sensor/data invalid, hilang, stale, dan pemulihan,
- pencegahan conflicting green,
- minimum/maximum green time,
- tie-break kepadatan dan waktu tunggu serta round-robin,
- maximum waiting time/anti-starvation dan kelayakan batas tunggu,
- decision update interval, sampel yang datang saat green aktif, dan transisi keselamatan,
- fallback serta cakupan jaminan saat kegagalan.

Jangan mengarang hasil eksperimen.
Jika belum ada simulasi nyata, labeli sebagai **verification scenario / expected behavior**, bukan measured result.
Expected behavior yang hanya ditulis tidak boleh diberi status `passed`. Jika memakai walkthrough/analisis model, catat metode, langkah, dan bukti pemeriksaannya; jangan menyebutnya pengujian perangkat nyata.

### Tahap 8 — Rendering diagram
Render Mermaid dan PlantUML ke format yang cocok untuk LaTeX:
- prioritaskan SVG/PDF bila workflow mendukung,
- PNG hanya jika diperlukan.

Simpan output di:
- `assets/diagrams/`

Source model berupa katalog requirement, definisi elemen/relasi, traceability, serta source diagram yang konsisten harus tetap dapat ditelusuri. Hasil render adalah turunan; makna model ditentukan oleh SysML dan pemetaan yang terdokumentasi.

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

Gunakan satu entry point dari root repository: `make build`. `Makefile` merender seluruh diagram lalu membangun report dan presentation, berhenti dengan exit code nonzero bila prasyarat/render/compile gagal, dan append hasil ke `logs/build.md`. Versi tool dan perintah aktual harus tercatat. Tetapkan satu engine LaTeX serta satu backend bibliography secara konsisten; baseline build menggunakan pdfLaTeX melalui latexmk, dan pilihan backend harus didokumentasikan sebelum penulisan LaTeX.

Simpan konfigurasi dan lockfile dependency bila dikelola package manager; jangan memakai versi `latest` sebagai spesifikasi reproducibility. Catat dependensi sistem/font dan perubahan toolchain. Satu perintah build saja belum menjamin PDF identik lintas mesin.

Periksa:
- LaTeX error
- broken reference
- missing image
- bibliography error
- diagram tidak terbaca
- overfull box yang signifikan
- konsistensi istilah
- kesesuaian semantik SysML, pemetaan notasi, ownership/type-part, dan jenis/arah/endpoint relasi
- traceability
- konsistensi citation

Bila compiler/tool tidak tersedia:
- jangan mengklaim build berhasil,
- catat keterbatasan di log,
- tetap pastikan source secara statis konsisten.
- tandai `build-unverified`; pencatatan limitation tidak memenuhi status proyek selesai.

## Status dan kriteria selesai

Pisahkan milestone kelengkapan dari status verifikasi build:

- `source-complete`: seluruh source research, evidence/asumsi, requirement, tujuh diagram, traceability, verification scenarios, bibliography, laporan, presentasi, dan konfigurasi build tersedia serta lolos pemeriksaan statis. Status ini tidak membuktikan build berhasil.
- `build-unverified`: penanda bahwa build source terkini belum berhasil diverifikasi, karena belum dijalankan, tool kurang, atau ada kegagalan. Penanda ini dapat menyertai `source-complete`; bukan milestone sukses.
- `build-verified`: `make build` berhasil untuk source terkini; tujuh diagram berhasil dirender dan kedua LaTeX berhasil dikompilasi tanpa error kritis, missing references/images, atau citation yang belum terselesaikan. Periksa log LaTeX; exit code saja tidak cukup.
- `release-complete`: `source-complete` dan `build-verified` terpenuhi, PDF final tersedia dan diperiksa visual, QC citation/evidence/traceability/terminologi serta semantik SysML selesai, warning signifikan diselesaikan atau diberi disposition, serta semua log diperbarui.

Hanya `release-complete` boleh disebut **proyek selesai**. Perubahan source/toolchain setelah verifikasi menandai build sebagai `build-unverified` sampai build dan pemeriksaan terdampak diulang. Starter saat ini belum mencapai `source-complete`.

## Struktur repository target
Pertahankan folder `references/` milik pengguna.

Struktur yang disarankan:

.
├── AGENT.md
├── MASTER_PROMPT.md
├── Makefile
├── references/
├── lecture/
│   └── mbse-material.pdf  # materi asli dari pengguna, bukan file yang dibuat agent
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
│   ├── traceability/
│   │   └── traceability-matrix.md
│   └── verification/
│       └── verification-scenarios.md
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
- [ ] materi kuliah tersedia, diperiksa, dan dirujuk sebelum modeling
- [ ] requirement memiliki sumber atau label asumsi desain
- [ ] Mermaid Requirement Diagram valid
- [ ] seluruh PlantUML valid
- [ ] versi/subset SysML serta pemetaan elemen/relasi renderer terdokumentasi
- [ ] semantik SysML dan konsistensi antar-view diperiksa; render sukses saja tidak memenuhi gate ini
- [ ] terminology konsisten
- [ ] traceability matrix tersedia
- [ ] evidence/assumption → requirement → behavior → structure → verification terlacak
- [ ] baseline, parameter waktu, fairness, dan failure handling konsisten serta dapat diverifikasi
- [ ] `model/verification/verification-scenarios.md` tersedia dengan status yang jujur
- [ ] report LaTeX tersedia
- [ ] presentation Beamer tersedia
- [ ] bibliography valid
- [ ] `make build` berhasil dan report/presentation PDF tersedia
- [ ] diagram dan PDF final diperiksa visual; citation dan reference terselesaikan
- [ ] status `release-complete` terpenuhi; limitation saja tidak dianggap selesai
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

Saat prompt ini diinstruksikan untuk dieksekusi, mulai dengan Tahap 0 dan patuhi gate materi kuliah sebelum modeling.
