# Project Progress Log

> Append-only log. Jangan hapus entri lama.

## Initialization

- Status: starter files created
- Stage: pre-execution
- Skills used: none yet
- Notes:
  - `academic research` wajib digunakan saat proyek dijalankan di Codex.
  - `ponytail` wajib digunakan saat proyek dijalankan di Codex.
  - Folder `references/` diasumsikan sudah tersedia di repository lokal pengguna.

---

Gunakan template berikut untuk entri berikutnya:

```md
## YYYY-MM-DD HH:MM — <stage>

- Action:
- Files changed:
- Validation:
- Skills used:
- Findings:
- Next:
```

## 2026-11-02 10:33:24 WIB — Revisi starter dan audit Tahap 0

- Action: revisi MASTER_PROMPT.md dan AGENT.md sesuai arahan pengguna; selaraskan README; tambahkan Makefile; lakukan inventaris, metadata PDF, pemeriksaan tool, uji preflight, dan smoke render generik.
- Files changed by this task: MASTER_PROMPT.md, AGENT.md, README.md, Makefile; append logs/progress.md, logs/decisions.md, logs/issues.md, logs/build.md.
- Files preserved: references/ dan lecture/ tidak diubah. File lecture/ muncul dari perubahan workspace lain selama audit; bukan dibuat oleh pekerjaan ini. Perubahan Git pengguna yang sudah ada tidak direset atau di-stage.
- Validation: git diff --check lulus; make -n _build dapat diparse; make build menolak source hilang dengan nonzero exit dan mencatatnya. Setelah deteksi materi alternatif ditambahkan, file catatan terdeteksi dan tidak dilaporkan hilang. Smoke Mermaid PDF dan PlantUML SVG→PDF berhasil; PlantUML invalid ditolak dengan exit code 200. Fixture temporer dihapus; bukan model traffic atau artefak final.
- Skills used: ponytail:ponytail melalui pembacaan /Users/ramadhanial-qadri/.codex/plugins/cache/ponytail/ponytail/5.3.3/skills/ponytail/SKILL.md dan penerapan scope minimum serta pemeriksaan jalur kegagalan. Router academic-research-suite dibaca melalui /Users/ramadhanial-qadri/.codex/skills/academic-research-suite/SKILL.md untuk batas evidence/asumsi dan kejujuran verifikasi; workflow literature review/sintesis akademik belum dijalankan dan tidak diklaim selesai.
- Findings: audit inventaris/tooling selesai; gate isi kuliah masih pending sebelum modeling (ISSUE-001). Tool CLI awalnya tidak ditemukan, tetapi pengecekan ulang menemukan dan berhasil menjalankan mmdc/plantuml; catatan awal tersebut tidak lagi menjadi blocker tool.
- Status: starter/revision-complete; project build-unverified; source-complete/build-verified/release-complete belum terpenuhi.
- Next: tinjau materi Markdown secara lengkap beserta keterbatasan asalnya, kemudian jalankan Tahap 1 dengan workflow academic-research-suite. Tidak memulai Tahap 2–7 sebelum gate kuliah terpenuhi.

### Inventaris saat audit (di luar metadata Git dan .DS_Store)

- `AGENT.md`
- `MASTER_PROMPT.md`
- `Makefile`
- `README.md`
- `lecture/01-pengantar-mbse.md`
- `lecture/02-pemodelan-mbse-sysml.md`
- `lecture/README.md`
- `logs/build.md`
- `logs/decisions.md`
- `logs/issues.md`
- `logs/progress.md`
- `references/jurnal-mbse.pdf`
- `references/jurnal-traffic-1.pdf`
- `references/jurnal-traffic-2.pdf`

### Metadata awal references/ — bukan hasil literature review

- `references/jurnal-mbse.pdf`: Model‐based systems engineering: Evaluating perceived value, metrics, and evidence through literature; 26 halaman; SHA-256 `09a974ebe9899d87d3561c9c96c9299ec7f8fd76fa111063496c22af1602e4fc`.
- `references/jurnal-traffic-1.pdf`: Priority-Based Adaptive Traffic Signal Control System for Smart Cities; 11 halaman; SHA-256 `05aefd9d282fbc866a414dbe3ac951b651423321a505c9a821ce51a60ffbf9ef`.
- `references/jurnal-traffic-2.pdf`: A Vehicle Density Estimation Traffic Light Control System Using a Two-Dimensional Convolution Neural Network; 19 halaman; SHA-256 `7bc6c6a59673dcfc3c346e1501a969cadf7e945db77c283eee2d63bf90f70f29`.

### Toolchain yang diverifikasi

