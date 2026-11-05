# Pemodelan Sistem dengan MBSE dan SysML

> Materi terstruktur dan diperluas dari slide **“Pemodelan Sistem dengan MBSE”**.  
> Dokumen ini berfokus pada penggunaan SysML untuk merepresentasikan requirement, behavior, structure, constraint, serta hubungan antar model.

---

# 1. Posisi Pemodelan dalam MBSE

MBSE menggunakan model digital sebagai artefak utama rekayasa sistem.

Model digunakan untuk mendukung:

- requirement,
- design,
- analysis,
- verification,
- validation.

Model bukan hanya ilustrasi, tetapi representasi formal dari sistem.

Materi menyebut bahwa model dapat terdiri dari:

- model 3D,
- model komponen,
- requirement model,
- use case,
- state,
- building block,
- test case.

---

# 2. Mengapa Representasi Formal Dibutuhkan?

Pendekatan tradisional dapat menimbulkan masalah:

- terminologi tidak seragam,
- diagram berbeda-beda,
- representasi informal,
- hubungan antarmodel sulit ditelusuri.

MBSE diarahkan untuk meningkatkan:

- konsistensi,
- kolaborasi,
- efisiensi.

SysML digunakan sebagai salah satu bahasa model formal untuk Systems Engineering.

---

# 3. SysML

SysML adalah turunan UML yang disesuaikan dengan kebutuhan Systems Engineering.

Materi membagi SysML menjadi tiga komponen utama:

1. Requirement
2. Behavior
3. Structure

Dengan pembagian tersebut, sistem dapat dilihat dari tiga pertanyaan:

- **Apa yang harus dipenuhi?** → Requirement
- **Bagaimana sistem bekerja?** → Behavior
- **Sistem terdiri dari apa?** → Structure

---

# 4. Diagram Utama SysML

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

## Hubungan lintas model

Materi juga menyebut Allocation Table sebagai bentuk dependency antar diagram.

---

# 5. Requirement Diagram

## 5.1 Definisi Requirement

Requirement adalah kemampuan atau kondisi yang harus dipenuhi oleh sistem.

Dalam SysML, requirement direpresentasikan menggunakan elemen dengan stereotype:

`«requirement»`

Requirement dapat dibagi menjadi:

### Functional Requirement

Mendefinisikan fungsi yang harus dilakukan sistem.

Contoh umum:

- sistem harus membaca sensor,
- sistem harus menghitung kondisi,
- sistem harus mengirim perintah.

### Non-Functional Requirement

Mendefinisikan kualitas atau constraint.

Materi menyebut kategori:

- `«performanceRequirement»`
- `«interfaceRequirement»`
- `«designConstraint»`
- `«physicalRequirement»`

---

## 5.2 Tujuan Requirement Diagram

Requirement Diagram digunakan untuk menunjukkan hubungan antara:

- requirement,
- elemen model yang memenuhi requirement,
- test case yang memverifikasi requirement.

Relasi yang disorot materi:

### `«satisfy»`

Menunjukkan elemen model yang memenuhi requirement.

### `«verify»`

Menghubungkan requirement dengan test case yang digunakan untuk memverifikasi requirement.

Dengan demikian, Requirement Diagram mendukung traceability.

---

## 5.3 Hierarki Requirement

Contoh pada slide memperlihatkan bahwa requirement dapat didekomposisi.

Secara konsep:

```text
System Requirement
├── Functional Requirement
│   ├── Function A
│   ├── Function B
│   └── Function C
└── Non-Functional Requirement
    ├── Performance
    ├── Design Constraint
    ├── Interface
    └── Quality
```

Dekomposisi membantu memecah kebutuhan tingkat tinggi menjadi kebutuhan yang lebih spesifik.

---

# 6. Use Case Diagram

## 6.1 Use Case

Use case menggambarkan transaksi atau layanan yang dilakukan sistem terhadap aktor eksternal.

Notasi umumnya berbentuk oval.

Use case sering dapat dipandang sebagai requirement fungsional tingkat tinggi.

---

## 6.2 Actor

Actor adalah entitas eksternal yang berinteraksi dengan sistem.

Actor dapat berupa:

