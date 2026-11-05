# Issues Log

> Catat blocker, error, mismatch source, atau build problem.

Template:

```md
## ISSUE-XXX — <title>

- Date:
- Severity: low | medium | high
- Stage:
- Description:
- Cause:
- Attempted fix:
- Status: open | resolved | deferred
- Resolution:
```

## ISSUE-001 — Gate isi materi kuliah belum diverifikasi penuh

- Date: 2026-11-02 10:33:24 WIB
- Severity: high untuk memulai modeling
- Stage: Tahap 0
- Description: pemeriksaan awal tidak menemukan materi kuliah. Saat pemeriksaan akhir muncul lecture/README.md, lecture/01-pengantar-mbse.md, dan lecture/02-pemodelan-mbse-sysml.md. Kedua catatan menyatakan merupakan materi yang diperluas dari slide.
- Cause: materi baru ditambahkan ke workspace selama pekerjaan; slide asal belum ditemukan pada inventaris saat ini.
- Attempted fix: identifikasi file, baca pembuka/struktur dan sebagian isi; perbarui audit serta deteksi materi alternatif dalam Makefile. Tidak mengubah file lecture/ dan tidak membuat PDF pengganti.
- Status: open
- Resolution: ketersediaan catatan terpenuhi; sebelum modeling, tinjau isi lengkap, catat identitas/lokasi bagian yang dipakai dan bedakan substansi kuliah dari perluasan. Tidak mensyaratkan nama/format PDF tertentu. Jika atribusi ke slide asli tidak dapat diperiksa, nyatakan keterbatasan itu tanpa mengarang sumber. Literatur dapat dianalisis secara independen.

## ISSUE-002 — Build proyek belum dapat dijalankan sampai source tersedia

- Date: 2026-11-02 10:33:24 WIB
- Severity: medium
- Stage: build preflight / starter
- Description: make build mengembalikan exit code 2 karena tujuh source diagram serta report/main.tex, report/bibliography.bib, dan presentation/main.tex belum dibuat. Ini sesuai tahap starter, bukan kegagalan kompilasi dokumen yang sudah ada.
- Cause: modeling/penulisan belum dimulai; scope saat ini adalah revisi panduan dan audit.
- Attempted fix: pastikan preflight menolak source hilang, propagasi kegagalan ke make, serta append output ke logs/build.md. Smoke rendering Mermaid dan PlantUML pada fixture generik temporer berhasil; syntax PlantUML invalid ditolak.
- Status: open
- Resolution: build-unverified; bukan source-complete atau release-complete. Lengkapi source sesuai urutan tahap/gate lalu ulangi make build dan QC. Tidak membuat source palsu untuk meloloskan build.

## ISSUE-001 — Update: gate catatan kuliah terpenuhi

- Date: 2026-11-02 11:53:46 WIB
- Stage: Tahap 0 / persiapan Tahap 1
- Status: resolved untuk ketersediaan dan relevansi sebelum modeling
- Resolution: materi Markdown ditinjau pada bagian yang relevan; identitas/lokasi dan batas provenance dicatat di research/lecture-review.md serta EVID-LEC-001–005. Materi dipakai sebagai catatan yang disediakan pengguna, bukan kutipan slide asli. Tidak memerlukan nama/format PDF tertentu. Isi perluasan tidak diatribusikan ke slide tanpa bukti; tidak ada klaim kecocokan penuh dengan slide yang belum tersedia.

## ISSUE-003 — Perbedaan internal artikel traffic

- Date: 2026-11-02 11:53:46 WIB
- Severity: medium
- Stage: Tahap 1
- Description: TRF1 Algorithm 1 menyebut ascending sedangkan contoh memilih prioritas tertinggi; TRF2 memakai istilah 90% throughput dan 90% faster pada tempat berbeda. Rumus normalisasi TRF1 membutuhkan penanganan input sama agar penyebut tidak nol.
- Cause: perbedaan narasi/pseudocode dan definisi metrik pada sumber; bukan error proyek yang telah diuji.
- Attempted fix: baca konteks dan tinjau visual TRF1 PDF 6 serta TRF2 PDF 17. Catat EVID-TRF-004/008 dan analisis matematis rumus; jangan mengklaim klarifikasi dari penulis.
- Status: resolved untuk penggunaan evidence terbatas
- Resolution: tidak mereplikasi aturan/angka ambigu; kontrak baseline dan asumsi proyek harus didefinisikan sendiri. Tidak ada hasil eksperimen proyek yang diklaim.

## ISSUE-004 — Integritas PDF MBSE dan batas verifikasi online

