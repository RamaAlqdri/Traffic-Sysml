# Traceability dan pemetaan SysML

Baseline aktif: **SysML v2.0**, sesuai keputusan pengguna 7 November 2026. `.sysml` adalah sumber utama; Markdown menjelaskan evidence, relasi dan batas. Acuan resmi: https://www.omg.org/spec/SysML/2.0/Language/PDF. Parser/renderer komunitas yang dikunci versinya tidak merupakan sertifikasi OMG atau interpreter perilaku penuh.

## Matrix requirement → model → verification

| Requirement | Evidence / asumsi | Use case | Action | Block pemenuh | TestCase |
|---|---|---|---|---|---|
| REQ-F-001 | EVID-TRF-006, ASM-003 | UC-01 | ACT-02 | BLK-03 | VER-01 |
| REQ-F-002 | ASM-004 | UC-02 | ACT-08 | BLK-04 | VER-02 |
| REQ-F-003 | EVID-TRF-001, ASM-004 | UC-02 | ACT-03 | BLK-04 | VER-03 |
| REQ-F-004 | EVID-TRF-001, ASM-005, ASM-006 | UC-02 | ACT-04 | BLK-04 | VER-04 |
| REQ-F-005 | ASM-004 | UC-02 | ACT-03 | BLK-04 | VER-05 |
| REQ-P-001 | ASM-002, ASM-006 | UC-01 | ACT-01 | BLK-02 | VER-06 |
| REQ-P-002 | ASM-006 | UC-02 | ACT-03 | BLK-04 | VER-07 |
| REQ-P-003 | ASM-005, ASM-008 | UC-03 | ACT-05 | BLK-05 | VER-08 |
| REQ-P-004 | ASM-005 | UC-03 | ACT-05 | BLK-05 | VER-08 |
| REQ-P-005 | ASM-004, ASM-005, ASM-008 | UC-02 | ACT-03 | BLK-04 | VER-09 |
| REQ-S-001 | EVID-TRF-002, ASM-001, ASM-008 | UC-03 | ACT-05 | BLK-05 | VER-10 |
| REQ-S-002 | ASM-008 | UC-03 | ACT-06 | BLK-05 | VER-11 |
| REQ-S-003 | ASM-008 | UC-03 | ACT-06 | BLK-05 | VER-11 |
| REQ-S-004 | ASM-008 | UC-03 | ACT-09 | BLK-05 | VER-12 |
| REQ-S-005 | ASM-004, ASM-005 | UC-02 | ACT-03 | BLK-04 | VER-13 |
| REQ-S-006 | ASM-004, ASM-008 | UC-03 | ACT-03 | BLK-04 | VER-13 |
| REQ-I-001 | ASM-002, ASM-006 | UC-01 | ACT-01 | BLK-02 | VER-14 |
| REQ-I-002 | EVID-TRF-002, ASM-008 | UC-03 | ACT-05 | BLK-06 | VER-15 |
| REQ-R-001 | ASM-006, ASM-007 | UC-04 | ACT-01 | BLK-02 | VER-16 |
| REQ-R-002 | ASM-007 | UC-04 | ACT-07 | BLK-04 | VER-17 |
| REQ-R-003 | ASM-007 | UC-04 | ACT-07 | BLK-04 | VER-18 |
| REQ-R-004 | ASM-007 | UC-04 | ACT-07 | BLK-04 | VER-19 |
| REQ-D-001 | ASM-001, ASM-009 | UC-02 | ACT-03 | BLK-01 | VER-20 |
| REQ-D-002 | EVID-LEC-001, EVID-LEC-002, EVID-LEC-003, EVID-LEC-004, ASM-010 | UC-02 | ACT-03 | BLK-01 | VER-21 |

Relasi v2 dinyatakan pada source: `satisfy requirement by partUsage`, `objective { verify requirement; }` di verification case, dan `allocate actionUsage to partUsage`. Build memeriksa 24 requirement memiliki satisfy dan verify; keberadaan hubungan bukan verdict pelaksanaan.

## Pemetaan SysML v2

| ID / konsep v2 | Owner/context | Source utama | Tampilan dan batas |
|---|---|---|---|
| REQ-* / requirement usage | StlRequirements | requirements/requirements.sysml | 24 statement dan metadata; overview menampilkan empat; katalog/kartu laporan diturunkan dari doc model |
| UC-01..04 / use case definition | StlUseCases / System of Interest | behavior/use-case.sysml | include UC-03; hubungan UC-04→UC-02 berupa dependency dengan kondisi dataFault dalam doc, bukan UML extend |
| ACT-00 / action definition | StlActivity | behavior/activity.sysml | ManageTraffic event-driven; dua belas aksi bantu, sepuluh aksi ber-ID ACT-01..10 |
| ACT-01..10 / action usage | manageTraffic | behavior/activity.sysml; traceability/allocation.sysml | allocation ke part usage sensor/densityAnalysis/controller/signals |
| INT-01 / occurrence dan message | StlInteraction | behavior/sequence.sysml | ref part mengikat part konteks IBD; urutan succession, bukan hasil waktu eksekusi |
| STM-01 / state definition dan exhibit state | SignalController | behavior/state-machine.sysml; structure/bdd.sysml | grant disalin ke lockedGreen; invalid grant/command atau rencana tidak layak menuju safetyHold; renderer state adalah overview, detail transisi tetap pada source |
| BLK-01..06 / part definition | StlStructure | structure/bdd.sysml | ID BLK historis dipertahankan; bukan stereotype block UML |
| sensor/densityAnalysis/controller/signals/lightNorth..West / part usage | smartTrafficLight : SmartTrafficLightSystem | structure/bdd.sysml dan ibd.sysml | delapan part internal, empat lampu dengan approach berbeda; adapter mengekspansi fitur tipe untuk renderer |
| Port / port definition dan conjugated port usage | part pemilik | structure/types.sysml; bdd.sysml | SamplesIF, DensityIF, StatusIF, CommandIF, BoundaryIF, LampsIF; P01..12 tetap alias dictionary lama; countsIn adalah input boundary tambahan |
| C00..C06 / connection dan flow | StlContext | structure/ibd.sysml | C00 eksternal; C01..05 internal; C06N/S/E/W fan-out LampVector; port typing menentukan jenis aliran |
| VER-01..21 / verification case definition | StlVerification | verification/verification.sysml | objective verify; timeline rinci pada verification-scenarios.md; status aktual hanya pada receipt |

