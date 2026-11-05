# Pengantar Model-Based Systems Engineering (MBSE)

> Materi terstruktur dan diperluas dari slide **“Pengantar Model-Based System Engineering”**.  
> Fokus dokumen ini adalah memberikan catatan belajar yang lebih lengkap dan mudah dipakai sebagai konteks proyek, tanpa mengubah substansi utama dari materi asli.

---

## 1. Outline Materi

Materi pengantar MBSE mencakup enam bagian utama:

1. Pendahuluan
2. System Engineering
3. Konsep Dasar MBSE
4. Framework dan Tools MBSE
5. Implementasi MBSE
6. Diskusi

Urutan ini penting karena MBSE tidak berdiri sendiri. MBSE muncul sebagai pengembangan dari **Systems Engineering (SE)** dan digunakan untuk menangani kompleksitas sistem melalui model yang lebih formal, terintegrasi, dan dapat ditelusuri.

---

# 2. Systems Engineering

## 2.1 Definisi Systems Engineering

Systems Engineering adalah pendekatan **transdisipliner dan integratif** yang bertujuan memungkinkan realisasi, penggunaan, dan penghentian suatu engineered system secara berhasil.

Menurut materi, pendekatan ini menggunakan:

- prinsip sistem,
- konsep sistem,
- metode ilmiah,
- metode teknologi,
- metode manajemen.

Dengan kata lain, Systems Engineering tidak hanya membahas bagaimana sebuah komponen dibuat, tetapi juga bagaimana banyak komponen saling bekerja sebagai satu kesatuan.

### Definisi sistem

Sistem adalah sekumpulan elemen yang bekerja bersama untuk menghasilkan hasil yang tidak dapat dicapai oleh elemen-elemen tersebut jika bekerja sendiri-sendiri.

Konsep ini penting karena dalam sebuah sistem:

- terdapat beberapa komponen,
- terdapat hubungan antar komponen,
- terdapat tujuan bersama,
- terdapat perilaku sistem sebagai hasil interaksi antar bagian.

---

## 2.2 Jenis Sistem

Materi membagi sistem menjadi dua jenis dasar.

### Physical System

Physical system adalah sistem yang:

- bersifat nyata,
- dapat diamati,
- tersusun dari materi dan energi,
- menunjukkan perilaku fisik.

Contoh pada materi:

- mobil,
- jaringan listrik,
- telepon seluler.

### Conceptual System

Conceptual system adalah sistem yang:

- bersifat abstrak,
- dibangun terutama dari informasi,
- menghasilkan makna atau keluaran logis.

Contoh:

- algoritma kompleks,
- kerangka hukum,
- model finansial.

### Kombinasi

Dalam praktiknya, banyak sistem modern merupakan gabungan keduanya.

Contoh yang relevan dengan Smart Traffic Light:

- lampu lalu lintas dan sensor adalah elemen fisik,
- algoritma penentuan prioritas adalah elemen konseptual,
- keseluruhan sistem merupakan kombinasi physical system dan conceptual system.

---

## 2.3 Karakteristik Utama Systems Engineering

### Holistik dan berbasis siklus hidup

Systems Engineering melihat sistem sepanjang lifecycle:

1. konsepsi,
2. pengembangan,
3. implementasi,
4. operasi,
5. maintenance,
6. retirement atau penonaktifan.

Artinya, keputusan desain tidak hanya dinilai dari apakah sistem dapat dibuat, tetapi juga apakah dapat digunakan, dipelihara, dikembangkan, dan akhirnya dihentikan dengan baik.

### Berbasis prinsip sistem dan interdisipliner

Systems Engineering menggabungkan banyak bidang seperti:

- software engineering,
- hardware engineering,
- electrical engineering,
- mechanical engineering,
- management,
- human factors,
- ilmu komputer.

Hal ini menjadi penting ketika satu sistem tidak lagi bisa dipahami dari satu disiplin saja.

### Berorientasi pada tujuan dan kebutuhan stakeholder

Desain sistem harus selalu dikaitkan dengan:

- tujuan sistem,
- kebutuhan stakeholder,
- batasan operasional,
- kebutuhan kualitas.

