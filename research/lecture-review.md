# Tinjauan materi kuliah dan gate modeling

## Sumber yang tersedia

- `lecture/01-pengantar-mbse.md`: catatan terstruktur dan diperluas dari slide “Pengantar Model-Based System Engineering”; §3, §9–14, §15–20, dan bagian akhir telah ditinjau untuk konteks MBSE, traceability, diagram dan batas tool.
- `lecture/02-pemodelan-mbse-sysml.md`: catatan terstruktur dan diperluas dari slide “Pemodelan Sistem dengan MBSE”; §1–24 ditinjau, dengan fokus §5–13, §16–21.
- `lecture/README.md`: indeks/ringkasan; bukan sumber jurnal tambahan.

Materi tersedia dalam Markdown yang disediakan di workspace. Penulis, institusi, tanggal kuliah, nomor slide asli, dan batas tepat antara isi slide serta perluasan tidak dicantumkan. Karena slide asli tidak tersedia, kutip file catatan dan bagian yang benar-benar dibaca; jangan mengaku mengutip slide/dosen tertentu. Bagian “berdasarkan keputusan proyek” pada §22 adalah konteks proyek, bukan bukti eksternal bahwa tool tertentu diwajibkan oleh SysML.

## Konsep yang digunakan

| Evidence | Lokasi | Isi yang dapat dipakai | Batas |
|---|---|---|---|
| EVID-LEC-001 | 01, §9–10; 02, §16–19 | konsistensi dan traceability antar kebutuhan, perilaku, struktur, verifikasi | kutip sebagai catatan yang tersedia |
| EVID-LEC-002 | 02, §5.1–5.3 | requirement serta relasi satisfy/verify | arah/endpoint diperiksa pada standar saat modeling |
| EVID-LEC-003 | 02, §7–9 | activity/action, interaction/message, state/transition | contoh diagram dalam catatan bukan desain final proyek |
| EVID-LEC-004 | 02, §10–13 | BDD untuk definisi block; IBD untuk part, port, connector dan interface internal | jangan menyamakan type dan usage |
| EVID-LEC-005 | 02, §21 | tugas mendeteksi kepadatan dan memberi hijau lebih lama pada ruas padat | detail baseline dan angka waktu tetap asumsi |

## Gate dan versi SysML

Gate ketersediaan/relevansi materi kuliah: **terpenuhi untuk catatan Markdown yang disediakan**, dengan keterbatasan provenance di atas. Tidak mengganti kuliah dengan sumber lain. ISSUE-001 dapat ditutup untuk ketersediaan/relevansi, tanpa menyatakan pembandingan dengan slide asli selesai.

Materi memakai keluarga konsep BDD/IBD dan stereotype requirement, tetapi tidak menyebut nomor versi. Baseline yang diusulkan adalah **SysML 1.6**, sebagai keputusan desain ASM-010 yang konsisten dengan jenis view materi dan memiliki rujukan OMG tetap. Nomor 1.6 bukan fakta yang dinyatakan dosen pada catatan. Model tetap harus mengikuti semantik subset terpilih; Mermaid/PlantUML hanya renderer. Jangan mencampurnya dengan textual syntax SysML v2 atau mengklaim validasi oleh engine SysML formal.