- GNU Make 3.81; Python 3 tersedia.
- latexmk 4.88; pdfLaTeX/pdfTeX 1.40.29; XeLaTeX/XeTeX 0.999998 (TeX Live 2026).
- Biber 2.21; BibTeX 0.99e; pemilihan satu backend untuk source belum dilakukan.
- Mermaid CLI 12.0.0; PlantUML 1.2026.9; Java OpenJDK 21.0.1.
- Graphviz dot 12.2.1; librsvg/rsvg-convert 2.60.0; pdfinfo dan pdftotext tersedia.
- Keberadaan tool dan smoke test tidak memverifikasi bibliography, paket LaTeX proyek, keterbacaan PDF final, atau hasil simulasi.

## 2026-11-02 10:37:31 WIB — Penegasan kontrak SysML

- Action: tegaskan model wajib mengikuti SysML; Mermaid/PlantUML hanya textual rendering tools. Tambahkan aturan pemetaan notasi, identitas elemen, owner/context, type-part, dan relasi; perkuat gate QC/release.
- Files changed: MASTER_PROMPT.md, AGENT.md, README.md; append logs/decisions.md dan logs/progress.md.
- Validation: tinjau konsistensi kontrak pada kedua panduan dan README; periksa diff whitespace. Perubahan dokumentasi, tidak memerlukan pengulangan render/kompilasi.
- Skills used: ponytail:ponytail (lanjutan sesi, perubahan minimum pada panduan dan log yang relevan). Tidak menjalankan atau mengklaim literature review/validasi SysML model.
- Findings: kelonggaran lama pada representasi PlantUML diganti dengan pemetaan eksplisit yang wajib mempertahankan semantik SysML. QC semantik dipisahkan dari keberhasilan parsing/rendering.
- Next: saat modeling dimulai, tentukan versi/subset dari materi kuliah dan isi Pemetaan SysML pada traceability matrix. Status build tetap build-unverified; belum ada model yang dinyatakan patuh SysML.

## 2026-11-02 11:53:46 WIB — Tahap 0 ditutup dan milestone Tahap 1 tersedia