- manusia,
- organisasi,
- fasilitas,
- sistem software,
- sistem hardware.

Artinya, actor tidak selalu manusia.

---

## 6.3 System Boundary

Use Case Diagram menempatkan fungsi sistem di dalam sebuah system boundary.

Hal ini membantu membedakan:

- apa yang menjadi bagian dari sistem,
- apa yang berada di luar sistem.

---

## 6.4 Tujuan Use Case Diagram

Use Case Diagram memberikan gambaran tinggi tentang:

- layanan sistem,
- interaksi eksternal,
- stakeholder,
- batas sistem.

Diagram ini juga berguna untuk komunikasi karena relatif mudah dipahami oleh pihak non-teknis.

---

# 7. Activity Diagram

## 7.1 Activity

Activity merepresentasikan aliran perilaku fungsional.

Activity dapat mencakup:

- control flow,
- object flow.

---

## 7.2 Action

Action adalah activity atomik atau perilaku executable yang lebih kecil.

---

## 7.3 Control Flow

Control Flow menunjukkan urutan perilaku.

Contoh:

```text
Read Sensor
→ Calculate Density
→ Determine Priority
→ Send Signal
```

---

## 7.4 Object Flow

Object Flow menunjukkan perpindahan data atau object antar action.

Contoh:

```text
Sensor Data
→ Density Data
→ Priority Data
→ Signal Command
```

---

## 7.5 Parallelism

Control Flow dan Object Flow dapat berjalan:

- sequential,
- parallel.

Parallel behavior dapat ditunjukkan dengan:

- Fork Node,
- Join Node.

---

## 7.6 Decomposition

Activity dapat didekomposisi menjadi activity yang lebih kecil.

Hal ini membantu modeling hierarkis:

```text
Manage Traffic
├── Sense Traffic
├── Analyze Density
├── Select Phase
└── Control Signal
```

---

## 7.7 Allocation

Materi menjelaskan bahwa activity/action dapat dialokasikan ke block atau partition.

Dengan demikian dapat ditelusuri:

**Behavior → Structural Component**

Contoh:

```text
Activity: Analyze Density
allocated to
Block: Traffic Controller
```

---

## 7.8 Tujuan Activity Diagram

Activity Diagram digunakan untuk menspesifikasikan perilaku dinamis yang memenuhi functional requirement.

Karena itu, Activity Diagram sangat penting dalam MBSE untuk menghubungkan:

**Requirement → Behavior**

---

# 8. Sequence Diagram

## 8.1 Message

Message menunjukkan komunikasi antar object atau service.

Message dapat:

- synchronous,
- asynchronous.

---

## 8.2 Lifeline

Object atau service direpresentasikan sebagai lifeline.

Lifeline memperlihatkan keberadaan participant selama suatu interaction.

---

## 8.3 Dynamic Interaction

Sequence Diagram memperlihatkan:

- siapa mengirim pesan,
- siapa menerima,
- urutan waktu,
- kondisi tertentu,
- loop,
- alternatif.

---

## 8.4 Combined Fragment

Materi menyebut beberapa operator:

- `alt` — alternative
- `opt` — optional
- `par` — parallel
- `loop` — repetition

Combined fragment membuat Sequence Diagram dapat merepresentasikan interaction yang kompleks.

---

## 8.5 Tujuan Sequence Diagram

Sequence Diagram digunakan untuk menunjukkan perilaku dinamis sistem sebagai kolaborasi berbasis pesan antar block atau part.

Dengan demikian, Sequence Diagram menjawab pertanyaan:

**bagaimana komponen berkomunikasi untuk mewujudkan suatu skenario?**

---

# 9. State Machine Diagram

## 9.1 State

State adalah kondisi suatu object selama lifecycle tertentu.

Dalam state tertentu, object dapat:

- memenuhi kondisi,
- melakukan activity,
- menunggu event.

---

## 9.2 Event / Trigger

Perubahan state terjadi sebagai respons terhadap event atau trigger.

Transisi dapat menyebabkan action.

---

## 9.3 Tujuan

State Machine Diagram digunakan untuk behavior yang sensitif terhadap:

- waktu,
- mission,
- keselamatan,
- finansial.