- Date: 2026-11-02 11:53:46 WIB
- Severity: medium
- Stage: Tahap 1
- Description: preflight pypdf 6.21.4 memberi UNAVAILABLE untuk PDF MBSE dengan peringatan xref object 824; seluruh 26 halaman terbaca. MDPI merespons 429, sementara Wiley setelah pembacaan awal merespons 403 pada permintaan lanjutan.
- Cause: cakupan indeks objek PDF dan batas akses penerbit; tidak ditafsirkan sebagai sumber tidak ada.
- Attempted fix: gunakan preflight resmi ARS, simpan hash/sidecar; cocokkan metadata penerbit yang dapat diakses; gunakan locator bagian untuk MBSE. Kedua PDF traffic memperoleh PASS.
- Status: open
- Resolution: tidak mengubah PDF pengguna atau mencoba melewati batas akses. Evidence MBSE ber-confidence medium dengan locator bagian; identitas MDPI bersumber PDF lokal, tidak mengklaim verified-online. Pemeriksaan penuh integritas/online tetap belum selesai, tetapi penggunaan terbatas dan batasnya sudah diungkapkan.

## ISSUE-002 — Update: source dan build baseline tersedia

- Date: 2026-11-03 09:50:01 WIB
- Status: resolved
- Resolution: tujuh source diagram, katalog, traceability, verification, laporan modular dan Beamer telah dibuat; make build terakhir exit0 dan kedua PDF diperiksa. Receipt/hashes di logs/qc.md. Ini tidak menyatakan hasil traffic/hardware yang belum diuji.

## ISSUE-005 — Error authoring/rendering sementara dan QC gambar

- Date: 2026-11-03 09:50:01 WIB
- Severity: medium
- Stage: Tahap2–11
- Description: generator temporer sempat gagal append log karena timestamp belum didefinisikan; label PlantUML mengandung newline literal yang salah; opsi Mermaid --pdfFit tidak tersedia pada CLI12; folder presentation belum dibuat pada percobaan awal; formatting whitespace sempat memengaruhi key LaTeX; escape tab pada dimensi gambar membuat render report hampir tak terlihat walaupun compile sukses.
- Cause: escaping/urutan authoring dan perbedaan opsi CLI, bukan error jurnal pengguna.
- Attempted fix: source diperbaiki, opsi native CLI diperiksa, direktori dibuat; key/encoding dipulihkan. Visual QA menemukan dimensi gambar, diperbaiki dan ditambahkan regression assertion; activity diringkas dan port diberi ID untuk menghindari overlap. BibTeX n.d. eksplisit dan sitasi Beamer dipisah author/year.
- Status: resolved
- Resolution: build final dan visual QA lulus; tidak menghapus log error/first-pass warning terdahulu. Struktur source model tidak mengandung control character pada includegraphics atau action ID ganda. Seluruh source jurnal tetap tidak berubah.

## ISSUE-004 — Update disposition keterbatasan source

- Date: 2026-11-03 09:50:01 WIB
- Status: deferred sebagai keterbatasan yang dinyatakan pada artefak
- Resolution: peringatan xref/akses tidak dinyatakan telah diperbaiki. Kajian memakai locator bagian/identitas PDF yang terbaca serta confidence terbatas; laporan memuat batas tersebut. Tidak mengubah sumber atau melewati batas akses. Tidak menghalangi rilis artefak konseptual dengan batas klaim yang sudah diperiksa.

## ISSUE-006 — Migrasi template UB: backend dan disposition tipografi

- Date: 2026-11-05 12:37:23 WIB
- Severity: build blocker sementara; typography advisory tersisa.
- Cause: file main.bbl lama berasal dari BibTeX/natbib dan tidak kompatibel dengan biblatex/Biber. Probe Calibri berdasarkan nama awalnya mencari font belum terdaftar sebelum path lokal dipakai.
- Attempted fix: simpan PDF dan intermediate lama di tmp/template-ub-backup; regenerasi intermediate laporan melalui XeLaTeX+Biber; cari file Calibri Word terlebih dahulu sebelum lookup font sistem. Source template dan bibliography tidak diubah.
- Status: blocker resolved; make build final exit0, tanpa undefined reference/citation, error, overfull atau warning paket pada log final.
- Disposition: 73 underfull hbox tetap dilaporkan pada log laporan karena perataan penuh dan pemenggalan nonaktif mengikuti style UB. Seluruh 30 halaman ditinjau; tidak ada clipping/overlap material. Tidak menyembunyikan warning atau mengubah aturan style untuk menghilangkannya. xdvipdfmx mengabaikan tag struktur pada PDF Mermaid yang diimpor; diagram tetap tertampil, bukan klaim PDF aksesibel/bertanda struktur penuh.
- Verification: font Calibri/Calibri-Bold/Calibri-Italic embedded, Carlito tidak dipakai; metadata PDF dan sampul benar, 24 ID requirement dan enam key sitasi terpelihara; hasil di logs/qc.md.
