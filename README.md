# Smart Traffic Light — MBSE dan SysML

Proyek akademik pemodelan satu simpang empat pendekat dengan subset SysML 1.6. Evidence jurnal, catatan kuliah, asumsi desain, model dan verification disimpan sebagai source text yang dapat ditelusuri.

Model sistem wajib mengikuti SysML. Mermaid dan PlantUML hanya textual rendering tools untuk merepresentasikan elemen serta relasi SysML secara konsisten. Versi/subset SysML dan pemetaan notasi harus terdokumentasi; keberhasilan render tetap memerlukan pemeriksaan semantik model dan konsistensi antar-view.

## Artefak baseline

- [Laporan PDF](report/main.pdf) dan [source LaTeX modular](report/main.tex).
- [Presentasi PDF](presentation/main.pdf) dan [source Beamer, 14 slide](presentation/main.tex).
- [Formulasi masalah](research/problem-formulation.md), [evidence matrix](research/evidence-matrix.md), dan [register asumsi](research/design-assumptions.md).
- [24 requirements](model/requirements/requirements.md), [traceability dan pemetaan SysML](model/traceability/traceability-matrix.md), serta [21 verification scenarios](model/verification/verification-scenarios.md).
- [Receipt analisis referensi](model/verification/verification-results.md), [inspection subset SysML](model/verification/manual-inspection.md), dan [QC rilis](logs/qc.md).

Semua angka baseline merupakan asumsi konseptual. Checker mengenumerasi urutan putaran dan contoh kontrak input/tie/output; ia tidak mengeksekusi phase engine lengkap atau mengukur throughput. Status `not-run` pada skenario yang belum dieksekusi dipertahankan. Artefak ini bukan controller lapangan yang telah diuji.

## Penggunaan ulang panduan

1. Copy isi folder ini ke root repository proyek Anda.
2. Pertahankan folder `references/` yang sudah berisi 3 jurnal.
3. Sediakan materi kuliah MBSE/SysML asli di `lecture/mbse-material.pdf` (atau catat lokasi alternatif). Modeling tidak boleh dimulai sebelum materi tersedia dan diperiksa.
4. Berikan isi `MASTER_PROMPT.md` sebagai initial task kepada Codex, lalu jalankan audit Tahap 0 terlebih dahulu.
5. Pastikan Codex membaca `AGENT.md`.
6. Pastikan Codex benar-benar menggunakan skill sesuai tahap:
   - `academic-research-suite` (padanan `academic research`)
   - `ponytail:ponytail`
7. Pantau progres, keputusan, blocker, dan build melalui `logs/`.

## Expected final output

- `report/main.tex` + compiled PDF
- `presentation/main.tex` + compiled PDF
- SysML Requirement Diagram yang dirender dengan Mermaid
- SysML behavioral/structural diagrams yang dirender dengan PlantUML
- traceability matrix
- literature review
- verification scenarios
- build and progress logs

## Important

Starter ini tidak menyentuh folder `references/`.

## Build

Jalankan dari root repository:

```sh
make build
```

Prasyarat: materi kuliah dan source proyek lengkap; Mermaid CLI (`mmdc`, beserta browser yang dibutuhkannya), PlantUML (`plantuml`), Java, Graphviz (`dot`), librsvg (`rsvg-convert`), serta TeX Live dengan `latexmk`, pdfLaTeX, paket LaTeX/Beamer dan backend bibliography yang dipilih. Versi teruji dan konfigurasi dependency dicatat saat toolchain tersedia; starter belum menyediakan environment terkunci atau menjamin hasil identik lintas mesin.

Makefile mengutamakan `lecture/mbse-material.pdf`, lalu mencari PDF/PPTX/Markdown di `lecture/` selain `README.md`. Untuk memilih sumber tertentu, gunakan `make build LECTURE="lecture/nama-materi.pdf"` dan catat identitasnya. Pemeriksaan file hanya memeriksa keberadaan/ukuran; agent tetap wajib memeriksa bahwa isinya merupakan materi kuliah yang relevan. Jika memakai catatan yang diperluas dari slide, bedakan isi kuliah dari penjelasan tambahan; jangan mengatribusikan perluasan sebagai kutipan slide asli tanpa pemeriksaan.

Build merender satu Mermaid ke PDF serta enam PlantUML ke SVG/PDF, lalu mengompilasi `report/main.tex` dan `presentation/main.tex`. Output PDF berada di `report/main.pdf` dan `presentation/main.pdf`. Build berhenti bila prasyarat/tahap gagal dan append output ke `logs/build.md`; tidak menginstal tool secara otomatis. Pola CLI mengikuti [Mermaid CLI](https://github.com/mermaid-js/mermaid-cli) dan [PlantUML CLI](https://plantuml.com/command-line). Perubahan versi/opsi tetap perlu diuji saat tool tersedia.

Build juga menjalankan `python3 model/verification/check_model.py` sebelum rendering. Perintah tersebut dapat dijalankan sendiri untuk analisis dan cross-link checks; assertion harus aktif dan `python -O` ditolak. Backend dokumen yang dipakai adalah BibTeX dengan `natbib`/`plainnat`, engine pdfLaTeX, dan font Latin Modern. Jangan menafsirkan satu command sebagai environment terkunci lintas mesin; versi sistem yang dipakai tercatat pada log.

Milestone: `source-complete` → `build-verified` → `release-complete`. `build-unverified` menandai build source terkini yang belum terverifikasi, termasuk ketika source sudah lengkap. Hanya `release-complete` boleh disebut proyek selesai; keberhasilan command tetap memerlukan pemeriksaan log, citation, traceability, dan visual PDF.