Dengan demikian, sistem tidak hanya “berfungsi”, tetapi juga memenuhi kebutuhan pihak yang menggunakannya.

### Menggunakan model dan analisis formal

Systems Engineering dapat menggunakan model formal untuk:

- desain,
- analisis,
- validasi,
- verifikasi.

MBSE adalah salah satu pendekatan yang mendukung hal tersebut.

---

# 3. Konsep Dasar Model-Based Systems Engineering

## 3.1 Definisi MBSE

MBSE adalah pendekatan Systems Engineering yang menekankan penggunaan **model formal** sepanjang lifecycle sistem.

Materi menyampaikan dua sudut pandang utama:

### Perspektif SysML

MBSE merupakan paradigma Systems Engineering yang menekankan penerapan prinsip dan praktik pemodelan arsitektur yang ketat pada aktivitas Systems Engineering selama System Development Life Cycle.

### Perspektif INCOSE

MBSE adalah penerapan formal pemodelan untuk mendukung:

- requirements,
- design,
- analysis,
- verification,
- validation,

mulai dari tahap conceptual design dan berlanjut selama development serta tahap lifecycle berikutnya.

---

## 3.2 Model sebagai pusat rekayasa sistem

Pada pendekatan MBSE, model digunakan untuk:

- dokumentasi,
- analisis,
- simulasi,
- komunikasi,
- validasi,
- verifikasi.

Fokus utamanya adalah **representasi formal**, bukan hanya dokumen.

Model dapat mencakup:

- 3D model,
- model komponen,
- requirement,
- use case,
- state,
- logic,
- building block,
- test case.

Dengan demikian, sebuah model bukan hanya gambar.

Model menjadi representasi dari:

- apa yang dibutuhkan,
- bagaimana sistem bekerja,
- bagaimana sistem tersusun,
- bagaimana bagian sistem terhubung,
- bagaimana sistem diverifikasi.

---

# 4. Mengapa MBSE Penting?

## 4.1 Kompleksitas sistem terus meningkat

Materi mencontohkan perkembangan sistem menuju:

- Smart City,
- IoT,
- AI,
- kendaraan yang semakin kompleks.

Seiring bertambahnya kompleksitas, muncul berbagai tantangan:

- jumlah stakeholder bertambah,
- integrasi dengan sistem eksternal,
- kebutuhan future-proof,
- hidden requirements,
- banyak disiplin terlibat.

Contoh bidang yang dapat terlibat dalam satu sistem:

- software,
- mechanical,
- hardware,
- electrical.

---

## 4.2 Masalah pendekatan tradisional

Pendekatan tradisional dapat menimbulkan kebingungan karena:

- terminologi berbeda-beda,
- representasi berbeda,
- penggunaan diagram informal,
- artefak tersebar,
- perubahan sulit dilacak.

MBSE ditujukan untuk meningkatkan:

- konsistensi,
- kolaborasi,
- efisiensi.

---

# 5. Document-Based SE vs MBSE

## 5.1 Document-Based Systems Engineering

Pada document-based approach, artefak utama berupa:

- teks,
- tabel,
- raw data,
- spreadsheet,
- dokumen Word.

Karakteristiknya:

- statis,
- artefak sering terpisah,
- requirement biasanya ditulis dalam tabel,
- hubungan antar dokumen tidak selalu eksplisit.

Akibatnya, jika satu requirement berubah, dampaknya terhadap desain atau pengujian harus ditelusuri secara manual.

---

## 5.2 MBSE

Pada MBSE:

- model visual menjadi media utama,
- requirement direpresentasikan sebagai bagian dari model,
- model lintas domain dapat dihubungkan,
- traceability lebih kuat.

Dampaknya adalah komunikasi menjadi lebih jelas dan hubungan requirement dengan desain serta verification lebih mudah ditelusuri.

---

# 6. Image-Based SE vs MBSE

Sistem dapat saja digambar menggunakan:

- Visio,
- draw.io,
- PowerPoint,
- software diagram umum.

Namun gambar tersebut belum otomatis menjadi MBSE.

Masalah utama dari image-based system engineering adalah:

- diagram berdiri sendiri,
- diagram tidak terhubung secara semantik,
- traceability rendah,
- perubahan harus ditelusuri manual.

