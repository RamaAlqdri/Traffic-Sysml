# Design Decision Log

> Append-only.

Template:

```md
## ADR-XXX — <Decision title>

- Date:
- Status: proposed | accepted | superseded
- Context:
- Options:
  1.
  2.
- Chosen:
- Rationale:
- Consequences:
- Evidence:
```

## ADR-001 — Baseline, evidence, dan verification contract

- Date: 2026-11-02 10:33:24 WIB
- Status: accepted
- Context: pengguna meminta revisi panduan sebelum modeling untuk menghilangkan keputusan desain yang ambigu.
- Options:
  1. Mempertahankan baseline dan requirement yang longgar.
  2. Menetapkan baseline bersyarat dengan evidence/asumsi dan verification contract.
- Chosen: opsi 2, sesuai instruksi pengguna.
- Rationale: simpang empat lengan, input vehicleCount/kategori, tie-break, min/max green, maximum waiting time, interval keputusan, serta failure handling perlu konsisten lintas artefak.
- Consequences: tidak menetapkan angka waktu; nilai wajib didukung evidence relevan atau ASM-* dengan rationale. Kebutuhan memenuhi batas tunggu mendahului kepadatan pada batas fase aman; kelayakan batas harus dianalisis. Safety/failure interlock tidak ditunda oleh interval keputusan normal.
- Evidence: instruksi pengguna dalam chat; ini kontrak baseline proyek, bukan temuan tiga jurnal. Trace wajib EVID-*/ASM-* → REQ-* → behavior → structure → VER-*.

## ADR-002 — Gate kuliah, milestone, dan satu entry point build

- Date: 2026-11-02 10:33:24 WIB
- Status: accepted
- Context: pencatatan kegagalan build sebelumnya dapat dianggap memenuhi syarat selesai; materi kuliah awalnya belum ditemukan.
- Options:
  1. Menerima source dan limitation log sebagai selesai.
  2. Memisahkan kelengkapan source, keberhasilan build, dan QC release; mewajibkan materi kuliah sebelum modeling.
- Chosen: opsi 2; milestone source-complete → build-verified → release-complete. build-unverified merupakan penanda, bukan milestone sukses.
- Rationale: sesuai perincian terakhir pengguna; hanya release-complete berarti proyek selesai.
- Consequences: Makefile menyediakan make build, pemeriksaan prasyarat, render Mermaid PDF dan PlantUML SVG/PDF, kompilasi pdfLaTeX melalui latexmk, serta append log. Backend bibliography dipilih/catat sebelum penulisan. Toolchain belum dikunci lintas mesin; satu command tidak membuktikan PDF identik.
- Evidence: instruksi pengguna; dokumentasi CLI resmi Mermaid dan PlantUML ditinjau untuk opsi build. Catatan Markdown di lecture/ muncul saat audit; diterima sebagai kandidat materi yang disediakan di workspace, tanpa mengklaim telah dibandingkan dengan slide aslinya. Makefile mendeteksi materi alternatif, tidak membuat placeholder PDF.

## ADR-003 — SysML sebagai dasar semantik model

- Date: 2026-11-02 10:37:31 WIB
- Status: accepted
- Context: pengguna menegaskan model wajib mengikuti SysML; Mermaid dan PlantUML hanya textual rendering tools.
- Options:
  1. Mengikuti sintaks renderer tanpa pemeriksaan semantik terpisah.
  2. Menetapkan model SysML yang konsisten dan pemetaan eksplisit ke kedua renderer.