## Dictionary interface/value types

| Tipe | Isi / constraint |
|---|---|
| Approach | enumeration North, South, East, West; ring N/S/E/W |
| SignalColor | enumeration Red, Yellow, Green |
| ControlMode | enumeration Normal, Fallback; SafetyHold adalah state lifecycle sinyal, bukan mode adaptive |
| CountsFrame | empat record {approach:Approach, vehicleCount:Integer, observedAt:Real[s], valid:Boolean}; domain/timestamp sesuai kontrak operasi |
| DensityFrame | kategori LOW/MEDIUM/HIGH per pendekat; hanya dari frame yang lolos validasi |
| PhaseCommand | discriminated command kind Grant atau Hold. Grant memiliki approach, greenSeconds 10..30 integer, mode; Hold tidak memiliki green grant. Restart merupakan lifecycle event terpisah |
| BoundaryEvent | kind: SafeBoundary atau GrantAccepted, timestamp; completedApproach opsional pada SafeBoundary, acceptedApproach pada GrantAccepted. SafeBoundary dipancarkan setelah startup/clearance; grantAccepted(i) pada sequence menggunakan BoundaryEvent di channel C05 yang sama |
| LampVector | tepat empat pasangan approach/color; setiap lights[k] mengambil entry approach miliknya |
| SamplesIF, DensityIF | port definition dengan flow property out frame:CountsFrame / out density:DensityFrame |
| StatusIF | port definition dengan flow properties out dataFault:Boolean dan out recoveryStreak:Integer 0..3 |
| CommandIF, BoundaryIF, LampsIF | port definition dengan flow property out command:PhaseCommand / out boundary:BoundaryEvent / out lamps:LampVector |

Port penerima menggunakan conjugated port definition (~); arah flow property dibalik, tipe item tetap sama. Antarmuka lingkungan ke adapter sensor dimodelkan sebagai boundary input count yang sudah disediakan, bukan assembly connector internal atau perangkat pendeteksi fisik.

## Endpoint connector dan flow

| ID | Source port (owner/type) | Target port (owner/type) | Item |
|---|---|---|---|
| C01 | P01 sensor.samplesOut:SamplesIF | P03 densityAnalysis.samplesIn:~SamplesIF | CountsFrame |
| C02 | P04 densityAnalysis.densityOut:DensityIF | P05 controller.densityIn:~DensityIF | DensityFrame |
| C03 | P02 sensor.statusOut:StatusIF | P06 controller.statusIn:~StatusIF | dataFault, recoveryStreak |
| C04 | P07 controller.commandOut:CommandIF | P09 signals.commandIn:~CommandIF | PhaseCommand |
| C05 | P10 signals.boundaryOut:BoundaryIF | P08 controller.boundaryIn:~BoundaryIF | BoundaryEvent |
| C06 | P11 signals.lampsOut:LampsIF | P12 lights[k].lampsIn:~LampsIF, k=N/S/E/W | LampVector; representasi bundle fan-out ke empat port |

## QC semantik dan batas representasi

- Include dari UC-02 ke UC-03; dependency UC-04 ke UC-02 dengan kondisi dataFault dalam dokumentasi model. UC-01 tidak dibuat mandatory synchronous include karena input bersifat asynchronous.
- Allocation action→block, satisfy block→requirement, verify testCase→requirement; tidak ada deriveReqt yang diklaim karena katalog belum memakai dekomposisi formal kebutuhan induk.
- Part definition didefinisikan sekali pada source struktur; usage part direferensikan pada IBD dan lifeline sequence. Lights memiliki approach property berbeda untuk tiap instance.
- Satisfy dan verify berasal langsung dari model native dan diperiksa checker; label/render bukan verdict pelaksanaan.
- Perubahan mode hanya diputuskan pada Ready; timer/clearance tetap milik STM-01 SignalController. ACT-06 merepresentasikan transisi yang enabled oleh event, bukan blocking delay setiap ada sample.
- Checklist di atas adalah inspection konsistensi model textual subset. Render valid tidak menjalankan semantik atau menjamin safety perangkat fisik. Peringatan sumber MBSE tidak hilang karena diagram berhasil dibuat.

Fault ownership: VehicleDetection melatch dataFault pada invalid/stale dan menghapusnya setelah tiga frame baru baik; TrafficController menahan mode Fallback hingga round boundary. Observation tick mengevaluasi cache meskipun tidak ada sample event.
