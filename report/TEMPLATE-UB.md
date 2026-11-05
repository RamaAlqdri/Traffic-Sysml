# Asal template laporan dan adaptasi proyek

Template sumber pengguna:
`/Users/ramadhanial-qadri/Documents/My_File/Tesis/Flood Simulation/tesis-literatur/template-latex-ub`.
Panduan `PANDUAN.md`, style `gaya/ubtesis.sty`, sampul `awal/sampul.tex` dan `latexmkrc` dibaca sebelum migrasi. Folder sumber tidak diubah. Logo `gambar/logo-ub.jpg` disalin utuh.

## Format yang diadopsi

- Class report, A4, 12 pt; margin kiri 4/kanan 3/atas 3/bawah 3 cm, bagian awal atas 3,5 cm.
- Judul pembahasan berupa poin bernomor tanpa label BAB, dengan hierarki section/subsection. Indent paragraf 0,75 cm, leading 14,65 pt dan penomoran halaman isi Arab mengikuti paket gaya.
- Sampul/logo UB langsung diikuti pembahasan; tanpa Ringkasan, Daftar Isi, Daftar Tabel, Daftar Gambar atau Daftar Lampiran sesuai revisi pengguna.
- Grid penuh, caption tabel di atas/gambar di bawah, nomor tabel/gambar/persamaan berurutan, sumber di bawah ilustrasi/tabel, continuation longtable melalui perintah template.
- Bibliografi Harvard lokal dari paket gaya melalui biblatex/Biber; source jurnal dan klaim substantif tetap seperti baseline.

## Adaptasi eksplisit

1. **Calibri asli**, sesuai instruksi pengguna 5 November 2026. Template sumber memakai Carlito melalui pdfLaTeX; salinan style di proyek mengganti blok font/engine dengan fontspec dan XeLaTeX. Math tetap newtxmath sebagaimana template. Font Calibri berasal dari instalasi Word lokal, tidak didistribusikan dalam repository. Default path `/Applications/Microsoft Word.app/Contents/Resources/DFonts/`; jika Calibri sudah terdaftar sistem, nama font dapat dipakai. Pada mesin lain, tentukan `\ubcalibripath` sebelum memuat style atau pasang Calibri. Tidak ada fallback diam-diam ke Carlito.
2. Jenis naskah **LAPORAN PROYEK**, dengan dua baris penyusun berpasangan nama/NIM: Edy Rahman (256150100011007), Ramadhani Al-Qadri (256150100011010). Departemen Teknik Informatika berasal dari pengguna. Program Studi Magister Ilmu Komputer mengikuti konteks proyek MILKOM. Metadata terpusat di `report/metadata.tex`.
3. Folder isi `sections/` tetap digunakan agar source lama dapat ditelusuri. Top-level memakai section dan level turunannya subsection, tanpa chapter bernomor. Penomoran section, tabel, gambar dan persamaan dibuat berurutan di style agar tidak menyisakan prefiks chapter nol. Entri requirement ditata sebagai kartu tabel dua kolom dengan baris Pernyataan, Sumber, Alasan, Verifikasi, dan Penelusuran; dikelompokkan menurut enam jenis pada katalog. Setiap kartu dijaga utuh saat pergantian halaman, memakai Calibri 12 pt, jarak baris lebih longgar, dan jarak antar-kartu. Bagian Requirements dimulai pada halaman baru, disertai panduan kode dan penelusuran. Penanda, statement 24 requirement, nilai ASM, dan label diagram tidak diganti oleh migrasi format.
4. `bibliography.bib` tetap dibagi dengan Beamer. Source map laporan menormalkan penanda tahun `n.d.` menjadi tahun kosong agar gaya UB mencetak `t.t.` tanpa mengarang tahun. Key, DOI dan data jurnal tidak berubah. Laporan memakai Biber; Beamer mandiri yang tidak diminta diganti formatnya tetap memakai BibTeX/pdfLaTeX. Ini pengecualian toolchain per artefak yang disengaja, bukan dua backend dalam dokumen yang sama.
5. Bagian Landasan Teori dan Studi Literatur tidak disertakan dalam PDF sesuai instruksi terbaru pengguna. Source lama `sections/02-theory-literature.tex` dan `awal/ringkasan.tex` tetap tersimpan tetapi tidak di-input; kajian/evidence lengkap berada pada source riset. Sitasi normatif SysML dan kajian MBSE diletakkan pada pembahasan model/diskusi yang relevan.
6. Font gambar diagram yang sudah tertanam di PDF aset tetap merupakan bagian gambar. Body, judul, caption dan bibliografi laporan memakai Calibri; matematika memakai font math template. Source model tidak diubah hanya untuk mengganti font dokumen.

## Build

Dari root: `make build`. Laporan: `latexmk -xelatex -cd -interaction=nonstopmode -halt-on-error -file-line-error report/main.tex`. Dari folder `report/`, `latexmk main.tex` memakai `latexmkrc` lokal (XeLaTeX+Biber). Tidak perlu shell-escape.

Jangan memuat geometry, font, titlesec, natbib, atau bibliographystyle tandingan pada main.tex. Format utama tetap berada di style yang diimpor. Peringatan underfull akibat perataan tanpa pemenggalan dinilai melalui render, bukan dihilangkan dengan mengubah aturan template secara diam-diam.
