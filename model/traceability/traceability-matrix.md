# Traceability dan pemetaan SysML

Baseline model: subset SysML 1.6. Ketujuh diagram adalah view dari model yang sama. Semantik ditinjau terhadap catatan kuliah dan OMG SysML 1.6 §8 (Blocks), §9 (Ports and Flows), §15.3.1.2 (Allocate), §16.3.2.7 (Satisfy), §16.3.2.9 (Verify). Spesifikasi resmi: https://www.omg.org/spec/SysML/1.6/PDF. Salinan sementara dipakai untuk pembacaan, tidak menggantikan sumber pengguna. Tidak ada klaim XMI interchange, pemeriksaan OCL lengkap, atau sertifikasi tool SysML.

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

Relasi formal: setiap baris menghasilkan dependency `block (client) --«satisfy»--> requirement (supplier)` dan `VER-* (client TestCase) --«verify»--> requirement (supplier)`. Penempatan merupakan klaim desain yang diperiksa, bukan bukti bahwa pengujian sudah passed. UC/action ke requirement dipakai sebagai trace pendukung; tidak semua hubungan trace adalah satisfy/deriveReqt. Sources mengarah ke evidence/asumsi, bukan requirement palsu yang diberi stereotype evidence.

## Pemetaan SysML

| ID / jenis | Owner/context | File/view dan notasi | Makna serta keterbatasan |
|---|---|---|---|
| REQ-* / Requirement | package Requirements | requirements.md; empat requirement inti pada requirements.mmd | statement lengkap ada di katalog; label Mermaid diringkas. Diagram merupakan partial view; seluruh 24 requirement tetap memiliki trace pada matrix |
| UC-01..04 / UseCase | BLK-01 | use-case.puml, oval dan system boundary | TrafficDataSource dan RoadUsers aktor eksternal; komponen internal bukan actor |
| ACT-00 / Activity | BLK-01 | activity.puml | event-driven ManageTraffic, allocation action ke block dinyatakan pada tabel dictionary |
| ACT-01..10 / Action | ACT-00 | activity.puml | ACT-01→BLK-02; ACT-02→BLK-03; ACT-03/04/07/08→BLK-04; ACT-05/06/09/10→BLK-05 adalah «allocate», arah action ke block |
| INT-01 / Interaction | BLK-01 | sequence.puml | lifeline sensor/analysis/controller/signals/lights mereferensikan part property dari IBD, bukan block baru |
| STM-01 / StateMachine | BLK-05 | state-machine.puml | Running memuat Startup/Ready/Green/Yellow/Clearance; SafetyHold di luar composite. Guard dan after adalah aturan model, bukan script eksekusi PlantUML |
| BLK-01..06 / Block | package Structure | bdd.puml, «block» | System, VehicleDetection, DensityAnalysis, TrafficController, SignalController, TrafficLights; diagram class PlantUML dipakai sebagai notasi block SysML |
| sensor/analysis/controller/signals/lights / PartProperty | BLK-01 | ibd.puml, rectangle berlabel role : Type | multiplicity 1/1/1/1/4 sesuai composition di BDD. «part» hanya anotasi renderer, bukan stereotype SysML tambahan |
| P01..12 / ProxyPort | part sesuai tabel endpoint | kotak kecil ber-ID P01..12 di IBD; tipe InterfaceBlock pada declaration BDD/dictionary | kotak port PlantUML tidak memiliki validasi SysML otomatis; ~ menunjukkan conjugation, bukan arah panah satisfy |
| C01..06 / assembly Connector + ItemFlow | BLK-01 | garis antar-port IBD berlabel flow | arah panah adalah flow item; connector sendiri bukan dependency. Semua endpoint tercantum di bawah |
| VER-01..21 / «testCase» Behavior | package Verification | verification-scenarios.md; VER-09 juga di Mermaid | output konseptual VerdictKind passed/failed/inconclusive; exit code checker dipetakan ke verdict untuk analisis yang dijalankan saja |

## Dictionary interface/value types