Pada MBSE, software modeling dapat membantu memelihara hubungan antar elemen model.

Materi memberikan contoh tools seperti:

- Capella,
- CATIA,
- Cameo,
- Enterprise Architect.

---

# 7. Software Engineering Tradisional vs MBSE

## 7.1 Fokus

### MBSE

Fokus pada sistem kompleks lintas disiplin:

- hardware,
- software,
- manusia,
- proses.

### Software Engineering

Fokus utama pada:

- software,
- aplikasi,
- requirement perangkat lunak,
- design,
- coding,
- testing,
- deployment.

---

## 7.2 Pendekatan

### MBSE

Model-centric.

Model formal digunakan untuk:

- mendeskripsikan,
- menganalisis,
- memvalidasi sistem.

### Software Engineering Tradisional

Lebih document-centric dan implementation-centric:

- dokumen,
- kode,
- spesifikasi,
- manual.

---

## 7.3 Tujuan

MBSE berorientasi pada:

- integrasi,
- traceability,
- konsistensi antar subsistem.

Software Engineering lebih berorientasi pada:

- fungsionalitas,
- kualitas software,
- maintainability.

---

## 7.4 Risiko utama

Dalam MBSE, risiko yang ingin ditekan adalah kegagalan sistem secara keseluruhan karena ketidaksinkronan antara:

- sensor,
- jaringan,
- software,
- hardware,
- subsistem lain.

Dalam software engineering, risiko biasanya lebih fokus pada:

- bug,
- performa software,
- ketidaksesuaian software dengan kebutuhan.

---

# 8. Sejarah dan Evolusi MBSE

Materi menjelaskan evolusi MBSE secara bertahap.

## 1950–1970

Systems Engineering berkembang pada industri:

- militer,
- aerospace.

Pendekatannya masih banyak berbasis dokumen panjang.

## 1980–1990

Bahasa pemodelan seperti UML mulai digunakan dalam rekayasa perangkat lunak.

Hal ini membuka jalan untuk pemodelan formal pada sistem yang lebih luas.

## 1990–2000

Sistem semakin kompleks.

Model formal mulai digunakan untuk:

- analisis,
- simulasi,
- integrasi lintas disiplin.

## Sekitar 2006

MBSE semakin dikenal luas dalam komunitas Systems Engineering.

SysML diperkenalkan sebagai bahasa pemodelan sistem.

## 2006–sekarang

MBSE digunakan dalam:

- aerospace,
- automotive,
- energi,
- Smart City.

MBSE juga terkait dengan perkembangan:

- digital engineering,
- digital twin.

---

# 9. Prinsip-Prinsip MBSE

Materi menekankan tiga prinsip inti.

## 9.1 Konsistensi antar model

Model tidak boleh saling bertentangan.

Contoh:

jika requirement menyatakan sistem memiliki sensor, maka struktur sistem harus memiliki elemen sensor yang sesuai.

## 9.2 Traceability

Requirement harus dapat ditelusuri ke:

- desain,
- behavior,
- implementasi,
- verification.

Traceability menjawab pertanyaan seperti:

- Requirement ini diwujudkan oleh komponen apa?
- Perilaku apa yang memenuhi requirement ini?
- Bagaimana requirement ini diuji?

## 9.3 Kolaborasi lintas disiplin

Model menjadi media bersama antara:

- software engineer,
- system engineer,
- hardware engineer,
- mechanical engineer,
- stakeholder lain.

---

# 10. Peran MBSE dalam Lifecycle

Materi menggambarkan model sebagai **single source of truth**.

Alur lifecycle yang ditampilkan:

**Requirement → Design → Analysis → Verification**

Makna konsep ini:

- requirement tidak berdiri sendiri,
- design harus memenuhi requirement,
- design dapat dianalisis,
- hasil design diverifikasi,
- perubahan dapat dilacak antar tahap.

---

# 11. Manfaat MBSE

Materi menyebut sejumlah manfaat:

