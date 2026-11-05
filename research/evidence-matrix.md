# Evidence matrix

Sumber: TRF1 = `references/jurnal-traffic-1.pdf` (mondal2022); TRF2 = `references/jurnal-traffic-2.pdf` (mathiane2023); MBSE = `references/jurnal-mbse.pdf` (campo2023); LEC1/LEC2 = dua catatan kuliah di `lecture/`. Identitas lengkap dan batas verifikasi ada di `source-verification.md`. Used for pada entri merekam rationale penggunaan; adopsi requirement terkini tercantum lengkap pada model/traceability/traceability-matrix.md. Entri hasil/keterbatasan literatur dapat dipakai dalam diskusi tanpa dijadikan requirement fiktif. Confidence menilai kecocokan klaim terhadap konteks yang dibaca, bukan jaminan benar di dunia nyata.

## EVID-TRF-001
- Source: TRF1, Mondal & Rehena (2022), DOI 10.1007/s42979-022-01316-5.
- Page/Section: PDF 3–5, The Proposed System / Working Principle, persamaan (1)–(8).
- Claim: pemilihan fase memakai vehicle density dan waiting time; green time dialokasikan berdasarkan density.
- Exact context: prioritas merupakan fungsi gabungan kedua variabel, bukan lexicographic tie-break. Alokasi green pada persamaan (8) bersifat proporsional terhadap total hitungan.
- Used for: rationale input, penentuan prioritas dan durasi adaptif; bukan sumber aturan tie-break baseline.
- Confidence: high, rumus dan narasi eksplisit.
- Notes: sumber simulasi; tidak menjamin maximum waiting time proyek.

## EVID-TRF-002
- Source: TRF1, mondal2022.
- Page/Section: PDF 3, Components of the System; PDF 4, uraian 4-phase.
- Claim: arsitektur memisahkan sensor, RSU, processing unit, dan traffic light controller; skema empat fase memberi satu lane hijau dan tiga lainnya merah.
- Exact context: sumber juga membahas dua fase serta gerakan belok. Sistem proyek boleh memakai batas yang lebih sempit sebagai keputusan desain.
- Used for: rationale pemisahan tanggung jawab komponen dan skenario fase aman.
- Confidence: high, uraian komponen dan fase langsung.
- Notes: RSU/jenis sensor tidak otomatis menjadi teknologi wajib proyek.

## EVID-TRF-003
- Source: TRF1, mondal2022.
- Page/Section: PDF 5–6, persamaan (11), Algorithm 1 baris 11, dan Table 1.
- Claim: contoh sumber memakai cycle length 120 s, total amber 10 s, dan amber per fase 2.5 s pada empat fase.
- Exact context: konfigurasi simulasi milik artikel; bukan minimum/maximum green atau nilai legal universal. Table 1 memakai VD sebagai jumlah mobil.
- Used for: inventaris parameter sumber dan definisi hitungan sebagai proksi.
- Confidence: high, angka eksplisit.
- Notes: tidak diadopsi sebagai angka baseline tanpa analisis kelayakan sendiri.

## EVID-TRF-004
- Source: TRF1, mondal2022.
- Page/Section: PDF 6, Algorithm 1 baris 6; uraian contoh Table 1 pada halaman yang sama.
- Claim: pseudocode menyebut ascending order, sedangkan contoh memilih lane 2 dengan prioritas terbesar 0.50.
- Exact context: perbedaan terlihat pula pada render visual PDF 6; bukan sekadar kesalahan ekstraksi teks.
- Used for: disposition konflik sumber; pembenaran agar algoritme tidak disalin mentah.
- Confidence: high untuk adanya perbedaan, bukan untuk menebak niat penulis.
- Notes: jangan menyatakan sudah mendapatkan klarifikasi dari penulis.

