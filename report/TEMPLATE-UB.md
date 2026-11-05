# Asal template laporan dan adaptasi proyek

Template sumber pengguna:
`/Users/ramadhanial-qadri/Documents/My_File/Tesis/Flood Simulation/tesis-literatur/template-latex-ub`.
Panduan `PANDUAN.md`, style `gaya/ubtesis.sty`, sampul `awal/sampul.tex` dan `latexmkrc` dibaca sebelum migrasi. Folder sumber tidak diubah. Logo `gambar/logo-ub.jpg` disalin utuh.

## Format yang diadopsi

- Class report, A4, 12 pt; margin kiri 4/kanan 3/atas 3/bawah 3 cm, bagian awal atas 3,5 cm.
- Judul BAB dan hierarki subbab, indent paragraf 0,75 cm, leading 14,65 pt, penomoran awal Romawi dan isi Arab mengikuti paket gaya.
- Sampul/logo UB, Ringkasan, Daftar Isi, Daftar Tabel dan Daftar Gambar. Tidak membuat Daftar Lampiran karena laporan tidak mempunyai lampiran.
- Grid penuh, caption tabel di atas/gambar di bawah, nomor tabel/gambar/persamaan per bab, sumber di bawah ilustrasi/tabel, continuation longtable melalui perintah template.
- Bibliografi Harvard lokal dari paket gaya melalui biblatex/Biber; source jurnal dan klaim substantif tetap seperti baseline.

## Adaptasi eksplisit

1. **Calibri asli**, sesuai instruksi pengguna 5 November 2026. Template sumber memakai Carlito melalui pdfLaTeX; salinan style di proyek mengganti hanya blok font/engine dengan fontspec dan XeLaTeX. Math tetap newtxmath sebagaimana template. Font Calibri berasal dari instalasi Word lokal, tidak didistribusikan dalam repository. Default path `/Applications/Microsoft Word.app/Contents/Resources/DFonts/`; jika Calibri sudah terdaftar sistem, nama font dapat dipakai. Pada mesin lain, tentukan `\ubcalibripath` sebelum memuat style atau pasang Calibri. Tidak ada fallback diam-diam ke Carlito.
2. Jenis naskah **LAPORAN PROYEK**, dengan dua baris penyusun berpasangan nama/NIM: Edy Rahman (256150100011007), Ramadhani Al-Qadri (256150100011010). Departemen Teknik Informatika berasal dari pengguna. Program Studi Magister Ilmu Komputer mengikuti konteks proyek MILKOM. Metadata terpusat di `report/metadata.tex`.
3. Folder isi `sections/` tetap digunakan agar source lama dapat ditelusuri. Top-level section diubah ke chapter; level turunannya mengikuti template. Penanda, statement 24 requirement, nilai ASM, dan label diagram tidak diganti oleh migrasi format.
4. `bibliography.bib` tetap dibagi dengan Beamer. Source map laporan menormalkan penanda tahun `n.d.` menjadi tahun kosong agar gaya UB mencetak `t.t.` tanpa mengarang tahun. Key, DOI dan data jurnal tidak berubah. Laporan memakai Biber; Beamer mandiri yang tidak diminta diganti formatnya tetap memakai BibTeX/pdfLaTeX. Ini pengecualian toolchain per artefak yang disengaja, bukan dua backend dalam dokumen yang sama.
5. Font gambar diagram yang sudah tertanam di PDF aset tetap merupakan bagian gambar. Body, judul, caption dan bibliografi laporan memakai Calibri; matematika memakai font math template. Source model tidak diubah hanya untuk mengganti font dokumen.

## Build

Dari root: `make build`. Laporan: `latexmk -xelatex -cd -interaction=nonstopmode -halt-on-error -file-line-error report/main.tex`. Dari folder `report/`, `latexmk main.tex` memakai `latexmkrc` lokal (XeLaTeX+Biber). Tidak perlu shell-escape.

Jangan memuat geometry, font, titlesec, natbib, atau bibliographystyle tandingan pada main.tex. Format utama tetap berada di style yang diimpor. Peringatan underfull akibat perataan tanpa pemenggalan dinilai melalui render, bukan dihilangkan dengan mengubah aturan template secara diam-diam.
