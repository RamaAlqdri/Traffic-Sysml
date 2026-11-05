# Verification scenarios

Expected behavior berikut adalah kontrak konseptual. Passed hanya ditetapkan untuk analisis referensi/inspection yang benar-benar dilakukan; bukan hasil sensor/controller fisik atau simulasi throughput. Metode dan cakupan yang dijalankan tercantum pada verification-results.md.

## VER-01 — Boundary kategori
- Requirement: REQ-F-001
- Initial condition/input: count=0,5,6,15,16
- Stimulus/timeline: Klasifikasikan frame valid
- Expected behavior: LOW,LOW,MEDIUM,MEDIUM,HIGH
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: analysis: reference function
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-02 — Sekali per round
- Requirement: REQ-F-002
- Initial condition/input: N HIGH dan S/E/W LOW, semua eligible
- Stimulus/timeline: Berikan grant N lalu hitung eligible lagi
- Expected behavior: N tidak eligible lagi sampai round berikut; empat grant memuat empat ID unik
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: inspection/walkthrough
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-03 — Tie dan ring
- Requirement: REQ-F-003
- Initial condition/input: kategori sama, wait sama, pointer E
- Stimulus/timeline: Pilih fase berikut
- Expected behavior: E terpilih; jika wait N lebih lama, N menang tie kategori
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: analysis: reference function
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-04 — Grant dibekukan
- Requirement: REQ-F-004
- Initial condition/input: N LOW diberi green10 pada t=1
- Stimulus/timeline: Sampel N menjadi HIGH pada t=2
- Expected behavior: Green N tetap berakhir t=11; kategori baru hanya memengaruhi grant berikutnya
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: walkthrough
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-05 — Wait timer
- Requirement: REQ-F-005
- Initial condition/input: N green t=1..11, timer green selesai t=11
- Stimulus/timeline: Evaluasi wait pada t=15
- Expected behavior: wait N=4 s; saat green nilainya nol; fault/mode tidak meresetnya
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: walkthrough
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-06 — Cadence
- Requirement: REQ-P-001
- Initial condition/input: sumber hitungan nominal dengan timestamp 0,1,2
- Stimulus/timeline: Kirim satu frame lengkap tiap tick
- Expected behavior: adapter memiliki frame baru pada cadence1; observasi snapshot bukan arus
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: walkthrough
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-07 — Boundary
- Requirement: REQ-P-002
- Initial condition/input: green N t=1..11, yellow11..14, allred14..15
- Stimulus/timeline: Sampel masuk t=5 dan t=14
- Expected behavior: Tidak ada grant baru sebelum t=15; semua boundary integer
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: walkthrough
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-08 — Batas green
- Requirement: REQ-P-003, REQ-P-004
- Initial condition/input: semua kategori dan Fallback
- Stimulus/timeline: Amati durasi grant
- Expected behavior: grant dalam [10,30]; Fallback10; SafetyHold adalah pengecualian minimum yang dinyatakan
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: analysis/inspection
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-09 — Bound dua round
- Requirement: REQ-P-005
- Initial condition/input: semua 24 permutasi round r dan r+1; setiap green30, clearance4
- Stimulus/timeline: Enumerasi 576 pasangan urutan
- Expected behavior: maks service wait208 s, tidak melebihi210; startup terburuk103
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: analysis: exhaustive permutations
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-10 — Conflicting green
- Requirement: REQ-S-001
- Initial condition/input: empat state Green(i), empat Yellow(i), Startup/Clearance/Hold
- Stimulus/timeline: Enumerasi mapping output state
- Expected behavior: tidak pernah >1 green; state merah memiliki0 green; yellow tidak membawa green lain
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: analysis: output-state enumeration
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-11 — Clearance
- Requirement: REQ-S-002, REQ-S-003
- Initial condition/input: N mengakhiri green pada11
- Stimulus/timeline: Jalankan timer transisi
- Expected behavior: yellow11..14, allred14..15, berikut green paling cepat15; startup allred0..1
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: walkthrough
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-12 — Command unsafe
- Requirement: REQ-S-004
- Initial condition/input: masih Green(N) atau domain command rusak
- Stimulus/timeline: Minta grant S atau greenSeconds=31
- Expected behavior: SignalController menolak, semuaRed SafetyHold hingga restart; tidak mengklaim min-green/wait bound saat hold
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: inspection/walkthrough
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-13 — Deadline precedence
- Requirement: REQ-S-005, REQ-S-006
- Initial condition/input: eligible N,S; N HIGH wait0, S LOW wait200; t_now=200, lastEnd S=0
- Stimulus/timeline: Proyeksikan N30+clearance4 sebelum S
- Expected behavior: nominal membuat S mulai234>210; EDF memilih S lebih dulu. Jika deadline sudah terlewat untuk semua urutan, SafetyHold
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: analysis/walkthrough
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-14 — Domain input
- Requirement: REQ-I-001
- Initial condition/input: frame dengan empat ID unik dan timestamp sesuai clock
- Stimulus/timeline: Uji count bool/negatif/NaN, ID duplikat, waktu future/mundur
- Expected behavior: semua invalid ditolak; count integer valid termasuk0 diterima
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: analysis: reference predicate subset
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-15 — Interface output
- Requirement: REQ-I-002
- Initial condition/input: LampVector berisi N/S/E/W
- Stimulus/timeline: Telusuri C06 dan approach property lights[k]
- Expected behavior: empat logical lights mengambil entry masing-masing, tidak ada port/type yatim
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: inspection
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-16 — Stale/fault
- Requirement: REQ-R-001
- Initial condition/input: observedAt=10 pada cache; frame awal missing atau valid=false
- Stimulus/timeline: Validasi pada now13 dan now14
- Expected behavior: umur3 masih fresh; umur4 stale dan fault latch; missing cache startup memakaiFallback
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: analysis: reference predicate + walkthrough
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-17 — Fault saat green
- Requirement: REQ-R-002
- Initial condition/input: N green1..31, dataFault di5
- Stimulus/timeline: Tunggu grant selesai
- Expected behavior: N tetap berakhir31, yellow31..34, allred34..35; grant berikut Fallback10 pada35
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: walkthrough
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-18 — Fallback ring
- Requirement: REQ-R-003
- Initial condition/input: fault aktif, eligible S/E/W, pointer S
- Stimulus/timeline: Jalankan tiga grant
- Expected behavior: S,E,W masing-masing10 plusclearance4; N tidak diulang sampai round baru
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: walkthrough
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-19 — Recovery streak
- Requirement: REQ-R-004
- Initial condition/input: Fallback, framebaik baru pada t=10,11,12 lalu invalid di13
- Stimulus/timeline: Lanjutkan tiga framebaru baik14,15,16
- Expected behavior: streak reset13; siap pulih16; Normal hanya round baru; retransmisi timestamp sama tidak menaikkan streak
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: walkthrough
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-20 — Scope
- Requirement: REQ-D-001
- Initial condition/input: seluruh view model
- Stimulus/timeline: Cari komponen/aktor/fitur di luar scope
- Expected behavior: tidak ada fase belok/pedestrian/emergency/CNN/dashboard; sensor hanya adapter count
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: inspection
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.

## VER-21 — Semantik SysML
- Requirement: REQ-D-002
- Initial condition/input: matrix, dictionary, source diagrams
- Stimulus/timeline: Periksa arah relasi, BDD type/IBD part dan endpoint flow
- Expected behavior: tidak ada requirement penting tanpa model/verifikasi; perbedaan renderer diungkapkan
- Pass/fail criterion: seluruh expected behavior terpenuhi dengan batas/satuan yang dinyatakan; jika tidak, failed.
- Method: inspection
- Status: not-run pada definisi; status pelaksanaan terbaru hanya pada verification-results.md.
- Evidence: source/trace pada requirement; receipt pelaksanaan tersedia bila sudah dijalankan.