Contoh yang sangat cocok adalah traffic light:

```text
Red
→ Green
→ Yellow
→ Red
```

Namun model sesungguhnya dapat menambahkan guard dan trigger.

Contoh:

```text
Red
--[priorityGranted]--> Green

Green
--[greenTimerExpired]--> Yellow

Yellow
--[yellowTimerExpired]--> Red
```

---

# 10. Block Definition Diagram (BDD)

## 10.1 Block

Block adalah unit struktural modular dalam SysML.

Block dapat memiliki:

- Property,
- Behavior,
- Constraint,
- Interface.

Block dapat mewakili:

- hardware,
- software,
- mechanical system,
- orang,
- organisasi,
- fasilitas.

---

## 10.2 Behavior pada Block

Behavior yang terkait dengan block dapat berupa:

- Operation,
- Signal,
- State Machine.

Selain behavior yang dienkapsulasi, activity juga dapat dialokasikan ke block.

---

## 10.3 Port

Port adalah titik interaksi pada block.

Port digunakan untuk:

- menghubungkan block,
- mendefinisikan interface,
- mengatur data atau signal yang masuk/keluar.

---

## 10.4 Recursive Decomposition

Block dapat dipecah menjadi part.

Contoh:

```text
SmartTrafficLightSystem
├── SensorSubsystem
├── TrafficController
├── SignalController
└── TrafficLight
```

Setiap part juga dapat didefinisikan sebagai block.

---

## 10.5 Tujuan BDD

BDD adalah structural diagram yang digunakan untuk mendefinisikan:

- komponen sistem,
- properties,
- behaviors,
- constraints,
- interface,
- relationship.

BDD cocok digunakan untuk menjawab:

**sistem terdiri dari komponen apa?**

---

# 11. System Context pada BDD

Materi menampilkan contoh system context.

System context menunjukkan sistem utama dan entitas eksternal di sekelilingnya.

Tujuannya antara lain:

- menetapkan boundary sistem,
- mengidentifikasi external system,
- mengidentifikasi interface utama.

Dalam Smart Traffic Light, system context dapat memuat:

```text
Smart Traffic Light System
↔ Vehicle
↔ Road Environment
↔ Operator
↔ External Traffic Management System
```

---

# 12. System Interface pada BDD

Materi juga menampilkan system interface.

Interface menjelaskan:

- port,
- data,
- signal,
- command,
- hubungan antarsistem.

Hal ini membantu memastikan interaksi antar subsistem tidak hanya digambar sebagai garis, tetapi diberi makna.

---

# 13. Internal Block Diagram (IBD)

## 13.1 Definisi

IBD adalah structural diagram yang dimiliki sebuah block dan menunjukkan isi internal block tersebut.

IBD menunjukkan:

- Part,
- Property,
- Connector,
- Port,
- Interface.

IBD dapat dipandang sebagai perspektif **white-box**.

Jika BDD mendefinisikan block sebagai black-box, IBD memperlihatkan bagaimana isi internalnya disusun dan dihubungkan.

---

## 13.2 BDD vs IBD

### BDD

Berfokus pada:

- definisi type,
- struktur konseptual,
- properties,
- relationship.

### IBD

Berfokus pada:

- penggunaan part,
- role,
- koneksi internal,
- flow.

Hubungannya dapat dipandang sebagai:

```text
BDD = Block Definition
IBD = Block Usage / Internal Realization
```

---

## 13.3 Parts dan Reference Properties

Materi membedakan:

- Part Property,
- Reference Property.

Part Property adalah bagian yang dimiliki kuat oleh block.

Reference Property merepresentasikan referensi ke bagian lain.

---

## 13.4 Tujuan IBD

IBD digunakan untuk:

- menunjukkan isi internal,
- menghubungkan part,
- mendefinisikan port,
- menunjukkan interface,
- menerapkan interface-based design.

---

# 14. Parametric Diagram

## 14.1 Constraint Block

Constraint Block mendefinisikan aturan matematis.

Constraint memiliki parameter.

Parameter kemudian diikat ke value property dari block.

Tujuannya agar hubungan matematis dapat diterapkan secara konsisten.

---