- Chosen: opsi 2, sesuai instruksi pengguna.
- Rationale: makna elemen/relasi tidak boleh bergantung pada kemampuan atau sintaks renderer.
- Consequences: versi/subset SysML harus ditentukan berdasarkan kuliah sebelum modeling; ID elemen lintas-view konsisten; BDD type dan IBD part dibedakan; jenis/arah/endpoint relasi diperiksa. Bagian Pemetaan SysML ditambahkan ke spesifikasi traceability-matrix.md yang sudah direncanakan. Keterbatasan notasi perlu anotasi dan dokumentasi, bukan pelemahan semantik. Rendering sukses tidak menggantikan QC SysML; release-complete mensyaratkan QC ini.
- Evidence: instruksi eksplisit pengguna di chat; belum merupakan klaim bahwa model sudah dibuat atau diverifikasi.

## ADR-004 — Corpus tetap dan penerimaan catatan kuliah

- Date: 2026-11-02 11:53:46 WIB
- Status: accepted
- Context: pengguna menginstruksikan memulai proyek setelah kontrak SysML diperjelas. Dua materi kuliah Markdown sudah disediakan di workspace.
- Options: menunggu format PDF tertentu; atau menggunakan catatan yang tersedia dengan batas atribusi eksplisit.
- Chosen: gunakan kedua catatan sebagai materi yang disediakan pengguna; tidak mengklaim telah dibandingkan dengan slide asli. Tinjauan tersedia di research/lecture-review.md.
- Rationale: sumber berbentuk Markdown diperbolehkan panduan; isinya relevan untuk requirement/behavior/structure/verification. Bagian perluasan dan keputusan tool tidak dipromosikan menjadi fakta dari slide asli.
- Consequences: gate ketersediaan/relevansi kuliah terpenuhi; ISSUE-001 ditutup dengan keterbatasan provenance tersisa. Gunakan locator heading Markdown. Usulkan SysML 1.6 sebagai pilihan proyek ASM-010, karena catatan menyebut keluarga view terkait tetapi tidak menyebut nomor versi; rujukan OMG diperiksa. Belum ada klaim kepatuhan model formal.
- Evidence: lecture/01-pengantar-mbse.md; lecture/02-pemodelan-mbse-sysml.md; EVID-LEC-001–005; https://www.omg.org/spec/SysML/1.6.

## ADR-005 — Disposition keterbatasan sumber dan parameter

- Date: 2026-11-02 11:53:46 WIB
- Status: accepted
- Context: literature review menemukan perbedaan urutan prioritas pada TRF1 dan istilah hasil 90% pada TRF2; PDF MBSE memiliki peringatan xref.
- Options: menyalin semua algoritme/angka; atau memakai evidence terbatas dengan asumsi eksplisit.
- Chosen: opsi kedua. Pertahankan ketiga jurnal; gunakan artikel untuk rationale, bukan sebagai implementasi yang disalin atau hasil eksperimen proyek.
- Rationale: baseline pengguna berbeda dari formula prioritas gabungan/TRF1 dan klasifikasi CNN/TRF2; angka cycle/amber artikel tidak menetapkan min/max green, batas tunggu atau interval observasi proyek.
- Consequences: nilai parameter belum dipilih pada tahap riset; pending ASM-002–008 harus ditutup pada requirements. Klaim kuantitatif literatur tidak menjadi target atau measured result proyek. PDF MBSE memakai locator bagian dengan warning integritas, bukan page-anchor yang diklaim lulus.
- Evidence: EVID-TRF-003/004/008; EVID-MBSE-001/002; research/source-verification.md; sidecar preflight.

## ADR-006 — Kontrak baseline numerik dan bound pelayanan