## EVID-TRF-005
- Source: TRF1, mondal2022.
- Page/Section: PDF 8–9, Performance Analysis; Tables 2–7.
- Claim: evaluasi membandingkan adaptive dan fixed-time pada skenario balanced/unbalanced; penulis melaporkan peningkatan average percentage traffic flow 31.05%.
- Exact context: hasil simulasi artikel; fixed-time memakai green 27.5 s pada konfigurasi yang dijelaskan.
- Used for: rationale dua skenario verifikasi konseptual; ringkasan hasil studi terkait.
- Confidence: high untuk klaim yang dilaporkan, tidak untuk generalisasi atau replikasi.
- Notes: angka tidak menjadi target atau hasil proyek ini.

## EVID-TRF-006
- Source: TRF2, Mathiane et al. (2023), DOI 10.3390/vehicles5040099.
- Page/Section: §3.1, persamaan (1), narasi di sekitar Figure 3; PDF 7/cetak 1850.
- Claim: traffic density diturunkan dari jumlah kendaraan per kelompok dan jumlah lajur; hasil dipakai mengatur timer sinyal berikutnya.
- Exact context: rumus membagi jumlah kendaraan dengan NoOfTrafficLanes + 1. Ini bukan normalisasi kapasitas pendekat proyek dan bukan satuan kendaraan/km.
- Used for: rationale vehicleCount sebagai input; pemisahan analisis input dan pengaturan timer.
- Confidence: medium, lapisan teks PDF ganda menuntut kehati-hatian pada formula.
- Notes: tidak mengadopsi formula secara numerik; desain kategori/kapasitas dicatat sebagai asumsi.

## EVID-TRF-007
- Source: TRF2, mathiane2023.
- Page/Section: abstrak PDF 1; §3.2; §5 Conclusions PDF 17–18/cetak 1860–1861.
- Claim: sumber menggabungkan simulasi Pygame, klasifikasi 2D-CNN dan prioritas emergency; hardware dan deteksi malfunction masih dibahas sebagai pengembangan berikutnya.
- Exact context: klasifikasi kendaraan dan pengendalian sinyal merupakan fungsi yang berbeda; hasil studi bukan deployment persimpangan proyek.
- Used for: batas relevansi literatur dan rationale tidak mewajibkan ML/emergency pada baseline.
- Confidence: high untuk lingkup metode dan pernyataan future work.
- Notes: fail-safe proyek tetap keputusan/desain wajib pengguna, bukan kemampuan yang sudah terbukti dalam studi.

## EVID-TRF-008
- Source: TRF2, mathiane2023.
- Page/Section: abstrak PDF 1; §5 Conclusions PDF 17/cetak 1860; Tables 5–6 dan Figure 13.
- Claim: abstrak memakai istilah 90% throughput, kesimpulan memakai 90% faster; interpretasi kuantitatif tidak diharmonisasi pada kajian ini.
- Exact context: render PDF 17 memperlihatkan ungkapan kesimpulan tersebut. Angka klasifikasi 96% merujuk tugas klasifikasi, bukan keselamatan atau efektivitas controller.
- Used for: keterbatasan interpretasi hasil; mencegah klaim peningkatan proyek yang tidak didukung.
- Confidence: high untuk adanya beda ungkapan; low untuk arti efek komparatif 90% yang belum direkonstruksi.
- Notes: tidak memakai kedua angka sebagai requirement acceptance.

## EVID-MBSE-001
- Source: MBSE, Campo et al. (2023), DOI 10.1002/sys.21644.
- Page/Section: §2.1 Source identification; §2.2 Coding and analysis. Locator bagian dipakai karena preflight UNAVAILABLE (peringatan xref); nomor halaman PDF belum terverifikasi penuh.
- Claim: studi mengodekan 2914 klaim dari 60 sumber; pemilihan sumber tidak exhaustif dan penilaian mutu metodologi tiap sumber tidak dilakukan.
- Exact context: data adalah klaim/persepsi dalam literatur, bukan pengukuran efek MBSE pada satu persimpangan.
- Used for: batas kajian MBSE dan alasan menelusuri klaim ke evidence.
- Confidence: medium, teks bagian dapat dibaca tetapi integritas struktur PDF belum PASS.
- Notes: bukan dasar angka target performa lalu lintas.

