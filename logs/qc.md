# QC receipt — baseline konseptual

Date: 2026-11-03 09:50:01 WIB. Status: **release-complete untuk artefak akademik konseptual**. source-complete dan build-verified terpenuhi untuk snapshot di bawah; ini bukan status controller hardware atau seluruh test runtime passed.

## Gate yang diperiksa

- Research tiga jurnal dan catatan kuliah tersedia; evidence/asumsi terpisah. Source pengguna tidak berubah (hash tiga PDF cocok dengan sidecar preflight).
- 24 requirement unik; source, rationale, metode, behavior/block dan VER terhubung. Sepuluh action node memiliki ID unik. 21 verification scenario tersedia.
- Tujuh view SysML1.6 memiliki source; Mermaid dan enam PlantUML berhasil dirender ke PDF (PlantUML juga SVG). Dictionary memisahkan block/type, part usage, typed port/interface, connector/item flow serta arah satisfy/verify/allocate. Inspection subset ada pada manual-inspection.md, bukan sertifikasi formal.
- `make build` terakhir exit0. Engine pdfLaTeX/latexmk4.88; backend BibTeX dengan natbib/plainnat; bukan Biber. Font dokumen Latin Modern; contoh font diagram yang diperiksa pdffonts: Helvetica/Bold tertanam, termasuk glyph Type3. Versi diagram CLI tercatat pada build log.
- Latest report/main.log, presentation/main.log dan kedua main.blg tidak mengandung error, undefined reference/citation, overfull/underfull, atau warning. Warning first-pass/percobaan sebelumnya tetap tersimpan pada append-only build log; jangan menyamakannya dengan status final.
- Enam key bibliography semuanya disitasi, tidak ada orphan atau key hilang. Tahun catatan tidak diketahui dinyatakan n.d.; tidak mengarang penulis/dosen/tanggal.
- Semua tujuh PDF diagram terdaftar pada report/main.fls. Masalah escape tab pada dimensi gambar ditemukan melalui visual QA, diperbaiki, dan dilindungi regression assertion.
- Laporan final21 halaman; presentasi14 slide. Contact sheet seluruh halaman/slide ditinjau; halaman diagram diperiksa pada render lebih besar. Setelah revisi, activity13/sequence14 diperiksa ulang, begitu pula sitasi slide3. Tidak ada gambar hilang, overlap material atau konten keluar halaman pada hasil final yang ditinjau. Diagram vektor standalone tersedia untuk pembesaran lebih lanjut.
- Checker kontrak referensi lulus: 576 pasangan urutan, 2304 service waits, maksimum208s; kategori/tie/domain input/output state dan cross-links. `python -O` ditolak dengan exit1 agar assertion tidak dapat dilewati sambil menghasilkan receipt passed.
- Pemeriksaan acronym ARS dijalankan pada ekstraksi teks tersimpan; coverage body partial karena parser tidak mengenali abstrak Indonesia. Temuan CNN diperiksa manual: bentuk lengkap two-dimensional convolutional neural network (2D-CNN) ada pada bagian2.3; prefiks model/enumeration/publisher dikecualikan secara eksplisit. Tidak mengklaim validator acronym mendukung seluruh scope bahasa Indonesia.
- Diff source/administrasi bersih dari whitespace error bila raw logs/build.md dikecualikan. Raw terminal build log mengandung trailing whitespace dan dipertahankan untuk memenuhi kebijakan append-only.

## Disposition dan batas penggunaan

- ISSUE-004: integritas xref PDF MBSE masih UNAVAILABLE, MDPI429 dan akses Wiley lanjutan403 tidak dicoba dilewati. Pemakaian terbatas dengan locator bagian dan batas confidence telah dinyatakan; bukan klaim pemeriksaan source penuh selesai.
- Timeline phase engine/fault/recovery yang belum dieksekusi tetap not-run. VER-15/20/21 memiliki receipt inspection terpisah. Passed pada checker hanya kontrak referensi dan analisis yang disebutkan.
- Semua angka baseline merupakan ASM-*; belum kalibrasi sensor/geometri/clock/actuator fisik. Tidak ada hasil throughput baru, hasil deployment atau jaminan queue habis.
- Nama anggota, NIM dan identitas dosen tidak diberikan sehingga tidak diisi dengan identitas rekaan; judul penulis menyebut proyek akademik secara generik.
- Satu entry point build telah diuji pada toolchain lokal yang tercatat; environment lintas mesin belum dikunci bit-for-bit.
- Perubahan source model/dokumen/toolchain setelah snapshot ini mengembalikan status build-unverified hingga pemeriksaan terdampak diulang.