## 14.2 Parametric Diagram sebagai spesialisasi IBD

Parametric Diagram dapat dipandang sebagai bentuk khusus IBD yang fokus pada constraint matematis.

Elemen penting:

- Constraint Block,
- Parameter,
- Value Property,
- Binding Connector.

---

## 14.3 Binding Connector

Binding Connector mengikat parameter constraint dengan value property.

Secara konsep:

```text
Constraint Parameter
= Value Property
```

Jika nilai berubah, hubungan constraint harus tetap terpenuhi.

---

## 14.4 Contoh konsep energi

Slide memberikan contoh hubungan energi:

```text
ME = KE + PE
```

dengan parameter seperti:

- mass,
- velocity,
- radius/jarak,
- kinetic energy,
- potential energy.

Model parametric menghubungkan parameter tersebut sehingga constraint matematis menjadi bagian dari model.

---

## 14.5 Tujuan Parametric Diagram

Parametric Diagram digunakan untuk menerapkan aturan matematis pada value property.

Dalam konteks Smart Traffic Light, konsep ini dapat digunakan bila proyek mendefinisikan formula seperti:

```text
greenTime = f(density)
```

Namun formula tersebut harus berasal dari:

- referensi,
- kebutuhan,
- atau asumsi desain yang terdokumentasi.

---

# 15. Package Diagram

## 15.1 Package

Package adalah mekanisme untuk mengelompokkan elemen model dan diagram.

Package mendefinisikan namespace.

Namespace membantu menghindari konflik nama dan mengorganisasi model besar.

---

## 15.2 Package Diagram

Package Diagram adalah structural diagram yang menunjukkan:

- package,
- content grouping,
- relationship antar package.

Package dapat digunakan untuk mengorganisasi:

- model,
- view,
- model library,
- framework.

---

## 15.3 Tujuan

Package Diagram berguna ketika System Architecture Model sudah besar dan kompleks.

Contoh organisasi:

```text
SmartTrafficLight
├── Requirements
├── Behavior
├── Structure
├── Interfaces
├── Parameters
└── Verification
```

---

# 16. Hubungan Antar Diagram dalam MBSE

Diagram SysML sebaiknya tidak dibuat sebagai artefak terpisah.

Hubungan konseptualnya dapat dijelaskan sebagai berikut.

## Requirement → Use Case

Requirement tingkat tinggi dapat diwujudkan sebagai layanan yang terlihat oleh actor.

## Requirement → Activity

Activity menunjukkan behavior yang memenuhi functional requirement.

## Activity → Block

Activity dialokasikan ke block yang bertanggung jawab menjalankannya.

## Block → IBD

IBD memperlihatkan bagaimana block diimplementasikan secara internal dan bagaimana part saling berhubungan.

## Behavior → Sequence

Sequence menunjukkan komunikasi antar part untuk menjalankan behavior.

## Block → State Machine

State Machine dapat menunjukkan lifecycle/state dari block tertentu.

## Requirement → Verification

Requirement harus ditautkan dengan verification/test.

Inilah inti traceability dalam MBSE.

---

# 17. Black-Box dan White-Box Modeling

## Black-Box

Fokus pada:

- input,
- output,
- layanan,
- interface eksternal.

Tidak membahas detail internal.

## White-Box

Fokus pada:

- bagian internal,
- connector,
- flow,
- mechanism.

BDD system context atau use case dapat banyak dipakai untuk memahami black-box.

IBD digunakan untuk memahami white-box.

---

# 18. Model Consistency

Model yang baik harus konsisten.

Contoh aturan konsistensi:

- requirement menyebut `Traffic Controller`,
- BDD juga memiliki `Traffic Controller`,
- Activity dialokasikan ke `Traffic Controller`,
- Sequence menggunakan lifeline `Traffic Controller`,
- IBD menunjukkan koneksi `Traffic Controller`,
- verification menguji behavior controller.

Jika nama dan makna berubah tanpa alasan, traceability akan rusak.

---

# 19. Traceability

Traceability adalah kemampuan melacak hubungan antar artefak.

Contoh chain:

```text
Stakeholder Need
↓
System Requirement
↓
Functional Behavior
↓
Block / Component
↓
Interface
↓
Verification
```

