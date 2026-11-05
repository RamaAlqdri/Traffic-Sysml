# Formulasi masalah dan kontrak operasi baseline

## Dasar masalah

Tujuan tugas adalah memperoleh kondisi kendaraan dan memberi durasi hijau lebih lama pada ruas yang lebih padat (EVID-LEC-005). Literatur mendukung pemisahan input kendaraan, prioritas fase dan pengaturan waktu hijau (EVID-TRF-001/002/006); literatur tidak menetapkan semua angka baseline di bawah. Penelusuran klaim/halaman terdapat pada evidence-matrix.md. Seluruh angka dan aturan penjadwalan di dokumen ini adalah asumsi desain konseptual ASM-001–010 yang dirinci pada design-assumptions.md, bukan hasil penelitian baru atau parameter pemasangan jalan.

## Rumusan masalah dan tujuan

Bagaimana merepresentasikan sistem Smart Traffic Light dalam subset SysML 1.6 yang dapat menerima jumlah kendaraan tiap pendekat, memberi pelayanan adaptif, menjaga eksklusivitas sinyal dan batas tunggu, serta menangani data gagal dengan perilaku yang dapat diperiksa? Tujuan model: hubungan evidence/asumsi → requirement → behavior → structure → verification dapat ditelusuri dan konsisten. Tidak ada target peningkatan throughput atau klaim deployment.

## Scope dan boundary

Satu simpang dengan pendekat North (N), South (S), East (E), West (W); hanya gerak lurus. Jumlah lajur fisik tidak ditetapkan. Meskipun beberapa gerak lurus mungkin kompatibel secara geometris, baseline secara konservatif melarang green bersamaan pada semua pasangan pendekat berbeda. Tidak ada fase belok, pedestrian, emergency, dashboard, pembelajaran mesin, koordinasi antarsimpang, atau estimasi performa lalu lintas.

System of Interest memiliki VehicleDetection (adapter input hitungan), DensityAnalysis, TrafficController, SignalController dan TrafficLights. TrafficDataSource di luar boundary menyediakan hasil penghitungan; tidak ada klaim sensor fisik atau klasifikasi kamera telah dibuat. RoadUsers menerima indikasi lampu. Sensor/komunikasi bisa diganti di implementasi berikutnya selama kontrak input dipenuhi. Kegagalan yang dimodelkan: data sensor/adapter, bukan lampu rusak, driver output stuck, listrik padam atau kerusakan clock. Jaminan output logis mengasumsikan actuator/clock ideal.

| Stakeholder/actor | Kebutuhan/relasi |
|---|---|
| RoadUsers | menerima sinyal tanpa green berkonflik; mendapat pelayanan terikat waktu pada asumsi nominal |
| TrafficDataSource | mengirim empat Sample yang memenuhi kontrak |
| Otoritas/pengelola lalu lintas | memahami batas desain; bukan aktor dashboard pada baseline |
| Kelompok/dosen | meninjau semantik SysML, evidence, traceability dan skenario |

## Input dan waktu

Satu CountsFrame berisi empat record {approach, vehicleCount, observedAt, valid}; approach unik N/S/E/W, vehicleCount bilangan bulat 0..2147483647 (bool bukan integer input), observedAt pada clock monotonic bersama, valid boolean. vehicleCount adalah snapshot jumlah kendaraan dalam area antrean pendekat yang sama, diperkirakan pada akhir jendela observasi 1 s, bukan jumlah kendaraan lewat per detik. Luas/panjang area fisik belum dikalibrasi dan di luar model lokasi ini.

Input nominal diperbarui tiap 1 s. Adapter juga mengevaluasi cache pada tick observasi 1 s saat sumber tidak mengirim frame. Pada tick yang sama, update sampel dan pemeriksaan cache mendahului keputusan boundary; streak hanya bertambah sekali per tick dengan observedAt baru untuk semua pendekat. Timestamp harus tidak mundur per pendekat, tidak di masa depan, dan umur sampel harus ≤3 s pada saat validasi. Penilaian nominal memakai frame valid lengkap terbaru; event sampel hilang masih boleh memakai cache yang fresh. Frame dengan tipe/ID/timestamp salah, valid=false, atau cache tidak lengkap/stale memicu dataFault. Startup tanpa data valid juga memakai fallback. Jangan menghitung boolean/NaN sebagai vehicleCount atau mengisi count rusak dengan nol.

Kapasitas pendekat tidak disediakan. Kategori: LOW untuk 0..5, MEDIUM untuk 6..15, HIGH untuk ≥16 kendaraan. Kategori adalah proksi yang didefinisikan proyek, bukan kelas fisik universal. Green: LOW=10 s, MEDIUM=20 s, HIGH=30 s, sehingga minimumGreen=10 s dan maximumGreen=30 s. Dua hitungan dalam kategori sama boleh memperoleh durasi sama; tuntutan hijau lebih lama dimaknai untuk kategori lebih tinggi.

## Scheduler dan fairness

Satu round memuat empat pelayanan, masing-masing pendekat tepat sekali; pendekat count=0 tetap dilayani. eligible adalah pendekat yang belum dilayani di round berjalan. Pada akhir all-red sebelum green berikutnya, keputusan dievaluasi pada tick 1 s (decisionUpdateInterval=1 s) menggunakan frame terbaru; semua durasi adalah kelipatan tick sehingga tidak ada pembulatan tambahan. Tidak ada keputusan pergantian fase saat green aktif. Satu green yang sudah diberikan tidak diperpanjang/dipersingkat oleh sampel berikutnya.