- mengurangi kesalahan integrasi,
- mengurangi risiko,
- mempercepat pengembangan,
- meningkatkan komunikasi,
- mendukung digital twin,
- mendukung simulasi,
- meningkatkan visibilitas,
- menyediakan bahasa grafis yang lebih standar,
- sinkronisasi antar model,
- mendukung kolaborasi,
- meningkatkan reusability.

---

# 12. Tantangan Implementasi MBSE

MBSE juga memiliki hambatan:

- learning curve tinggi,
- investasi tool,
- kebutuhan training,
- resistensi budaya organisasi.

Dengan demikian, MBSE bukan sekadar masalah memilih software modeling.

Keberhasilannya juga bergantung pada:

- kompetensi tim,
- metodologi,
- disiplin modeling,
- proses organisasi.

---

# 13. SysML sebagai Modeling Language

SysML adalah bahasa pemodelan yang diturunkan dari UML dan dikhususkan untuk Systems Engineering.

Sebagian diagram berasal dari UML, sedangkan sebagian lainnya dirancang untuk mendukung kebutuhan Systems Engineering.

Tiga kategori utama yang disampaikan pada materi adalah:

1. Requirement
2. Behavior
3. Structure

---

# 14. Diagram Utama SysML

## Requirement

- Requirement Diagram

## Behavior

- Use Case Diagram
- Activity Diagram
- Sequence Diagram
- State Machine Diagram

## Structure

- Block Definition Diagram
- Internal Block Diagram
- Parametric Diagram
- Package Diagram

Materi juga menyebut **Allocation Table** untuk menunjukkan dependency antar diagram atau elemen.

---

# 15. MBSE Framework

Modeling language menjelaskan **bagaimana mengekspresikan model**.

Framework membantu menentukan:

- bagaimana model dibangun,
- urutan analisis,
- hubungan antar view,
- hubungan requirement, structure, behavior, parameter, dan safety.

Materi menyebut beberapa framework.

---

# 16. Arcadia

Arcadia adalah:

**Architecture Analysis & Design Integrated Approach**

Arcadia dibagi dalam dua kelompok besar.

## Problems / Needs Understanding

### Operational Analysis

Mengkaji:

- konteks operasi,
- stakeholder,
- kebutuhan operasional.

### System Need Analysis

Mendefinisikan apa yang dibutuhkan dari sistem.

## Solution Architectural Design

### Logical Architecture

Menggambarkan struktur solusi secara logis.

### Physical Architecture

Menggambarkan implementasi fisik dari solusi.

Secara umum, Arcadia bergerak dari:

**problem understanding → need understanding → logical solution → physical solution**

---

# 17. Magic Grid

Magic Grid membagi pemodelan menjadi tiga domain:

1. Problem
2. Solution
3. Implementation

Setiap domain dapat dilihat melalui lima pilar:

1. Requirements
2. Structure
3. Behavior
4. Parameters
5. Safety & Reliability

Artinya, sebuah sistem tidak hanya dilihat dari requirement dan struktur, tetapi juga:

- behavior,
- parameter performa,
- aspek keselamatan,
- reliability.

Diagram tabel pada materi menunjukkan bahwa level sistem dapat berkembang dari:

- stakeholder needs,
- system requirements,
- subsystem requirements,
- component requirements,
- implementation requirements.

Hal yang sama berlaku pada:

- structure,
- behavior,
- parameters,
- safety and reliability.

---

# 18. Systems Modeling Toolbox (SYSMOD)

SYSMOD menggunakan beberapa domain object utama.

## Role

Menjelaskan profil kompetensi orang yang:

- melakukan metode,
- bertanggung jawab pada produk.

## Method

Sekumpulan task untuk menghasilkan artefak penting dalam pengembangan sistem.

## Process

Urutan logis bagaimana metode dijalankan.

## Product

Komponen atau output yang dihasilkan.

Diagram pada materi memperlihatkan hubungan antar:

- methodology,
- tool,
- process,
- role,
- method,
- product.

Ini menunjukkan bahwa metodologi pengembangan bukan hanya diagram, tetapi juga melibatkan:

- siapa yang bekerja,
- bagaimana proses berjalan,
- tool yang digunakan,
- artefak yang dihasilkan.

---

# 19. Perangkat Lunak MBSE

Materi menyebut:

