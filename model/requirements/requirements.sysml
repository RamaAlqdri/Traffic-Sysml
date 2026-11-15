package StlRequirements {
    doc /* Katalog 24 requirement baseline (3 November 2026) sebagai SysML v2 requirement usage.
           Statement lengkap = sumber requirement; angka adalah asumsi desain ASM-*. */

    private import StlStructure::*;

    // ================================================================ Functional
    requirement <'REQ-F-001'> reqClassification {
        doc /* Name: Klasifikasi
Type: Functional
Statement: DensityAnalysis harus memetakan count valid ke LOW (0..5), MEDIUM (6..15), atau HIGH (≥16).
Source: EVID-TRF-006, ASM-003
Rationale: Proksi count tanpa kapasitas lokasi.
Verification Method: Test; VER-01
Trace: UC-01 → ACT-02 → BLK-03 → VER-01 */
        subject densityAnalysis : DensityAnalysis;
    }
    requirement <'REQ-F-002'> reqEligibility {
        doc /* Name: Eligibility
Type: Functional
Statement: TrafficController harus mengeluarkan pendekat dari eligible setelah grant green hingga round berikutnya.
Source: ASM-004
Rationale: Satu pelayanan per pendekat per round.
Verification Method: Analysis; VER-02
Trace: UC-02 → ACT-08 → BLK-04 → VER-02 */
        subject controller : TrafficController;
    }
    requirement <'REQ-F-003'> reqPriority {
        doc /* Name: Prioritas
Type: Functional
Statement: TrafficController harus memilih eligible menurut kategori menurun, waktu tunggu menurun, lalu jarak ring dari pointer bila deadline nominal masih layak.
Source: EVID-TRF-001, ASM-004
Rationale: Adaptif dengan tie deterministik; bukan formula jurnal.
Verification Method: Test; VER-03
Trace: UC-02 → ACT-03 → BLK-04 → VER-03 */
        subject controller : TrafficController;
    }
    requirement <'REQ-F-004'> reqGrantGreen {
        doc /* Name: Grant green
Type: Functional
Statement: TrafficController harus mengunci grant 10/20/30 s untuk LOW/MEDIUM/HIGH hingga green berakhir pada mode Normal.
Source: EVID-TRF-001, ASM-005, ASM-006
Rationale: Kategori lebih tinggi mendapat grant lebih lama tanpa perubahan di tengah fase.
Verification Method: Test; VER-04
Trace: UC-02 → ACT-04 → BLK-04 → VER-04 */
        subject controller : TrafficController;
    }
    requirement <'REQ-F-005'> reqWaitTimer {
        doc /* Name: Timer tunggu
Type: Functional
Statement: TrafficController harus mengukur wait sejak green terakhir berakhir, nol selama green dan sejak startup untuk pendekat belum dilayani.
Source: ASM-004
Rationale: Definisi service wait tidak sama dengan delay individu.
Verification Method: Test; VER-05
Trace: UC-02 → ACT-03 → BLK-04 → VER-05 */
        subject controller : TrafficController;
    }

    // ================================================================ Performance
    requirement <'REQ-P-001'> reqObservation {
        doc /* Name: Observasi
Type: Performance
Statement: VehicleDetection harus menerima frame nominal lengkap pada cadence 1 s di model.
Source: ASM-002, ASM-006
Rationale: Jendela observasi dan sampling eksplisit.
Verification Method: Test; VER-06
Trace: UC-01 → ACT-01 → BLK-02 → VER-06 */
        subject sensor : VehicleDetection;
    }
    requirement <'REQ-P-002'> reqDecisionBoundary {
        doc /* Name: Boundary keputusan
Type: Performance
Statement: TrafficController harus menerbitkan grant berikutnya hanya pada tick 1 s di akhir all-red.
Source: ASM-006
Rationale: Semua durasi pada grid diskrit yang sama.
Verification Method: Analysis; VER-07
Trace: UC-02 → ACT-03 → BLK-04 → VER-07 */
        subject controller : TrafficController;
    }
    requirement <'REQ-P-003'> reqMinimumGreen {
        doc /* Name: Minimum green
Type: Performance
Statement: SignalController harus mempertahankan green yang diterima sekurang-kurangnya 10 s kecuali masuk SafetyHold.
Source: ASM-005, ASM-008
Rationale: Batas nominal dan pengecualian keselamatan eksplisit.
Verification Method: Test; VER-08
Trace: UC-03 → ACT-05 → BLK-05 → VER-08 */
        subject signals : SignalController;
    }
    requirement <'REQ-P-004'> reqMaximumGreen {
        doc /* Name: Maximum green
Type: Performance
Statement: SignalController harus mengakhiri setiap grant green paling lambat 30 s setelah grant dimulai.
Source: ASM-005
Rationale: Membatasi layanan tunggal.
Verification Method: Analysis; VER-08
Trace: UC-03 → ACT-05 → BLK-05 → VER-08 */
        subject signals : SignalController;
    }
    requirement <'REQ-P-005'> reqMaximumWaiting {
        doc /* Name: Maximum waiting
Type: Performance
Statement: TrafficController harus menjadwalkan setiap pendekat kembali green dalam 210 s sejak green sebelumnya berakhir pada operasi round baseline tanpa SafetyHold/restart.
Source: ASM-004, ASM-005, ASM-008
Rationale: Bound analitis nominal 208 s.
Verification Method: Analysis; VER-09
Trace: UC-02 → ACT-03 → BLK-04 → VER-09 */
        subject controller : TrafficController;
    }

    // ================================================================ Safety
    requirement <'REQ-S-001'> reqExclusivity {
        doc /* Name: Eksklusivitas
Type: Safety
Statement: SignalController harus menghasilkan paling banyak satu pendekat green pada setiap state model.
Source: EVID-TRF-002, ASM-001, ASM-008
Rationale: Matriks konflik konservatif.
Verification Method: Analysis; VER-10
Trace: UC-03 → ACT-05 → BLK-05 → VER-10 */
        subject signals : SignalController;
    }
    requirement <'REQ-S-002'> reqYellow {
        doc /* Name: Yellow
Type: Safety
Statement: SignalController harus menjalankan yellow 3 s pada pendekat aktif sebelum clearance all-red setelah grant normal berakhir.
Source: ASM-008
Rationale: Pemisahan transisi eksplisit; bukan waktu lokasi terkalibrasi.
Verification Method: Test; VER-11
Trace: UC-03 → ACT-06 → BLK-05 → VER-11 */
        subject signals : SignalController;
    }
    requirement <'REQ-S-003'> reqAllRed {
        doc /* Name: All-red
Type: Safety
Statement: SignalController harus mempertahankan semua pendekat merah selama 1 s pada startup dan setiap clearance sebelum green berikutnya.
Source: ASM-008
Rationale: Batas fase aman.
Verification Method: Test; VER-11
Trace: UC-03 → ACT-06 → BLK-05 → VER-11 */
        subject signals : SignalController;
    }
    requirement <'REQ-S-004'> reqCommandRejection {
        doc /* Name: Command rejection
Type: Safety
Statement: SignalController harus masuk SafetyHold all-red bila menerima command di luar domain atau command green yang melompati clearance.
Source: ASM-008
Rationale: Tidak mengeksekusi command yang melanggar invariant.
Verification Method: Test; VER-12
Trace: UC-03 → ACT-09 → BLK-05 → VER-12 */
        subject signals : SignalController;
    }
    requirement <'REQ-S-005'> reqDeadlinePrecedence {
        doc /* Name: Deadline precedence
Type: Safety
Statement: TrafficController harus mengganti urutan nominal dengan earliest-deadline-first jika proyeksi sisa round nominal melampaui deadline 210 s.
Source: ASM-004, ASM-005
Rationale: Fairness mendahului density pada boundary.
Verification Method: Test; VER-13
Trace: UC-02 → ACT-03 → BLK-04 → VER-13 */
        subject controller : TrafficController;
    }
    requirement <'REQ-S-006'> reqInfeasiblePlan {
        doc /* Name: Infeasible plan
Type: Safety
Statement: TrafficController harus meminta SafetyHold bila urutan earliest-deadline-first juga tidak memenuhi deadline.
Source: ASM-004, ASM-008
Rationale: Jangan menjanjikan bound saat keadaan tidak konsisten.
Verification Method: Test; VER-13
Trace: UC-03 → ACT-03 → BLK-04 → VER-13 */
        subject controller : TrafficController;
    }

    // ================================================================ Interface
    requirement <'REQ-I-001'> reqInputFrame {
        doc /* Name: Input frame
Type: Interface
Statement: VehicleDetection harus memvalidasi CountsFrame sesuai domain field, empat ID unik dan aturan timestamp pada kontrak operasi.
Source: ASM-002, ASM-006
Rationale: Input tervalidasi sebelum analisis.
Verification Method: Test; VER-14
Trace: UC-01 → ACT-01 → BLK-02 → VER-14 */
        subject sensor : VehicleDetection;
    }
    requirement <'REQ-I-002'> reqOutputLamps {
        doc /* Name: Output lampu
Type: Interface
Statement: TrafficLights harus menerima LampVector empat indikasi yang masing-masing bernilai Red, Yellow atau Green dari SignalController.
Source: EVID-TRF-002, ASM-008
Rationale: Kontrak output logis; actuator ideal.
Verification Method: Inspection; VER-15
Trace: UC-03 → ACT-05 → BLK-06 → VER-15 */
        subject light : TrafficLights;
    }

    // ================================================================ Reliability / failure handling
    requirement <'REQ-R-001'> reqDataFaultDetection {
        doc /* Name: Deteksi data fault
Type: Reliability/Failure Handling
Statement: VehicleDetection harus melatch dataFault ketika frame invalid, valid=false, cache tidak lengkap atau umur cached sample lebih dari 3 s.
Source: ASM-006, ASM-007
Rationale: Data rusak tidak diperlakukan sebagai count nol.
Verification Method: Test; VER-16
Trace: UC-04 → ACT-01 → BLK-02 → VER-16 */
        subject sensor : VehicleDetection;
    }
    requirement <'REQ-R-002'> reqFallbackEntry {
        doc /* Name: Masuk fallback
Type: Reliability/Failure Handling
Statement: TrafficController harus memakai Fallback pada boundary aman berikutnya setelah dataFault dilatch tanpa mengubah grant aktif.
Source: ASM-007
Rationale: Tidak memotong green oleh fault data.
Verification Method: Test; VER-17
Trace: UC-04 → ACT-07 → BLK-04 → VER-17 */
        subject controller : TrafficController;
    }
    requirement <'REQ-R-003'> reqFallbackTiming {
        doc /* Name: Fallback timing
Type: Reliability/Failure Handling
Statement: TrafficController harus melayani eligible dalam urutan ring dengan green 10 s pada Fallback.
Source: ASM-007
Rationale: Timing default deterministik; round tidak direset.
Verification Method: Test; VER-18
Trace: UC-04 → ACT-07 → BLK-04 → VER-18 */
        subject controller : TrafficController;
    }
    requirement <'REQ-R-004'> reqRecovery {
        doc /* Name: Pemulihan
Type: Reliability/Failure Handling
Statement: TrafficController harus kembali Normal hanya pada awal round setelah tiga frame lengkap fresh/valid dengan timestamp baru berturut-turut di tick berbeda.
Source: ASM-007
Rationale: Mencegah flapping dan pemulihan dari retransmisi yang sama.
Verification Method: Test; VER-19
Trace: UC-04 → ACT-07 → BLK-04 → VER-19 */
        subject controller : TrafficController;
    }

    // ================================================================ Design constraint
    requirement <'REQ-D-001'> reqScope {
        doc /* Name: Scope
Type: Design Constraint
Statement: Model harus membatasi operasi pada empat pendekat lurus tanpa pedestrian, dedicated turn, emergency atau ML.
Source: ASM-001, ASM-009
Rationale: Menjaga scope pengguna.
Verification Method: Inspection; VER-20
Trace: UC-02 → ACT-03 → BLK-01 → VER-20 */
        subject stl : SmartTrafficLightSystem;
    }
    requirement <'REQ-D-002'> reqSysml {
        doc /* Name: SysML
Type: Design Constraint
Statement: Model harus mempertahankan identitas dan semantik subset SysML 2.0 dalam tujuh view dan pemetaan renderer yang terdokumentasi.
Source: EVID-LEC-001, EVID-LEC-002, EVID-LEC-003, EVID-LEC-004, ASM-010
Rationale: Semantik tidak ditentukan tool rendering.
Verification Method: Inspection; VER-21
Trace: UC-02 → ACT-03 → BLK-01 → VER-21 */
        subject stl : SmartTrafficLightSystem;
    }
}