| Tipe | Isi / constraint |
|---|---|
| Approach | enumeration North, South, East, West; ring N/S/E/W |
| SignalColor | enumeration Red, Yellow, Green |
| ControlMode | enumeration Normal, Fallback; SafetyHold adalah state lifecycle sinyal, bukan mode adaptive |
| CountsFrame | empat record {approach:Approach, vehicleCount:Integer, observedAt:Real[s], valid:Boolean}; domain/timestamp sesuai kontrak operasi |
| DensityFrame | kategori LOW/MEDIUM/HIGH per pendekat; hanya dari frame yang lolos validasi |
| PhaseCommand | discriminated command kind Grant atau Hold. Grant memiliki approach, greenSeconds 10..30 integer, mode; Hold tidak memiliki green grant. Restart merupakan lifecycle event terpisah |
| BoundaryEvent | kind: SafeBoundary atau GrantAccepted, timestamp; completedApproach opsional pada SafeBoundary, acceptedApproach pada GrantAccepted. SafeBoundary dipancarkan setelah startup/clearance; grantAccepted(i) pada sequence/STM adalah payload GrantAccepted di channel C05 yang sama |
| LampVector | tepat empat pasangan approach/color; setiap lights[k] mengambil entry approach miliknya |
| SamplesIF, DensityIF | interfaceBlock dengan flow property out frame:CountsFrame / out density:DensityFrame |
| StatusIF | interfaceBlock dengan flow properties out dataFault:Boolean dan out recoveryStreak:Integer 0..3 |
| CommandIF, BoundaryIF, LampsIF | interfaceBlock dengan flow property out command:PhaseCommand / out boundary:BoundaryEvent / out lamps:LampVector |

Port penerima menggunakan conjugated InterfaceBlock (~); arah flow property dibalik, tipe item tetap sama. Antarmuka lingkungan ke adapter sensor dimodelkan sebagai boundary input count yang sudah disediakan, bukan assembly connector internal atau perangkat pendeteksi fisik.

## Endpoint connector dan flow

| ID | Source port (owner/type) | Target port (owner/type) | Item |
|---|---|---|---|
| C01 | P01 sensor.samplesOut:SamplesIF | P03 analysis.samplesIn:~SamplesIF | CountsFrame |
| C02 | P04 analysis.densityOut:DensityIF | P05 controller.densityIn:~DensityIF | DensityFrame |
| C03 | P02 sensor.statusOut:StatusIF | P06 controller.statusIn:~StatusIF | dataFault, recoveryStreak |
| C04 | P07 controller.commandOut:CommandIF | P09 signals.commandIn:~CommandIF | PhaseCommand |
| C05 | P10 signals.boundaryOut:BoundaryIF | P08 controller.boundaryIn:~BoundaryIF | BoundaryEvent |
| C06 | P11 signals.lampsOut:LampsIF | P12 lights[k].lampsIn:~LampsIF, k=N/S/E/W | LampVector; representasi bundle fan-out ke empat port |

## QC semantik dan batas representasi

- «include» dari UC-02 ke UC-03; «extend» dari UC-04 ke UC-02 dengan guard dataFault. UC-01 tidak dibuat mandatory synchronous include karena input bersifat asynchronous.
- Allocation action→block, satisfy block→requirement, verify testCase→requirement; tidak ada deriveReqt yang diklaim karena katalog belum memakai dekomposisi formal kebutuhan induk.
- Type block didefinisikan sekali pada BDD; usage part direferensikan pada IBD dan lifeline sequence. Lights memiliki approach property berbeda untuk tiap instance.
- Mermaid `satisfies`/`verifies` dipetakan ke SysML «satisfy»/«verify». Risk/verifymethod adalah metadata requirement view; bukti keberhasilan ada pada verification-results, bukan label tersebut.
- Perubahan mode hanya diputuskan pada Ready; timer/clearance tetap milik STM-01 SignalController. ACT-06 merepresentasikan transisi yang enabled oleh event, bukan blocking delay setiap ada sample.
- Checklist di atas adalah inspection konsistensi model textual subset. Render valid tidak menjalankan semantik atau menjamin safety perangkat fisik. Peringatan sumber MBSE tidak hilang karena diagram berhasil dibuat.

Fault ownership: VehicleDetection melatch dataFault pada invalid/stale dan menghapusnya setelah tiga frame baru baik; TrafficController menahan mode Fallback hingga round boundary. Observation tick mengevaluasi cache meskipun tidak ada sample event.