- Action: tinjau materi kuliah yang disediakan, ekstrak tiga PDF, jalankan structural preflight, periksa metadata penerbit yang dapat diakses, lalu susun kajian per artikel dan sintesis lintas sumber beserta evidence/asumsi.
- Files changed: research/literature-review.md (1560 kata), research/evidence-matrix.md, research/design-assumptions.md, research/lecture-review.md, research/source-verification.md; research/extracted/*-preflight.json; .gitignore; append decisions/issues/progress. Cache teks dan render sementara tidak menjadi source utama dan diabaikan Git. references/ serta lecture/ tidak diubah.
- Validation: 15 ID evidence unik dengan tujuh field wajib; 16 citation markers memiliki locator section/page dan slug sesuai tiga sumber; dua PDF traffic PASS, PDF MBSE UNAVAILABLE diungkapkan; tiga source riset wajib tersedia; git diff --check lulus. Halaman kritis traffic-1 PDF 6 dan traffic-2 PDF 17 ditinjau visual. Ini validasi statis/interpretasi sumber, bukan eksperimen traffic.
- Skills used: academic-research-suite → ars/deep-research/WORKFLOW.md, peran bibliography/source_verification/synthesis dibaca dan diterapkan berurutan inline pada corpus tetap; bukan reviewer independen atau systematic review. Ponytail:ponytail tetap aktif untuk scope bertahap. pdf:pdf dibaca untuk ekstraksi/render/QA sumber; script ARS pdf_read_preflight.py dijalankan dengan pypdf 6.21.4 dalam venv temporer.
- Findings: gate materi kuliah terpenuhi sebagai catatan yang disediakan dengan batas provenance (ISSUE-001 resolved). Jurnal mendukung adaptive green berbasis kondisi kendaraan; tie-break, fairness, failure handling dan parameter spesifik tetap keputusan desain. Perbedaan internal traffic dan batas integritas/akses sumber dicatat (ISSUE-003/004).
- Status: keluaran awal Tahap 1 tersedia dan diperiksa dengan keterbatasan eksplisit; build-unverified. Belum source-complete/build-verified/release-complete. Asumsi numerik masih pending; belum ada requirements atau model yang dinyatakan selesai.
- Next: Tahap 2 problem formulation; tutup definisi pengamatan dan konfigurasi konflik; Tahap 3 tetapkan parameter konseptual ber-rationale, requirements atomic dan verifikasi kelayakan waktu sebelum diagram SysML dibangun. Tidak meminta konfirmasi ulang atas baseline yang sudah diotorisasi.

## 2026-11-03 09:50:01 WIB — Tahap2–8: model baseline dan verification

- Action: tutup formulasi masalah/ASM, buat24 requirements, empat behavioral view, BDD/IBD, traceability dan21 verification scenarios. Tambahkan checker referensi dan receipt inspection; render seluruh diagram.
- Files changed: research/problem-formulation.md, resolusi research/design-assumptions.md, evidence usage note; model/requirements, model/behavior, model/structure, model/traceability, model/verification; assets/diagrams.
- Validation: 24 sumber/trace/verifikasi terhubung, sepuluh action ID unik; 576 pasangan permutasi memiliki bound208s≤210s. Category/tie/input/output-state examples lulus. Ketujuh diagram valid dan dirender. SysML subset/arah relasi/type-part/port diperiksa pada spesifikasi resmi dan dictionary.
- Skills used: ponytail untuk perubahan bertahap dan self-check; academic-research-suite untuk disiplin evidence/asumsi; pdf untuk visual pemeriksaan sumber/diagram. Tidak ada reviewer independen atau eksperimen traffic yang diklaim.
- Findings: input adapter, deadline precedence, round fairness dan fault/recovery sudah memiliki kontrak. Test timeline yang tidak dijalankan tetap not-run. Masalah authoring sementara dan resolusinya dicatat pada ISSUE-005.
- Next: laporan/presentasi/QC, dicatat pada milestone berikut.

## 2026-11-03 09:50:01 WIB — Tahap9–11: dokumen dan QC rilis

- Action: tulis laporan LaTeX modular21halaman dan Beamer14slide, bibliography6sumber, build/checker entry point, lalu lakukan QC source/citation/render/visual.
- Files changed: report/main.tex, report/sections/*.tex, report/bibliography.bib, report/main.pdf; presentation/main.tex/main.pdf; Makefile, .gitignore, README, append logs/decisions/issues/progress/build dan receipt logs/qc.md.
- Validation: make build final exit0; final .log/.blg tanpa warning/error/overfull/underfull/unresolved citation/reference. Enam key disitasi tanpa orphan; hash tiga jurnal cocok sidecar; ketujuh diagram dimasukkan report. Semua halaman/slide diperiksa melalui render/contact sheet dan halaman diagram diperiksa lebih besar. Guard ukuran gambar dan action identity lulus; python -O ditolak. Source diff lulus di luar raw terminal build log yang mengandung trailing whitespace dan sengaja dipertahankan append-only.
- Skills used: academic-research-suite/academic-paper WORKFLOW dan kontrak draft_writer/citation_compliance diterapkan inline untuk laporan berbasis evidence; checker acronym dijalankan dengan coverage partial yang diungkapkan. pdf:pdf dan presentations:Presentations digunakan untuk QA/layout; format LaTeX/Beamer eksplisit pengguna dipertahankan. Ponytail tetap aktif; tidak menambahkan ML/dashboard/simulator throughput.
- Findings: source-complete dan build-verified terpenuhi; release-complete untuk artefak akademik konseptual menurut QC receipt. Runtime/hardware/throughput yang belum diuji tidak disebut passed atau measured result. Integritas PDF MBSE/akses penerbit tetap batas source yang dinyatakan.
- Next: artefak dapat ditinjau kelompok; tidak ada pekerjaan wajib artefak yang tersisa pada scope model konseptual. Ekstensi implementasi/runtime atau kalibrasi jalan merupakan pekerjaan baru. Perubahan source/toolchain memerlukan build/QC ulang.

## 2026-11-05 12:37:23 WIB — Revisi laporan: template UB dan identitas kelompok

- Stage: penyesuaian format dan QC ulang, tanpa modeling baru.
- Action: baca template UB pengguna; impor paket gaya, sampul/logo; migrasi chapter, bagian awal, tabel/caption dan bibliography; gunakan Calibri asli sesuai instruksi; isi Edy Rahman (256150100011007), Ramadhani Al-Qadri (256150100011010), Departemen Teknik Informatika. Sesuaikan Makefile dan panduan toolchain.
- Files changed: report/main.tex, report/sections/*.tex, report/metadata.tex, report/awal, report/gaya, report/gambar, report/latexmkrc, report/TEMPLATE-UB.md, report/main.pdf; Makefile, README, AGENT.md, MASTER_PROMPT.md, .gitignore dan log. make build meregenerasi aset PDF, Beamer PDF dan timestamp verification receipt tanpa mengubah source model/Beamer.
- Validation: make build exit0; laporan 30 halaman, Beamer 14 slide. Calibri embedded diverifikasi pdffonts; 24 requirement dan enam citation keys utuh; tujuh PDF diagram dimasukkan. Source requirement hanya berubah hierarki heading, bibliography dan source model terlindungi identik HEAD. Style setelah blok font dan logo identik sumber. Semua halaman ditinjau pada contact sheet, halaman awal/diagram/referensi diperiksa lebih besar. Underfull dan tag warning didisposisikan pada ISSUE-006; tidak ada error, overfull atau unresolved citation/reference final.
- Skills used: pdf:pdf untuk render/visual QA dan penyerahan PDF; academic-research-suite → academic-paper WORKFLOW dan formatter/citation_compliance diterapkan inline untuk preservasi konten/sitasi; ponytail:ponytail untuk perubahan secukupnya. Tidak ada reviewer independen atau eksperimen traffic baru.
- Status: source-complete, build-verified, release-complete untuk revisi format artefak konseptual pada receipt terbaru.
- Next step: laporan siap ditinjau pengguna; source memerlukan Calibri lokal sebagaimana dokumentasi. Tidak ada pekerjaan format wajib yang tersisa.

## 2026-11-05 12:50:53 WIB — Revisi struktur laporan menjadi poin pembahasan

- Stage: revisi laporan sesuai instruksi pengguna.
- Action: hilangkan input ringkasan, daftar isi/tabel/gambar dan dasar teori/studi literatur; ubah chapter ke section dan turunannya; nomor tabel/gambar/persamaan berurutan; jaga setiap entri requirement utuh; pertahankan sitasi pada pembahasan relevan.
- Files changed: report/main.tex, report/gaya/ubtesis.sty, enam sections aktif, report/TEMPLATE-UB.md, MASTER_PROMPT.md, AGENT.md, README.md, PDF dan log. Build meregenerasi PDF diagram/presentasi dan timestamp receipt checker; source model/Beamer, metadata sampul dan bibliography tidak berubah.
- Validation: make build exit0; kompilasi akhir laporan melalui latexmk XeLaTeX exit0. PDF 19 halaman: sampul langsung disambung poin 1 Pendahuluan. Bagian yang diminta dihapus dan label BAB tidak muncul; tujuh diagram, 24 requirement dan enam referensi tetap tersedia. Teks requirement identik setelah normalisasi heading/minipage, 15 source terlindungi identik HEAD. Calibri tetap tertanam. Seluruh 19 halaman diperiksa pada render/contact sheet; halaman requirement dan persamaan ditinjau lebih besar.
- Skills used: pdf:pdf untuk render/QA; academic-research-suite academic-paper, formatter/citation_compliance diterapkan inline untuk preservasi isi/sitasi sesuai scope pengguna; ponytail:ponytail untuk perubahan terbatas. Tidak menjalankan pencarian literatur atau eksperimen baru.
- Status: source-complete, build-verified, release-complete untuk revisi struktur laporan dengan batas verifikasi model sebelumnya tetap berlaku.
- Next step: PDF revisi siap ditinjau pengguna.

## 2026-11-05 13:00:47 WIB — Perbaikan keterbacaan bagian 3 Requirements

- Stage: revisi tata letak laporan.
- Action: susun ulang 24 requirement menjadi kartu tabel, pisahkan Pernyataan/Sumber/Alasan/Verifikasi/Penelusuran, tambahkan enam kelompok sesuai katalog dan panduan singkat pembacaan kode.
- Files changed in this revision: report/sections/04-requirements.tex, macro requirementcard pada report/gaya/ubtesis.sty, report/TEMPLATE-UB.md, report/main.pdf dan log; make build meregenerasi aset PDF/presentasi serta timestamp checker. Perubahan sebelumnya dalam workspace dipertahankan.
- Validation: make build exit0. PDF 23 halaman, bagian 3 pada PDF 5–11. Seluruh 24 field set identik snapshot sebelum revisi dan masing-masing kartu utuh pada satu halaman; 13 source dokumen/model terlindungi tidak berubah. Enam citation keys sesuai bibliography; font Calibri tertanam. Enam contact sheet seluruh 23 halaman ditinjau, dua halaman requirement diperiksa lebih besar. Tidak ada clipping/overlap material.
- Skills used: pdf:pdf untuk render/QA; pedoman academic-research-suite academic-paper formatter/citation_compliance diterapkan inline untuk menjaga isi dan tautan sitasi, tanpa audit penerbit baru; ponytail:ponytail untuk perubahan terbatas pada layout. Tidak ada eksperimen atau validasi model baru.
- Status: source-complete, build-verified, release-complete untuk revisi keterbacaan ini, dengan batas model/sumber sebelumnya tetap berlaku.
- Next step: PDF revisi siap dibaca pengguna.
