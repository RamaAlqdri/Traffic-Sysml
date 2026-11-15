# Narasi presentasi Smart Traffic Light

## 1. Smart Traffic Light Berbasis Kepadatan Kendaraan

Kami memodelkan pengendali lampu pada satu simpang empat. Presentasi ini menjelaskan bagaimana hitungan kendaraan menjadi keputusan fase, bagaimana sistem merespons data yang gagal, dan bagian mana yang telah diperiksa.

*Rujukan pembicara* — Laporan Traffic, Pendahuluan dan Analisis Permasalahan; SysML 2.0 (OMG, 2026).

## 2. Apa yang harus diputuskan pengendali?

Saat fase selesai, pengendali harus memilih pendekat berikutnya. Durasi hijau ditentukan dari kategori hitungan kendaraan. Sistem juga membutuhkan aturan jika data berhenti di tengah fase. Ketiga pertanyaan ini menjadi dasar pembagian kebutuhan dan verifikasi.

*Rujukan pembicara* — Materi Pemodelan MBSE dan SysML, bagian 21; report/sections/01-introduction.tex.

## 3. Batas sistem dan masukan kendaraan

Model mencakup satu simpang, empat pendekat, dan gerak lurus. Sumber data eksternal mengirim satu CountsFrame berisi hitungan tiap pendekat. Hitungan menggambarkan antrean pada akhir jendela observasi. Fase pejalan kaki, belok khusus, dan koordinasi antarsimpang berada di luar lingkup.

*Rujukan pembicara* — ASM-001/002/006; model/structure/types.sysml.

## 4. Dasar rancangan

Mondal dan Rehena mendasari penggunaan kepadatan dan waktu tunggu. Mathiane dan rekan menunjukkan penggunaan hitungan kendaraan sebagai masukan pengaturan. Materi kuliah mendasari keterlacakan model. Durasi dan tenggat dirancang sebagai asumsi yang bisa diperiksa pada baseline.

*Rujukan pembicara* — Mondal & Rehena (2022), hlm. 3–6; Mathiane dkk. (2023), bagian 3; materi kuliah MBSE bagian 9–10; ASM-002–008.

## 5. Dari hitungan kendaraan ke durasi hijau

Pengendali mengelompokkan hitungan menjadi LOW, MEDIUM, dan HIGH. Dalam mode Normal, durasi masing-masing kategori adalah sepuluh, dua puluh, dan tiga puluh detik. Contohnya, dua belas kendaraan masuk MEDIUM dan mendapat dua puluh detik jika pendekat tersebut terpilih.

*Rujukan pembicara* — ASM-003/005; REQ-F-001 dan REQ-F-004.

## 6. Cara menentukan giliran

Setiap pendekat mendapat satu giliran per putaran. Dalam contoh, Utara dan Timur sama-sama MEDIUM. Timur dipilih karena sudah menunggu lebih lama. Jika waktu tunggu juga sama, pemilihan mengikuti urutan N–S–E–W dari penunjuk giliran. Sebelum perintah diterbitkan, pengendali memeriksa kelayakan terhadap batas 210 detik. Urutan tenggat terdekat mengambil alih bila urutan nominal tidak layak.

*Rujukan pembicara* — ASM-004/005; REQ-F-002/003; REQ-S-005/006. Angka contoh ilustratif.

## 7. Aliran data dari sensor ke lampu

Lihat diagram komposisi yang ditata di Eclipse SysON. Sensor memeriksa data masuk, pengolah kepadatan mengubah hitungan menjadi kategori, lalu pengendali prioritas mengirim perintah ke pengendali fase. Pengendali fase membagikan satu vektor warna pada empat lampu. Masing-masing lampu memakai entri untuk pendekatnya.

*Rujukan pembicara* — StlStructure dan StlContext; assets/diagrams/syson-composition.svg; laporan bagian 4.6–4.7.

## 8. Peralihan fase yang aman

Setelah perintah diterima, hanya satu pendekat menyala hijau sampai durasinya habis. Lalu lampu tersebut kuning selama tiga detik. Semua lampu merah selama satu detik sebelum fase berikutnya dimulai. Perintah yang tidak sah atau jadwal yang tidak layak dapat memicu SafetyHold. Semua lampu tetap merah sampai sistem dimulai ulang.

*Rujukan pembicara* — STM-01; ASM-005/008; REQ-S-001–006.

## 9. Saat data terlambat atau berhenti

Adapter memeriksa cache setiap detik. Data yang tidak valid, tidak lengkap, atau lebih tua dari tiga detik mengaktifkan dataFault. Gangguan data tidak memotong hijau yang sedang berjalan. Setelah kuning dan semua merah selesai, Fallback memberi hijau sepuluh detik sesuai urutan giliran. Kembali ke Normal memerlukan tiga frame lengkap dan valid yang baru pada detik berbeda serta awal putaran berikutnya.

*Rujukan pembicara* — ASM-006/007; REQ-R-001–004; model/behavior/sequence.sysml.

## 10. Dari kebutuhan ke verifikasi

