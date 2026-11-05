# Register asumsi desain awal

Status: dasar awal Tahap 1; belum merupakan baseline requirement yang lengkap. Semua keputusan di bawah adalah asumsi/rationale proyek, bukan temuan jurnal. Instruksi pengguna mengizinkan baseline ini hanya bila materi tugas atau evidence relevan tidak menetapkan lain. Nilai parameter numerik yang belum dipilih tidak boleh dianggap sudah terverifikasi atau digunakan untuk menyatakan requirements-complete.

| ID | Keputusan/parameter | Rationale dan sumber yang diperiksa | Dampak dan verifikasi | Status |
|---|---|---|---|---|
| ASM-001 | Satu simpang empat pendekat North/South/East/West; tanpa fase pedestrian atau belok khusus | baseline pengguna; EVID-TRF-002 membahas empat lengan tetapi scope gerak berbeda | sebelum modeling tetapkan gerakan dan conflict matrix; inspeksi konsistensi seluruh view | accepted untuk lingkup awal |
| ASM-002 | Input abstrak vehicleCount per pendekat; proksi kondisi traffic, bukan kendaraan/km | pengguna; EVID-TRF-003/006 | definisikan area dan apakah hitungan snapshot atau arus pada interval; uji unit/satuan input | definisi pengamatan pending Tahap 2 |
| ASM-003 | Kapasitas hanya digunakan bila tersedia dan satuannya kompatibel; jika tidak, kategori rendah/sedang/tinggi | pengguna; corpus belum memberi kapasitas lokasi proyek | ambang kategori dan rentang input harus dipilih/didokumentasikan sebelum uji | pending nilai ambang |
| ASM-004 | Urutan nominal density → longest waiting → deterministic round-robin; fairness dapat mengalahkan density pada batas aman | pengguna; EVID-TRF-001 memakai fungsi gabungan yang berbeda; EVID-TRF-004 mengandung konflik pseudocode/contoh | tentukan tie, pointer, awal/reset timer, guard anti-starvation dan bukti kelayakan; bukan replikasi algoritme jurnal | accepted konsep; detail pending |
| ASM-005 | minimumGreen, maximumGreen, maximumWaitingTime wajib; belum dipilih angkanya | pengguna; EVID-TRF-003 hanya memberi cycle/amber contoh, bukan ketiga batas ini | saat requirements tentukan detik, batas, scheduler dan kelayakan untuk seluruh fase serta clearance | pending angka dan analisis |
| ASM-006 | observationInterval, decisionUpdateInterval dan batas stale harus eksplisit; keputusan nominal pada batas fase | pengguna; EVID-TRF-006 memproses timer berikutnya tetapi bukan sumber interval proyek | definisikan hubungan interval dan sampel yang jatuh saat green; uji timeline | pending angka/aturan tepat |
| ASM-007 | Data invalid/hilang/stale memicu default timing/fail-safe dan pemulihan yang eksplisit | pengguna; EVID-TRF-007 tidak membuktikan failure handling siap pakai | definisikan kelas kegagalan, kondisi fallback, transisi aman dan syarat pulih; jaminan nominal tidak otomatis berlaku saat fault | accepted wajib; strategi pending |
| ASM-008 | Transisi keselamatan serta matriks konflik disusun eksplisit sebelum model | pengguna; EVID-TRF-002/003 memberi contoh fase/amber tanpa parameter lokasi proyek | pilih gerakan yang didukung, yellow/all-red dan interlock; analisis conflicting green | pending konfigurasi |
| ASM-009 | Tidak mengimplementasikan CNN atau emergency preemption pada baseline | pengguna; teknologi artikel TRF2 bukan kewajiban tugas (EVID-TRF-007, EVID-LEC-005) | interface detector menerima hitungan; inspeksi scope dan boundary | accepted |
| ASM-010 | Usulan acuan model: subset SysML 1.6, versi tetap | catatan memakai keluarga konsep BDD/IBD/requirement tetapi tidak menyebut versi; halaman resmi OMG 1.6 diperiksa | catat subset, pemetaan renderer dan relasi secara eksplisit; bukan klaim dosen menetapkan 1.6 atau sertifikasi engine | accepted sebagai pilihan proyek, bukan fakta kuliah |

## Parameter sumber yang tidak otomatis diadopsi