## Output final

- `report/main.pdf`: SHA-256 `041ca03ab4eeafe20b3f794d6af53a16515c4449289be8635078012e7c7bb61c`.
- `presentation/main.pdf`: SHA-256 `0b19a6076a70dde6a9c616147e0378e6ed232c455d3b5a05ab3f61a3ec1e37b9`.

## Snapshot source build/model

| File | SHA-256 |
|---|---|
| `Makefile` | `6822299840a999cc9774af6bda2e614b3682ccc884babd7399cf4e224a5d4172` |
| `report/main.tex` | `e1fd89752a76484161a9a0d1550e8556288773067189dc7c2aaa4ac732a3ca79` |
| `report/sections/01-introduction.tex` | `9ba418b5150fcc96c8d0bd69fad7afb8b039b349cf3025e9446ab6476bded111` |
| `report/sections/02-theory-literature.tex` | `7e0d22ada69ee9c203bbe13bd5d1463765ae98c8607afbebf2add6958dbb0b63` |
| `report/sections/03-problem.tex` | `91fa7a295dbcdb497bb94500da8874cfd48a263ceeeeb887629c835a742b50f4` |
| `report/sections/04-requirements.tex` | `b9fe1957131ba0962fee957996152bfc309018148abe09808b671edad08a85a8` |
| `report/sections/05-models.tex` | `3a28a055e0acb56c9d3b79508cb2a1969d7f56a77dc3ad962a142841d818ae43` |
| `report/sections/06-trace-verification.tex` | `cd881a0fb4f1ab55ff07e3fdc141c0c7edbe5968fccbd03df28979607ac0ba48` |
| `report/sections/07-discussion-conclusion.tex` | `ce34adf0db5204df5c61b8ff6ad6ed81ab8fb633471d1752064b862eeb66f2c2` |
| `report/bibliography.bib` | `a03de0ee1496eed40f7a2cfcc19b29a3ecb314ef24c65a813145a1d01381a713` |
| `presentation/main.tex` | `c038679aae27cdc06e894a24074ef2561783f23ee6c6ecb9e1587af9cce796b0` |
| `model/behavior/activity.puml` | `8ab8926b6123b9639cbd21e032f0167c1ca8ee06dddc38899f7ab5dedf46eb46` |
| `model/behavior/sequence.puml` | `05e839e519d0d9dbed6bb513df0b41c878855b37f878dcfca7bba0b21a2344c6` |
| `model/behavior/state-machine.puml` | `f953cacf2da3b1648974e14a090971c5165bc813cf698b63bd1a0aa879b64052` |
| `model/behavior/use-case.puml` | `5f7279efb39ae2aa3ca7d30951714020537c45b7186651ecb61f5a600a93a2b0` |
| `model/structure/bdd.puml` | `78eb7444bf26c1add308e8c1214dfc571e5c9ba653846748b7210ec199f10590` |
| `model/structure/ibd.puml` | `945e245e36b9cc61eb2bc5096b647634c180b221400dd5f28efa7e707dd7db77` |
| `model/requirements/requirements.mmd` | `2705e7bdd81e972ab6b55fb9a5f3d8c810ed772d1550a0876350ae4e9c6be08f` |
| `model/verification/check_model.py` | `e575173d68086e755abb91cfd7bdfbba51357ecc6fbd9aa50fcda12fa7fb2253` |
| `model/requirements/requirements.md` | `b7fc44c99bda88d38ac0045cf124f04ede5fef8a85f7a3b036cd3d4644ec38c8` |
| `model/traceability/traceability-matrix.md` | `9bacdc79d1de25d6a1a8185edb65d214b5e456f180a7d2acf88f9a4b0d884ba6` |
| `model/verification/verification-scenarios.md` | `8d6fdfcd584e8c76d47515b6292329b89f92f02e2e00e3707dec364beb32aad0` |
| `research/problem-formulation.md` | `c8866b9f4ce73b87f824d99c6a70735fce9f019b6eefe83cfba2b7724b24a683` |
| `research/design-assumptions.md` | `60385f541237532858635aecb18a01e744b6d3633d84fe02ee21f58af5fd9b85` |

## 2026-11-05 12:37:23 WIB — QC revisi template UB (menggantikan snapshot format laporan sebelumnya)