Traceability penting saat requirement berubah.

Pertanyaan yang harus bisa dijawab:

- bagian model mana yang terkena dampak?
- behavior mana yang harus diperbarui?
- komponen mana yang terkait?
- test case mana yang harus diulang?

---

# 20. Verification dan Validation

Walaupun slide modeling tidak membahas keduanya secara panjang, definisi MBSE pada materi mengaitkan model dengan verification dan validation.

Secara konteks Systems Engineering:

## Verification

Menilai apakah sistem dibangun sesuai requirement.

Pertanyaan:

**“Apakah sistem dibuat dengan benar?”**

## Validation

Menilai apakah sistem yang dibuat memenuhi kebutuhan penggunaan.

Pertanyaan:

**“Apakah sistem yang benar telah dibuat?”**

Dalam proyek akademik tanpa implementasi nyata, artefaknya dapat berupa:

- verification scenario,
- expected behavior,
- requirement-test traceability.

Jangan menyebut hasil tersebut sebagai hasil eksperimen bila tidak ada eksperimen nyata.

---

# 21. Relevansi Langsung untuk Tugas Smart Traffic Light

Tugas pada materi meminta pembuatan model Smart Traffic Light yang:

1. dapat mendeteksi kepadatan kendaraan,
2. memberikan prioritas lampu hijau lebih lama pada ruas dengan kepadatan tinggi,
3. dikerjakan berkelompok,
4. dipresentasikan.

Dari sudut MBSE, tugas ini dapat diterjemahkan menjadi beberapa view.

## Requirement View

Mendefinisikan kebutuhan seperti:

- sistem mendeteksi kondisi lalu lintas,
- sistem menentukan kepadatan,
- sistem mengatur lampu,
- sistem memberi prioritas.

## Behavior View

Menjelaskan:

- bagaimana data diperoleh,
- bagaimana kepadatan dianalisis,
- bagaimana keputusan dibuat,
- bagaimana sinyal berubah.

## Structure View

Menjelaskan komponen seperti:

- sensor,
- controller,
- signal controller,
- traffic light.

## Verification View

Menjelaskan bagaimana requirement diuji secara konseptual.

---

# 22. Pemetaan Tools Diagram-as-Code untuk Proyek

Berdasarkan keputusan proyek:

## Mermaid

Digunakan untuk:

- Requirement Diagram

Keuntungan:

- text-based,
- mudah disimpan di Git,
- mudah digunakan dalam Markdown,
- mendukung requirement diagram.

## PlantUML

Digunakan untuk:

- Use Case,
- Activity,
- Sequence,
- State Machine,
- BDD,
- IBD.

Keuntungan:

- source-based,
- versionable,
- dapat dirender otomatis,
- cocok untuk workflow code-based.

Catatan penting:

Mermaid dan PlantUML adalah media representasi.

Prinsip MBSE tetap harus dijaga melalui:

- consistency,
- traceability,
- evidence,
- hubungan antar view.

---

# 23. Checklist Model Minimum

Untuk tugas Smart Traffic Light, minimum model yang paling lengkap berdasarkan materi adalah:

- [ ] Requirement Diagram
- [ ] Use Case Diagram
- [ ] Activity Diagram
- [ ] Sequence Diagram
- [ ] State Machine Diagram
- [ ] Block Definition Diagram
- [ ] Internal Block Diagram
- [ ] Traceability
- [ ] Verification scenario

Parametric Diagram dapat ditambahkan jika terdapat constraint matematis yang memang digunakan.

Package Diagram dapat digunakan jika struktur model sudah cukup besar.

---

# 24. Prinsip Akhir

Pemodelan MBSE bukan sekadar menggambar banyak diagram.

Model harus:

1. berbasis requirement,
2. menggunakan terminologi konsisten,
3. menunjukkan behavior yang relevan,
4. menunjukkan structure yang mendukung behavior,
5. memiliki hubungan antar model,
6. memiliki traceability,
7. dapat digunakan untuk analysis dan verification.

Dengan demikian, ukuran kualitas model bukan jumlah diagram, tetapi seberapa baik diagram-diagram tersebut membentuk representasi sistem yang konsisten.
