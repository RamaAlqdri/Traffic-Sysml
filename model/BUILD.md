# Build native SysML v2

Keputusan pengguna 7 November 2026 menggantikan stack SysML 1.6/Mermaid/PlantUML. Source `model/**/*.sysml` bersifat utama; source v1 hanya arsip. Nama `bdd.sysml`/`ibd.sysml` dan ID BLK/P/C dipertahankan untuk keterlacakan, bukan klaim bahwa metaclass UML block/proxy port adalah metaclass SysML v2.

## Toolchain yang dikunci

- `sysml-v2-lsp@0.42.0`: parser ANTLR dan sebagian semantic diagnostics, memakai standard library paket.
- Renderer `sysml-v2-support`, commit `a4f3e48630842c173117aa1736bf46115929bc13` (package 0.59.0), dari https://github.com/daltskin/VSCode_SysML_Extension. Adapter memakai `modelSnapshot` dan `diagramShell` upstream serta runtime/vendor assets yang sama dengan ekstensi VS Code. Tidak menggambar ulang memakai Mermaid/PlantUML/Graphviz.
- Puppeteer 24.31.0 dengan Chrome for Testing untuk render headless; esbuild 0.25.12 membundel adapter resource lokal. Semua versi/integritas npm tercatat pada package-lock.json.
- Librsvg mengonversi SVG hasil native renderer ke PDF; LaTeX/font mengikuti template laporan.

`make setup` menjalankan npm ci. Browser diunduh oleh setup Puppeteer; dapat menggunakan CHROME_BIN jika perlu. Build sesudah setup hanya memakai proses lokal dan HTTP loopback untuk resource renderer; tidak mengirim model ke layanan eksternal.

## Langkah dan pemeriksaan

1. Buka semua source pada LSP lalu validasi teks bersama-sama melalui API `sysml/validateText` yang diaktifkan secara eksplisit. Ini API experimental pada versi paket yang dikunci. Parser errors membuat build gagal; advisory tetap disimpan pada `.build/sysml-diagnostics.json` dan diringkas pada receipt.
2. Ekstrak AST, parameter tunggal dari StlTypes (atribut komponen mereferensikan parameter tersebut, bukan literal duplikat), 24 requirement, satisfaction/verification links, sembilan transition lifecycle, urutan pesan serta boundary input. Pemeriksaan kontrak menolak timer literal sebagai pengganti `lockedGreen`, perubahan parameter ASM tanpa revisi kontrak, grant di luar 10..30, dan requirement tanpa satisfy/verify.
3. Render tujuh view dari AST. `tools/views.json` hanya konfigurasi pemilihan view/elemen; requirement overview memang empat dari 24 requirement. Seluruh requirement dan relasinya tetap dalam source/receipt.
4. Turunkan requirements.md dan kartu LaTeX dari `doc` requirement; sumber perubahan kebutuhan adalah requirements.sysml. Enam kelompok dan format kartu yang diminta pengguna dipertahankan.
5. Checker Python mengambil parameter dari receipt tervalidasi, memeriksa source hash dan validator hash agar tidak memakai data lama, lalu melakukan analisis referensi. Regression tests memeriksa timer 999 s ditolak, link verify hilang ditolak, ekspansi port/part IBD benar, dan parser menolak sintaks rusak.
6. Ekspor SVG→PDF, kompilasi laporan dan Beamer, lalu QC visual. `make check-model` menjalankan langkah validasi/kontrak/tests tanpa render dan LaTeX.

## Adaptasi visual yang eksplisit

- Part/port usage IBD diwarisi dari part/port definition. Native renderer tidak mengembangkan inheritance lintas file pada input per berkas; adapter meresolusikannya dari AST dan menampilkan sembilan part (sumber eksternal + delapan part internal). Prefix context `smartTrafficLight.` dihilangkan dari label endpoint pada view internal saja. Sepuluh connection dan sepuluh item flow tetap bersumber dari SysML.
- View state menampilkan exhibit `SignalController.lifecycle` beserta state definition yang digunakannya. Layout flat/nested mengikuti renderer; teks transisi yang panjang dapat diringkas oleh UI. Source tetap acuan detail guard/effect.
- Native parser memberi `occurrence` pesan berupa nomor urut. Renderer upstream menambahkan akhiran `s`; adapter menghilangkan anotasi waktu buatan itu. Pesan ditampilkan dengan ID m01..m21 + payload. Sequence menyatakan urutan, bukan timestamp eksekusi; tiga frame recovery tetap tiga pesan berbeda.
- Seed layout browser dikunci untuk mengurangi variasi posisi pada native Graph View; PDF tetap tidak diklaim identik bit-for-bit lintas environment.
- Tema cetak terang diberikan pada variabel warna VS Code agar garis/panah tetap terlihat pada SVG mandiri. Export bounds diberi padding berdasarkan bbox aktual, termasuk header lifeline paling kiri. Ini penyesuaian ekspor, bukan pengubahan semantik model.
- Overview definisi struktur mengelompokkan part usage menurut tipe target untuk menampilkan enam definisi pada native Graph View. Garis adalah graf kepemilikan yang diagregasi; bukan klaim notasi diamond UML. Nama panjang dapat dipendekkan oleh renderer. Requirement overview menampilkan empat kebutuhan tanpa subject/metadata tambahan; semua field lengkap tetap ada di kartu.
- CaseView upstream hanya menampilkan aktor/use case pada model ini; include/dependency tetap eksplisit pada source dan narasi, tidak diklaim lengkap pada gambar. Nama panjang dapat dipendekkan oleh renderer, sementara ID tetap terlihat.
- Overview tidak menampilkan semua elemen/relasi; native SVG/PDF standalone tersedia untuk pembesaran. Detail kebutuhan ada pada kartu, dictionary dan source.

## Batas klaim

Parser komunitas ini bukan sertifikasi OMG, validator seluruh constraint normatif, atau interpreter SysML penuh. Tindakan controller sebagian merupakan kontrak aksi konseptual; build tidak mengklaim mengeksekusi scheduler/phase engine SysML lengkap, hardware, detector atau arus kendaraan. Analisis 208 s tetap berlaku pada asumsi nominal yang dinyatakan, dan `not-run` tetap dipertahankan untuk skenario yang belum dieksekusi. Peringatan integritas sumber MBSE yang sudah dinyatakan tidak hilang karena migrasi.

Acuan normatif: https://www.omg.org/spec/SysML/2.0/Language/PDF. Pemetaan ID/owner dan endpoint ada di traceability-matrix.md.
