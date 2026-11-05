# Protokol kajian dan verifikasi sumber

Tanggal: 2 November 2026 (Asia/Jakarta). Corpus tetap dipilih pengguna: dua artikel traffic dan satu artikel MBSE; tidak ada penggantian, penambahan jurnal, pencarian exhaustif, atau klaim systematic review/PRISMA. Pertanyaan operasional: bagian mana dari sumber yang mendukung pemodelan SysML pengendali sinyal berbasis jumlah kendaraan, dan bagian mana yang masih merupakan keputusan desain?

## Metode dan batas cakupan

Kajian terarah atas abstrak, metode/perancangan, definisi input-output, contoh algoritme, hasil dan kesimpulan yang relevan. Daftar pustaka sumber tidak dipromosikan menjadi sumber yang telah dibaca. Evidence diekstrak dahulu; sintesis dilakukan setelah pemeriksaan sumber. Analisis dilakukan inline oleh satu agent dengan kontrak bibliography, source verification, lalu synthesis dari academic-research-suite/deep-research; bukan panel independen.

PDF diekstrak menggunakan `pdftotext -layout`. Halaman dihitung dari pemisah form-feed, dengan nomor cetak dicatat jika ada. Dua halaman kritis dirender dan ditinjau visual: traffic-1 PDF 6 (Algorithm 1 dan Table 1); traffic-2 PDF 17/cetak 1860 (Table 6, Figure 13, dan Conclusions). Halaman selain itu ditinjau melalui teks, bukan klaim pemeriksaan visual seluruh PDF. Ekstraksi traffic-2 mengandung lapisan teks ganda; teks ganda tidak dihitung sebagai evidence terpisah.

## Identitas corpus dan integritas baca

| Slug/citation key | File | Identitas lokal | Preflight struktur |
|---|---|---|---|
| mondal2022 | references/jurnal-traffic-1.pdf | Mondal & Rehena, 2022; SN Computer Science 3, 417; DOI 10.1007/s42979-022-01316-5 | PASS; 11 halaman |
| mathiane2023 | references/jurnal-traffic-2.pdf | Mathiane, Tu, Adewale & Nawej, 2023; Vehicles 5, 1844–1862; DOI 10.3390/vehicles5040099 | PASS; 19 halaman |
| campo2023 | references/jurnal-mbse.pdf | Campo, Teper, Eaton, Shipman, Bhatia & Mesmer, 2023; Systems Engineering 26(1), 104–129; DOI 10.1002/sys.21644 | UNAVAILABLE; 26 halaman terbaca, tetapi peringatan cakupan xref object 824 |

Sidecar beserta hash ada di `research/extracted/*-preflight.json`. Pemeriksaan awal tanpa pypdf menghasilkan UNAVAILABLE; setelah memasang pypdf dalam venv temporer `/tmp/traffic-research-venv`, pemeriksaan diulang. Hasil terakhir dicantumkan di atas. UNAVAILABLE pada MBSE tidak berarti FAIL atau PASS; gunakan locator bagian yang terlihat dalam teks, dan jangan mengklaim page-anchor telah terverifikasi.

Versi pembaca: pypdf 6.21.4. Reproduksi: buat venv terpisah dengan `python3 -m venv /tmp/traffic-research-venv`, pasang `pypdf==6.21.4`, lalu jalankan `ars/scripts/pdf_read_preflight.py <pdf> --output <sidecar.json>` menggunakan interpreter venv. Script berasal dari skill academic-research-suite yang terpasang; identitas/hash PDF dicatat pada sidecar. Cache teks dapat dibuat ulang dengan `pdftotext -layout references/jurnal-traffic-1.pdf research/extracted/jurnal-traffic-1.txt` dan pola yang sama untuk dua jurnal lain. Cache teks dan render sementara diabaikan Git; sidecar audit tetap disimpan. Pembaruan PDF memerlukan preflight dan ekstraksi ulang.

## Pencocokan eksternal

- [Springer](https://link.springer.com/article/10.1007/s42979-022-01316-5): judul, penulis, tanggal publikasi dan DOI cocok dengan PDF. Halaman web hanya menyediakan preview; analisis rinci memakai PDF lokal.
- [Wiley](https://incose.onlinelibrary.wiley.com/doi/10.1002/sys.21644): halaman awal berhasil dibaca dan identitas penulis/volume cocok; permintaan lanjutan ditolak 403. Tidak mengklaim seluruh isi PDF telah dicocokkan dengan web. Tahun bibliografi 2023 mengikuti volume cetak; tanggal copyright/accepted pada PDF adalah 2022.
- [MDPI](https://www.mdpi.com/2624-8921/5/4/99): akses web mengembalikan 429. Identitas artikel tersedia pada halaman pertama PDF lokal. Verifikasi eksternal tertunda; tidak ditafsirkan sebagai sumber palsu atau disamarkan menjadi verified-online.
- [OMG SysML 1.6](https://www.omg.org/spec/SysML/1.6): halaman spesifikasi resmi tersedia sebagai rujukan tambahan pemilihan versi; bukan pengganti kuliah atau jurnal wajib.

Tidak dilakukan audit indeks Scopus/WoS, penelusuran semua afiliasi, ataupun pemeriksaan retraction menyeluruh. Karena itu tidak ada klaim sertifikasi venue atau bebas retraction. API Semantic Scholar/OpenAlex/Crossref tidak dipanggil; corpus manual ini memakai PDF dan halaman penerbit.

## Kekuatan evidence dan ketidakpastian

Traffic-1 dan traffic-2 adalah studi desain/simulasi, bukan bukti lapangan untuk persimpangan proyek. Campo adalah kajian konten atas literatur/persepsi, bukan eksperimen kausal penerapan MBSE pada sistem ini. Hindari menerapkan hirarki klinis RCT secara mekanis pada engineering. Evidence cukup untuk rationale konsep adaptive control dan disiplin evidence; tidak cukup untuk jaminan keselamatan fisik atau persentase peningkatan proyek.

Traffic-1: perbedaan urutan ascending Algorithm 1 dan pemilihan prioritas tertinggi pada contoh harus didisposisikan. Traffic-2: abstrak menyebut 90% throughput, kesimpulan menyebut 90% faster; jangan mengonversinya menjadi target. Tidak ada replikasi eksperimen pada tahap ini. Campo menyatakan tidak melakukan penilaian mutu metodologi tiap sumber pada §2.1; kekuatan klaim agregat mengikuti cakupan tersebut. Funding NASA dan pernyataan tidak ada konflik kepentingan terlihat pada bagian akhir Campo; tidak menganggap funding otomatis meniadakan atau membuktikan bias.

Kajian disusun dengan bantuan AI. Pengguna/kelompok tetap perlu memeriksa kesesuaian interpretasi sebelum penyerahan akademik.