## EVID-MBSE-002
- Source: MBSE, campo2023.
- Page/Section: Abstract; §3.2; §3.3.6; §4 Conclusion. Peringatan integritas PDF sama dengan EVID-MBSE-001.
- Claim: penulis melaporkan 47% klaim berdasar author opinions dan 86% tidak disubstansiasi metrik; manfaat MBSE tidak boleh disamakan dengan bukti kuantitatif otomatis.
- Exact context: persentase berlaku untuk corpus studi tersebut. Kesimpulan menyerukan pengukuran dan perbandingan lebih lanjut.
- Used for: disiplin evidence, pembatasan klaim manfaat MBSE, dan rencana QC.
- Confidence: medium, konsisten antara abstrak dan pembahasan yang terbaca; bukan verifikasi independen statistik.
- Notes: gunakan sebagai temuan literatur, bukan hasil proyek.

## EVID-LEC-001
- Source: LEC1 §9–10; LEC2 §16–19; identitas asli dosen/tanggal belum tersedia.
- Page/Section: heading bagian Markdown, tanpa nomor halaman/slide rekaan.
- Claim: requirement, behavior, structure dan verification perlu konsisten serta traceable.
- Exact context: catatan kuliah yang diperluas; contoh bukan model proyek final.
- Used for: katalog requirement, identitas elemen dan traceability matrix.
- Confidence: high untuk isi catatan; provenance ke slide asli belum diverifikasi.
- Notes: keputusan renderer berasal dari pengguna.

## EVID-LEC-002
- Source: LEC2 §5.1–5.3.
- Page/Section: Requirement Diagram; satisfy dan verify.
- Claim: requirement menghubungkan kebutuhan dengan elemen pemenuh dan verification/test case.
- Exact context: arah dan endpoint relasi tetap diperiksa saat modeling; keberadaan panah tidak membuktikan requirement lulus.
- Used for: pemetaan relasi SysML dan verification.
- Confidence: high untuk isi catatan, dengan batas provenance seperti EVID-LEC-001.
- Notes: nomor versi SysML tidak dicantumkan catatan.

## EVID-LEC-003
- Source: LEC2 §7–9.
- Page/Section: Activity, Sequence, State Machine.
- Claim: behavior dapat ditinjau sebagai aliran action/data, pertukaran message, serta state/transition.
- Exact context: tiga view terhadap model yang harus tetap konsisten; bukan tiga implementasi terpisah.
- Used for: behavioral model dan alokasi ke komponen.
- Confidence: high untuk isi catatan; batas provenance tetap berlaku.
- Notes: detail guard/timer disusun setelah requirement.

## EVID-LEC-004
- Source: LEC2 §10–13.
- Page/Section: BDD; Port; IBD; BDD vs IBD; Parts and Reference Properties.
- Claim: BDD menjelaskan definisi block, IBD pemakaian part dan hubungan internal melalui port/connector.
- Exact context: type/definition berbeda dari usage; context block harus jelas.
- Used for: structural model dan pemetaan SysML.
- Confidence: high untuk isi catatan; batas provenance tetap berlaku.
- Notes: bentuk kotak PlantUML tidak cukup tanpa semantik tersebut.

## EVID-LEC-005
- Source: LEC2 §21.
- Page/Section: Relevansi Langsung untuk Tugas Smart Traffic Light.
- Claim: tugas meminta deteksi kepadatan dan prioritas hijau lebih lama untuk ruas lebih padat, dikerjakan berkelompok dan dipresentasikan.
- Exact context: catatan yang menyatakan isi tugas; bukan rubrik/slide asli yang telah dicocokkan.
- Used for: tujuan sistem dan deliverable akademik.
- Confidence: medium untuk atribusi tugas, high untuk keberadaan kalimat pada catatan.
- Notes: safety, fairness, failure handling, baseline empat pendekat berasal pula dari instruksi pengguna.