Urutan nominal di antara eligible: kategori tertinggi, lalu waktu tunggu terlama, lalu round-robin deterministik dengan ring N→S→E→W. Pointer awal N, maju ke penerus pendekat yang baru diberi green. Waktu tunggu adalah waktu sejak green terakhir berakhir, bernilai nol selama green, dan diinisialisasi nol saat startup. Ini waktu menunggu pelayanan pendekat, bukan delay individual kendaraan atau jaminan antrean habis.

Setiap rencana sisa round diperiksa terhadap deadline `lastGreenEnd + 210 s`; untuk pendekat yang belum pernah green gunakan deadline `startup + 210 s`. Jika urutan nominal memproyeksikan deadline terlewat, gunakan urutan earliest-deadline-first bagi eligible, tie memakai ring. Jika tetap tidak layak, laporkan constraintFault dan tahan all-red (mode SafetyHold); jangan mengeksekusi rencana yang diklaim aman. Pemeriksaan worst-case memakai sisa green sampai 30 s dan clearance 4 s tiap layanan. Pada kondisi baseline nominal, bound di bawah menjamin guard ini tidak perlu mengalahkan density, tetapi guard menyatakan precedence fairness bila keadaan tidak konsisten.

Batas tunggu nominal: sebuah pendekat dapat dilayani pertama pada round r dan terakhir pada r+1. Di antaranya paling banyak enam green pendekat lain dan tujuh clearance, sehingga W≤6×30+7×(3+1)=208 s. Pilih maximumWaitingTime=210 s untuk memberi margin 2 s terhadap bound diskrit model; margin bukan kompensasi latensi hardware. Startup: all-red 1 s, lalu pendekat terakhir mulai paling lambat 1+3×34=103 s. Setiap perubahan jumlah fase, green maksimum atau clearance memerlukan perhitungan ulang.

## Sinyal dan failure handling

Sebelum green pertama, semua merah selama 1 s. Setelah green selesai: yellow pada pendekat aktif 3 s (lainnya merah), lalu semua merah 1 s, baru green berikutnya. Konflik matriks konservatif:

| green aktif vs yang diminta | N | S | E | W |
|---|---|---|---|---|
| N | fase yang sama | conflict | conflict | conflict |
| S | conflict | fase yang sama | conflict | conflict |
| E | conflict | conflict | fase yang sama | conflict |
| W | conflict | conflict | conflict | fase yang sama |

DataFault dilatch saat dideteksi, tetapi tidak memotong green aktif. Setelah green terjadwal berakhir, jalankan yellow/all-red yang sama; pada batas aman berikutnya gunakan mode Fallback. Fallback melayani semua eligible sekali per round dalam urutan ring, green tetap 10 s. Round tidak direset oleh perubahan mode. Pemulihan memerlukan tiga frame lengkap fresh/valid dengan observedAt baru untuk semua pendekat berturut-turut pada tick berbeda; satu frame invalid memutus streak. VehicleDetection menghapus latch dataFault setelah streak tiga frame baik terpenuhi; mode Fallback tetap dilatch TrafficController sampai awal round berikutnya. Fault baru segera melatch ulang dan mereset streak. Kembali Normal hanya pada awal round berikutnya setelah streak terpenuhi dan dataFault sudah clear. Timer tunggu tidak direset oleh fault/pemulihan. Tidak ada jaminan antrean terlayani habis, khususnya saat data/arus bermasalah.

SignalController hanya menerima command {approach, greenSeconds, mode} dalam domain yang sah serta sesuai batas pergantian. Command invalid/permintaan green yang melompati clearance ditolak dan membawa output logis semua merah ke SafetyHold. Restart eksplisit memulai ulang startup all-red; tidak ada transisi otomatis langsung ke green dari SafetyHold. Minimum green nominal dapat dikesampingkan untuk SafetyHold; bound tunggu tidak berlaku saat SafetyHold/restart. Sensor fault saja tidak boleh memicu SafetyHold atau memotong minimum green.

## Operational scenarios

1. Semua kategori sama: longest-wait mengikat urutan; tie total dipecah ring, setiap pendekat sekali per round.
2. N HIGH dan lainnya LOW: N didahulukan jika eligible dan mendapat 30 s, lainnya 10 s; N tidak boleh mengulang dalam round yang sama.
3. Frame berubah saat green: cache diperbarui, grant aktif tetap, keputusan fase berikutnya memakai frame terbaru pada boundary.
4. Sampel stale: latch fault, selesaikan grant/clearance, masuk Fallback; tiga frame baik tidak mengubah green aktif dan pemulihan menunggu round baru.
5. Command meminta dua green/melompati clearance: SignalController menolak dan menahan all-red; pemeriksaan ini adalah perilaku model, bukan bukti actuator nyata bebas kegagalan.

## Kriteria keberhasilan model

Requirement atomic memiliki source, rationale dan verification. Tujuh view konsisten, block/type berbeda dari part/usage dan relasi satisfy/verify berarah jelas. Skenario expected behavior dibedakan dari analisis yang benar-benar dijalankan. Gate modeling dan build tidak boleh dianggap hasil eksperimen traffic. Nilai di atas dapat dipakai untuk pemeriksaan model konseptual saja.