Tenggat 210 detik tercatat pada REQ-P-005. ACT-03 mewakili keputusan prioritas dan tenggat, yang dijalankan oleh TrafficController. VER-09 memeriksa batas waktu tunggu pada kondisi yang dinyatakan. Hubungan ini membantu kita menemukan bagian model dan metode pemeriksaan yang relevan.

*Rujukan pembicara* — ASM-004/005/008; model/traceability/traceability-matrix.md; VER-09.

## 11. Mengapa batas waktu tunggunya 208 s?

Kasus paling panjang terjadi ketika sebuah pendekat mendapat giliran pertama pada satu putaran dan terakhir pada putaran berikutnya. Di antaranya ada enam hijau pendekat lain dan tujuh jeda. Dengan hijau maksimum tiga puluh detik serta jeda empat detik, hasilnya 208 detik, dua detik di bawah batas desain. Analisis ini berlaku ketika setiap pendekat mendapat satu giliran tiap putaran dengan jam ideal dan tanpa SafetyHold atau penyalaan ulang.

*Rujukan pembicara* — REQ-P-005; VER-09; report/sections/03-problem.tex, persamaan batas waktu tunggu.

## 12. Apa yang sudah diperiksa?

Pemeriksa referensi menghitung 576 pasangan urutan yang mencakup 2.304 waktu tunggu. Pemeriksaan lain mencakup batas kategori, data kedaluwarsa dan sembilan kombinasi keluaran lampu. Transisi dinamis dari gangguan hingga pemulihan belum dijalankan sebagai uji lengkap. Tidak ada pengukuran kinerja perangkat atau arus kendaraan.

*Rujukan pembicara* — model/verification/verification-results.md; model/verification/verification-scenarios.md.

## 13. Hasil verifikasi dan pengujian lanjutan

Desain memiliki 24 kebutuhan dan 21 skenario dengan jejak ke model. Langkah berikutnya adalah menjalankan penjadwal dan pengendali fase untuk memeriksa urutan kejadian, terutama saat data berhenti dan pulih. Pengujian perangkat dan pengukuran arus memerlukan kondisi uji yang sesuai.

*Rujukan pembicara* — report/sections/06-trace-verification.tex dan report/sections/07-discussion.tex.

## 14. Kebutuhan sistem dalam SysML

Diagram ini menampilkan empat kebutuhan inti. Seluruh 24 kebutuhan tercatat dalam katalog model.

*Rujukan pembicara* — Lampiran untuk diskusi; assets/diagrams/requirements.pdf.

## 15. Kasus penggunaan sistem

Aktor eksternal adalah penyedia data dan pengguna jalan. Kebutuhan pengendalian, keselamatan, dan kegagalan ditelusuri melalui berkas use case.

*Rujukan pembicara* — Lampiran untuk diskusi; assets/diagrams/use-case.pdf.

## 16. Alur aktivitas kendali

Telusuri pemisahan antara kejadian sampel atau observasi dan kejadian pewaktu fase.

*Rujukan pembicara* — Lampiran untuk diskusi; assets/diagrams/activity.pdf.

## 17. Urutan interaksi komponen

Diagram mengikuti urutan pesan pada layanan normal, gangguan, dan pemulihan.

*Rujukan pembicara* — Lampiran untuk diskusi; assets/diagrams/sequence.pdf.

## 18. Transisi fase lengkap

Detail syarat transisi dan durasi dikunci berada dalam definisi STM-01.

*Rujukan pembicara* — Lampiran untuk diskusi; assets/diagrams/state-machine.pdf.

## 19. Port dan koneksi internal

C00 membawa hitungan dari luar sistem. C01 sampai C05 menghubungkan komponen dan C06 menyalurkan warna ke empat lampu.

*Rujukan pembicara* — Lampiran untuk diskusi; assets/diagrams/ibd.pdf.

## 20. Matriks keterlacakan 24 kebutuhan

Gunakan matriks ini untuk mencari aksi, komponen, dan skenario verifikasi dari ID kebutuhan tertentu.

*Rujukan pembicara* — report/sections/06-trace-verification.tex; model/traceability/traceability-matrix.md.

## Tanya jawab

**Apakah angka 208 s berlaku di persimpangan nyata?**  
Angka itu adalah batas menunggu giliran pendekat pada model nominal. Perhitungannya mengasumsikan jam ideal, satu giliran per putaran, hijau maksimum 30 s, serta jeda 4 s. Delay tiap kendaraan memerlukan data antrean dan pengujian terpisah.

**Apa bedanya Fallback dan SafetyHold?**  
Fallback melayani pendekat secara bergiliran dengan hijau 10 s ketika data tidak dapat diandalkan. SafetyHold mempertahankan semua lampu merah sampai sistem dimulai ulang ketika perintah tidak sah atau jadwal tidak layak.

**Apakah semua skenario sudah lulus?**  
Pemeriksaan statis dan analisis fungsi referensi sudah menghasilkan bukti untuk beberapa skenario. Uji dinamis lengkap, termasuk transisi gangguan dan pemulihan, masih perlu dilakukan.

**Apa yang dikerjakan di Eclipse SysON?**  
SysON dipakai untuk menata dan mengekspor diagram komposisi internal. Berkas SysML v2 di repositori menyimpan detail model, termasuk referensi syarat transisi dan aksi grant yang belum terurai saat impor ke SysON.
