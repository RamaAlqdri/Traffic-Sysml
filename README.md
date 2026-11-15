# Smart Traffic Light — MBSE dengan SysML v2

Model konseptual satu simpang empat pendekat. Sesuai keputusan pengguna 7 November 2026, **berkas `model/**/*.sysml` menjadi sumber utama model, parameter, requirement, dan diagram**. Mermaid/PlantUML lama berada di `archive/sysml1/` dan tidak dipakai build.

## Build

Prasyarat: Node.js 20+, npm, Python 3, librsvg (`rsvg-convert`), TeX Live dengan latexmk/XeLaTeX/pdfLaTeX/Biber/BibTeX, serta Calibri lokal sesuai [template UB](report/TEMPLATE-UB.md). Materi kuliah pengguna tetap wajib tersedia sebelum modeling; sumber tersedia pada `lecture/`.

```sh
make setup
make build
```

`make setup` menjalankan `npm ci`, memasang dependensi yang dikunci dan browser Chrome for Testing melalui Puppeteer. Setelah setup, jalur parser/renderer bekerja lokal. Gunakan `CHROME_BIN=/path/to/chrome` bila memakai browser alternatif. Dependency lock bukan jaminan PDF identik bit-for-bit lintas OS/font/TeX.

`make build` menjalankan:
1. Parser ANTLR dan validator SysML v2, lalu pemeriksaan kontrak model.
2. Tujuh ekspor SVG langsung dari AST model melalui renderer SysML; konversi SVG ke PDF.
3. Sinkronisasi katalog requirement dan kartu laporan dari dokumentasi requirement `.sysml`.
4. Checker referensi memakai parameter model, regression tests, lalu kompilasi laporan/presentasi.

Output: [laporan](report/main.pdf), [presentasi](presentation/main.pdf), dan tujuh SVG/PDF pada `assets/diagrams/`. Log build append-only di `logs/build.md`; status rilis/QC terkini ada di `logs/qc.md`.

Untuk validasi tanpa rendering/LaTeX: `make check-model`. Detail arsitektur tool dan batasnya: [model/BUILD.md](model/BUILD.md).

## Source utama

- Parameter/domain: `model/structure/types.sysml`.
- Struktur/interkoneksi: `bdd.sysml`, `ibd.sysml` (nama berkas dipertahankan untuk kompatibilitas; konsep v2 adalah part definition/usage dan port).
- Perilaku: `model/behavior/*.sysml`.
- Kebutuhan: `model/requirements/requirements.sysml`; katalog Markdown dan kartu laporan adalah keluaran otomatis.
- Satisfaction/allocation: `model/traceability/allocation.sysml`; 21 verification case: `model/verification/verification.sysml`.
- Penjelasan evidence/ASM, dictionary dan skenario rinci tetap pada source Markdown yang dirujuk model.

Format laporan tetap sampul UB/Calibri, poin pembahasan tanpa BAB, tanpa ringkasan/daftar isi/tabel/gambar/dasar teori. Identitas kelompok ada di `report/metadata.tex`. Source referensi dan materi kuliah tidak diubah oleh build.

## Batas verifikasi

Seluruh angka tetap asumsi desain. Build memeriksa sintaks, sebagian semantik, hubungan requirement dan kontrak baseline; checker referensi menghitung bound 208 s untuk asumsi nominal. Ini bukan interpreter SysML penuh, simulator arus kendaraan, pengukuran throughput atau pengujian hardware. Skenario yang belum dieksekusi tetap `not-run`. Milestone: `source-complete` → `build-verified` → `release-complete`; rendering saja tidak memenuhi QC.