- Capella → Arcadia
- CATIA Magic Cyber Systems Engineer → Magic Grid
- Cameo Systems Modeler → multi-framework
- Enterprise Architect → multi-framework

Tool digunakan untuk membantu:

- membuat model,
- mengelola hubungan antar model,
- meningkatkan traceability,
- mengelola arsitektur.

---

# 20. Integrasi dengan Simulation Tools

MBSE dapat diintegrasikan dengan:

- MATLAB/Simulink,
- Modelica,
- co-simulation.

Integrasi semacam ini memungkinkan model tidak hanya menggambarkan struktur, tetapi juga digunakan untuk analisis dan simulasi.

---

# 21. Implementasi MBSE

Materi menyebut tiga langkah implementasi awal:

1. identifikasi kebutuhan organisasi,
2. pilih framework dan tools,
3. training dan pilot project.

Hal ini menunjukkan bahwa implementasi MBSE sebaiknya dilakukan secara bertahap.

---

# 22. Studi Kasus Industri

## Aerospace

Contoh yang disebut:

- NASA: pemodelan sistem misi luar angkasa,
- ESA: integrasi subsistem satelit.

## Automotive

Contoh:

- BMW: integrasi sistem elektronik kendaraan,
- Toyota: safety-critical systems.

---

# 23. MBSE dan PLM/CAD

Materi menyebut integrasi dengan:

- Siemens Teamcenter,
- Dassault CATIA.

Tujuannya adalah menghubungkan:

**requirement → desain fisik**

Ini memperkuat gagasan traceability dari kebutuhan sampai artefak engineering.

---

# 24. MBSE dan Digital Twin

Model MBSE dapat menjadi basis digital twin.

Digital twin membutuhkan model yang dapat mewakili sistem nyata dan mendukung:

- monitoring,
- analisis,
- sinkronisasi dengan kondisi aktual.

Materi menekankan monitoring real-time untuk sistem kompleks.

---

# 25. MBSE dalam Smart City dan Transportasi

Materi secara eksplisit menyebut:

- pemodelan sistem transportasi cerdas,
- layanan publik digital,
- integrasi data GIS,
- integrasi IoT.

Ini membuat MBSE relevan untuk proyek Smart Traffic Light karena proyek tersebut menggabungkan:

- sensor,
- data,
- pengambilan keputusan,
- controller,
- perangkat fisik,
- kemungkinan integrasi Smart City.

---

# 26. Tren Teknologi MBSE

Materi menyebut arah perkembangan:

- AI-assisted modeling,
- cloud-based MBSE,
- collaborative modeling platform.

Arah ini menunjukkan bahwa aktivitas modeling semakin:

- terotomatisasi,
- kolaboratif,
- terintegrasi.

---

# 27. Faktor Keberhasilan MBSE

Tiga faktor utama:

- dukungan manajemen,
- kompetensi tim,
- infrastruktur teknologi.

MBSE dapat gagal bila salah satu unsur ini tidak siap.

---

# 28. Keberhasilan dan Kegagalan

Keberhasilan MBSE dapat menghasilkan:

- efisiensi,
- inovasi.

Kegagalan dapat terjadi akibat:

- resistensi budaya,
- biaya implementasi yang tinggi.

---

# 29. Ringkasan

MBSE adalah pendekatan rekayasa sistem berbasis model yang bertujuan untuk meningkatkan:

- integrasi,
- konsistensi,
- traceability,
- komunikasi,
- kolaborasi.

MBSE didukung oleh:

- modeling language,
- framework,
- tools,
- simulation,
- proses engineering.

Dalam konteks Smart City dan transportasi, MBSE dapat digunakan untuk memodelkan sistem yang terdiri dari banyak subsistem dan stakeholder.

---

# 30. Pertanyaan Diskusi

1. Bagaimana MBSE relevan dengan bidang riset atau proyek yang sedang dikerjakan?
2. Apa tantangan penerapan MBSE dalam konteks Indonesia?
3. Apakah project kecil selalu membutuhkan MBSE lengkap?
4. Bagaimana menjaga traceability pada workflow diagram-as-code?
5. Bagaimana membedakan diagram biasa dengan model yang benar-benar mengikuti prinsip MBSE?