- Status: source-complete → build-verified → release-complete untuk artefak akademik konseptual dengan batas verifikasi baseline tetap berlaku.
- Scope: laporan memakai template lokal UB yang diminta, bukan style tiruan. Snapshot laporan lama 21 halaman/pdfLaTeX/BibTeX dan metadata generik pada receipt sebelumnya tidak berlaku untuk laporan terkini. Laporan sekarang 30 halaman (6 awal, 24 isi/referensi), XeLaTeX+Biber. Beamer tetap 14 slide/pdfLaTeX/BibTeX dan source-nya tidak berubah.
- Command: make build final exit0; log mentah append-only ada di logs/build.md. Checker mengulangi 576 pasangan urutan/2304 service waits (maksimum 208 s), cross-links 24 requirement/21 definisi verification. Ini bukan eksekusi timeline diagram, simulator traffic atau perangkat fisik; skenario not-run tetap not-run.
- Template: gaya setelah `\RequirePackage{textcomp}` identik sumber; logo identik byte. Font/engine dan blok penyusun disesuaikan secara eksplisit; sumber template tidak ditulis. Asal/adaptasi dan konfigurasi font ada di report/TEMPLATE-UB.md.
- Cover: Edy Rahman (256150100011007), Ramadhani Al-Qadri (256150100011010), Departemen Teknik Informatika. Program Studi Magister Ilmu Komputer mengikuti konteks MILKOM. Nama/NIM/departemen diperiksa visual dan ekstraksi teks (normalisasi glyph hyphen Unicode), author metadata PDF benar.
- Font: pdffonts mengonfirmasi Calibri, Calibri-Bold dan Calibri-Italic TrueType tertanam; tidak ada Carlito. Sumber font `/Applications/Microsoft Word.app/Contents/Resources/DFonts/`. Font matematika dan font internal diagram mengikuti aset/style dan bukan penggantian font body. Font berlisensi tidak disalin ke repo.
- Content: seluruh 24 ID/statement/source/trace requirement terpelihara persis setelah normalisasi perubahan heading. Bibliography, source Beamer, source diagram, katalog, checker dan matrix/scenario model identik HEAD; hanya receipt hasil diperbarui oleh build. Semua enam key bibliography disitasi tanpa orphan/missing; semua tujuh PDF diagram terdaftar pada report/main.fls.
- Visual: semua 30 halaman ditinjau melalui contact sheet; sampul, ringkasan, daftar isi/tabel, bab, tabel berlanjut dan diagram diperiksa lebih besar. Setelah penyesuaian skala, activity/sequence/IBD diperiksa ulang. Sampul dan referensi PDF hasil make build akhir ditinjau kembali. Tidak ada gambar hilang, konten terpotong atau overlap material. Penomoran Romawi/Arab, BAB, grid/caption/sumber dan margin mengikuti style UB.
- Logs: final report/presentation .log/.blg tanpa error, undefined citation/reference, Overfull, LaTeX/Package warning. Laporan memiliki 73 Underfull hbox akibat format justification tanpa hyphenation; diterima setelah QA visual, tidak disamarkan sebagai nol warning tipografi. Peringatan xdvipdfmx tag PDF Mermaid diabaikan pada impor dan tidak mengubah gambar; tidak ada klaim aksesibilitas. Build percobaan lama tetap tercatat utuh.
- Batas sumber/model: ISSUE-004 dan batas model/kalibrasi/hardware pada receipt sebelumnya tetap berlaku. Tidak mengklaim verifikasi baru semantik SysML atau performance kendaraan hanya karena migrasi format berhasil.
- Whitespace: diff source/administrasi diperiksa dengan logs/build.md dikecualikan; whitespace raw terminal log dipertahankan sesuai append-only.

### Snapshot artefak revisi

| File | SHA-256 |
|---|---|
| `report/main.pdf` | `0cf89cc1d747a44e2429a93eceae5de6d99e919c02598854dee5bbafb26c5993` |
| `presentation/main.pdf` | `d4f0d8289fe4eb5eea8fdff216e87e8b4fdbca7958886190a4312fc2606b5dac` |
| `report/gaya/ubtesis.sty` | `3e52a390c7660e22a3e3bb53be9f0a5dceaccaabd1d71c89e738abf5e1896e14` |
| `report/awal/sampul.tex` | `b26a19ab6a2a61e0fa71bcbf4b02e3647f50533ede9e4bed86ccd9609d41d10d` |
| `report/metadata.tex` | `91b6c9049089b510500c4ce4a6b28f7ab5749b9c167c74aba219411e38b4b434` |
| `report/main.tex` | `5ea832e044557b76c0921319b4d0ade003206c5ce580e097648a436c851baa63` |
| `report/latexmkrc` | `6a22787f89caa22e6f63de4a8395d0ebb95fbedeba4e65e81338b3b771f3631b` |
| `Makefile` | `4a71c50a93eb048b385a0e1eb9067ad47ac37d5dd73f2a13961ae1515be472b8` |