Mondal & Rehena menggunakan cycle 120 s, total amber 10 s, amber 2.5 s per fase dan green fixed-time 27.5 s pada konfigurasi simulasinya (EVID-TRF-003/005). Tidak ada angka tersebut yang telah dipilih menjadi minimumGreen, maximumGreen, maximumWaitingTime, observationInterval, decisionUpdateInterval atau stale threshold proyek. Mathiane et al. membahas perhitungan timer dan pemrosesan menjelang pergantian sinyal; konteksnya tidak langsung menetapkan interval pengamatan baseline.

## Aturan penutupan asumsi

Sebelum gate requirements: setiap pending diubah menjadi nilai/aturan yang dapat diuji, disertai rationale, satuan, dampak, sumber yang telah diperiksa, dan metode verifikasi. Jika tidak ada angka yang relevan dari corpus, pilih angka sebagai asumsi desain konseptual yang jelas; jangan menunggu seolah jurnal pasti harus memberi parameter lokasi. Ketika nilai berubah, update requirement, seluruh view model, skenario, laporan, slide dan log keputusan. Tidak ada klaim bahwa desain ini siap digunakan di jalan nyata.


## Resolusi baseline konseptual — 3 November 2026

Bagian awal merekam status Tahap 1; tabel ini menggantikan pending untuk baseline pemodelan, tanpa menghapus jejak keputusan. Kontrak lengkap, rumus bound dan batas fault ada di `problem-formulation.md`. Seluruh angka berikut merupakan asumsi desain kelompok, bukan temuan jurnal atau standar jalan.

| ID | Nilai/aturan final baseline | Rationale, dampak, dan verifikasi |
|---|---|---|
| ASM-001 | empat pendekat, lurus saja, setiap pasangan berbeda dieksklusikan | baseline konservatif memperjelas konflik; inspeksi matriks dan semua transisi |
| ASM-002 | snapshot antrean per pendekat pada akhir jendela 1 s; record count integer 0..2147483647, approach, timestamp monotonic, valid | input penerimaan hitungan memenuhi scope tanpa ML; validasi domain dan timestamp, bukan kalibrasi sensor fisik |
| ASM-003 | tanpa kapasitas lokasi; LOW 0..5, MEDIUM 6..15, HIGH ≥16 | tiga rentang sederhana, mencakup semua count valid; uji nilai batas 0/5/6/15/16; tidak diklaim ambang universal |
| ASM-004 | setiap pendekat tepat sekali per round; eligible diranking kategori, waktu tunggu, ring N/S/E/W; cek deadline, EDF override bila perlu | mencegah monopolization; bukti 24×24 urutan round bersebelahan, serta uji tie/ring |
| ASM-005 | green LOW/MEDIUM/HIGH = 10/20/30 s; min 10, max 30, maksimum tunggu 210 s sejak akhir green | grid durasi mudah diaudit; worst-case 208 s termasuk clearance, margin 2 s hanya pada model clock ideal; analisis matematis dan enumerasi |
| ASM-006 | observation/update input 1 s; decision tick 1 s hanya pada akhir all-red; stale bila umur >3 s | seluruh durasi kelipatan tick, tidak mengubah grant aktif; periksa timeline dan umur tepat 3 / >3 s |
| ASM-007 | dataFault dilatch segera; grant aktif diselesaikan, lalu clearance dan fallback green10 ring; pulih setelah 3 frame lengkap baik pada tick berbeda dan round baru | membatasi osilasi mode; no timer reset/no round reset saat fault; walkthrough fault/recovery |
| ASM-008 | yellow3 s, all-red1 s tiap pergantian; startup all-red1; command invalid→SafetyHold all-red sampai restart | semua pasangan gerak dipisah; uji konflik/clearance, nyatakan SafetyHold mengecualikan min-green/wait bound nominal |
| ASM-009 | tanpa CNN/emergency/dashboard | scope tetap, inspeksi boundary |
| ASM-010 | SysML 1.6 subset requirement, use case, activity, interaction, state machine, block, part, port, connector/item flow, satisfy/verify/allocate | konsisten dengan keluarga konsep kuliah; versi pilihan proyek, bukan versi yang dinyatakan dosen; QC pemetaan dan semantik |

Tidak ada ASM-002–008 yang masih pending untuk baseline konseptual ini. Area pengamatan/kapasitas fisik, delay hardware, geometri clearance dan sensor nyata tetap di luar scope; bukan parameter yang diam-diam diasumsikan telah dikalibrasi. Perubahan nilai memerlukan revisi seluruh artefak dan bukti bound.