- Date: 2026-11-03 09:50:01 WIB
- Status: accepted
- Context: Tahap1 meninggalkan parameter proyek pending; pengguna menginstruksikan melanjutkan.
- Options: mengambil angka artikel di luar konteks; atau menetapkan parameter konseptual berlabel asumsi dan memeriksa konsistensinya.
- Chosen: opsi kedua; ASM-001–010 diresolusikan pada problem-formulation.md dan design-assumptions.md.
- Rationale: satu green dan satu layanan per pendekat per round membatasi monopolization; kategori memberi green10/20/30, yellow3/all-red1 memberi bound208s. MaximumWaitingTime210s mempunyai margin model2s, bukan margin hardware.
- Consequences: 24 requirements atomic; count/clock/stale/recovery didefinisikan, fallback tidak mereset round/timer. Interlock command memakai SafetyHold dengan pengecualian terhadap jaminan nominal. Semua nilai merupakan keputusan desain, bukan temuan jurnal.
- Evidence: EVID-TRF-001/002/006 sebagai rationale terbatas, instruksi baseline pengguna dan analisis VER-09; sources tidak menetapkan parameter lokasi proyek.

## ADR-007 — Dokumen LaTeX/Beamer dan rilis artefak

- Date: 2026-11-03 09:50:01 WIB
- Status: accepted
- Context: model dan traceability sudah tersedia; pengguna meminta output laporan/presentasi LaTeX.
- Options: mengganti format tujuan skill default; atau mempertahankan format eksplisit pengguna.
- Chosen: laporan modular pdfLaTeX, Beamer14slide, bibliography bersama melalui BibTeX/natbib/plainnat. Tidak membuat Spaces/PPTX karena pengguna menetapkan format LaTeX.
- Rationale: satu sumber model dan satu bibliography, build lokal dapat diaudit. Diagram menampilkan partial view bila dinyatakan; seluruh requirement tetap pada katalog/matrix.
- Consequences: make build menjalankan checker, render dan kedua kompilasi; output21halaman/14slide, source dan metadata sumber dipertahankan. Rilis adalah artefak akademik konseptual; test runtime tidak otomatis passed. QC snapshot/hashes ada di logs/qc.md.
- Evidence: instruksi pengguna, hasil make build, inspection subset dan visual QA.

## ADR-008 — Template UB dan Calibri asli untuk laporan

- Date: 2026-11-05 12:37:23 WIB
- Status: accepted; supersedes ADR-007 untuk format/toolchain laporan.
- Decision: gunakan salinan style, sampul, dan logo dari template UB pengguna; sesuaikan font ke Calibri asli dan metadata dua anggota.
- Context: pengguna meminta template di `/Users/ramadhanial-qadri/Documents/My_File/Tesis/Flood Simulation/tesis-literatur/template-latex-ub`, lalu memberikan nama/NIM, Departemen Teknik Informatika dan instruksi Calibri.
- Options: meniru tampilan template secara terpisah; atau mengimpor paket gaya dan sampul sebenarnya dengan adaptasi terbatas.
- Chosen: impor `gaya/ubtesis.sty`, `awal/sampul.tex`, `gambar/logo-ub.jpg`; ubah hanya blok engine/font pada style dan blok identitas sampul. Metadata terpusat di report/metadata.tex. BAB, margin, leading, daftar awal, tabel grid, caption dan Harvard mengikuti style sumber.
- Rationale: pengguna menentukan template dan font. Calibri lokal tersedia di instalasi Microsoft Word; fontspec/XeLaTeX memakai font tersebut tanpa menyalin binari berlisensi ke repository.
- Consequences: laporan XeLaTeX+Biber; Beamer mandiri tetap pdfLaTeX/BibTeX. Satu engine/backend berlaku per artefak. Program Studi Magister Ilmu Komputer mengikuti konteks MILKOM; jenis naskah LAPORAN PROYEK. Metadata anggota berasal dari pengguna, bukan asumsi identitas. Source map tahun n.d. menyesuaikan keluaran t.t. tanpa mengubah bibliography bersama. Build lintas mesin memerlukan Calibri dan konfigurasi path yang dicatat di report/TEMPLATE-UB.md.
- Evidence: instruksi chat; template lokal beserta PANDUAN.md; perbandingan style setelah blok font dan logo identik; make build exit0 dan QC receipt terbaru. Folder template sumber tidak diubah; semantik model SysML dan klaim penelitian tetap baseline.
