package StlRequirements {
    doc /* Katalog 24 requirement baseline (3 November 2026) sebagai SysML v2 requirement usage.
           Statement lengkap = sumber requirement; angka adalah asumsi desain ASM-*.
           Subject mengikuti part pada ibd.puml. */

    private import StlStructure::*;

    // ================================================================ Functional
    requirement <'REQ-F-001'> reqClassification {
        doc /* DensityAnalysis harus memetakan count valid ke LOW (0..5), MEDIUM (6..15), atau HIGH (>=16).
               Source: EVID-TRF-006, ASM-003. Verification: Test; VER-01. */
        subject densityAnalysis : DensityAnalysis;
    }
    requirement <'REQ-F-002'> reqEligibility {
        doc /* TrafficController harus mengeluarkan pendekat dari eligible setelah grant green hingga round berikutnya.
               Source: ASM-004. Verification: Analysis; VER-02. */
        subject controller : TrafficController;
    }
    requirement <'REQ-F-003'> reqPriority {
        doc /* TrafficController harus memilih eligible menurut kategori menurun, waktu tunggu menurun,
               lalu jarak ring dari pointer bila deadline nominal masih layak.
               Source: EVID-TRF-001, ASM-004. Verification: Test; VER-03. */
        subject controller : TrafficController;
    }
    requirement <'REQ-F-004'> reqGrantGreen {
        doc /* TrafficController harus mengunci grant 10/20/30 s untuk LOW/MEDIUM/HIGH hingga green berakhir pada mode Normal.
               Source: EVID-TRF-001, ASM-005, ASM-006. Verification: Test; VER-04. */
        subject controller : TrafficController;
    }
    requirement <'REQ-F-005'> reqWaitTimer {
        doc /* TrafficController harus mengukur wait sejak green terakhir berakhir, nol selama green dan
               sejak startup untuk pendekat belum dilayani.
               Source: ASM-004. Verification: Test; VER-05. */
        subject controller : TrafficController;
    }

    // ================================================================ Performance
    requirement <'REQ-P-001'> reqObservation {
        doc /* VehicleDetection harus menerima frame nominal lengkap pada cadence 1 s di model.
               Source: ASM-002, ASM-006. Verification: Test; VER-06. */
        subject sensor : VehicleDetection;
    }
    requirement <'REQ-P-002'> reqDecisionBoundary {
        doc /* TrafficController harus menerbitkan grant berikutnya hanya pada tick 1 s di akhir all-red.
               Source: ASM-006. Verification: Analysis; VER-07. */
        subject controller : TrafficController;
    }
    requirement <'REQ-P-003'> reqMinimumGreen {
        doc /* SignalController harus mempertahankan green yang diterima sekurang-kurangnya 10 s kecuali masuk SafetyHold.
               Source: ASM-005, ASM-008. Verification: Test; VER-08. */
        subject signals : SignalController;
    }
    requirement <'REQ-P-004'> reqMaximumGreen {
        doc /* SignalController harus mengakhiri setiap grant green paling lambat 30 s setelah grant dimulai.
               Source: ASM-005. Verification: Analysis; VER-08. */
        subject signals : SignalController;
    }
    requirement <'REQ-P-005'> reqMaximumWaiting {
        doc /* TrafficController harus menjadwalkan setiap pendekat kembali green dalam 210 s sejak green
               sebelumnya berakhir pada operasi round baseline tanpa SafetyHold/restart.
               Source: ASM-004, ASM-005, ASM-008. Verification: Analysis; VER-09. */
        subject controller : TrafficController;
    }

    // ================================================================ Safety
    requirement <'REQ-S-001'> reqExclusivity {
        doc /* SignalController harus menghasilkan paling banyak satu pendekat green pada setiap state model.
               Source: EVID-TRF-002, ASM-001, ASM-008. Verification: Analysis; VER-10. */
        subject signals : SignalController;
    }
    requirement <'REQ-S-002'> reqYellow {
        doc /* SignalController harus menjalankan yellow 3 s pada pendekat aktif sebelum clearance all-red
               setelah grant normal berakhir. Source: ASM-008. Verification: Test; VER-11. */
        subject signals : SignalController;
    }
    requirement <'REQ-S-003'> reqAllRed {
        doc /* SignalController harus mempertahankan semua pendekat merah selama 1 s pada startup dan setiap
               clearance sebelum green berikutnya. Source: ASM-008. Verification: Test; VER-11. */
        subject signals : SignalController;
    }
    requirement <'REQ-S-004'> reqCommandRejection {
        doc /* SignalController harus masuk SafetyHold all-red bila menerima command di luar domain atau
               command green yang melompati clearance. Source: ASM-008. Verification: Test; VER-12. */
        subject signals : SignalController;
    }
    requirement <'REQ-S-005'> reqDeadlinePrecedence {
        doc /* TrafficController harus mengganti urutan nominal dengan earliest-deadline-first jika proyeksi
               sisa round nominal melampaui deadline 210 s. Source: ASM-004, ASM-005. Verification: Test; VER-13. */
        subject controller : TrafficController;
    }
    requirement <'REQ-S-006'> reqInfeasiblePlan {
        doc /* TrafficController harus meminta SafetyHold bila urutan earliest-deadline-first juga tidak
               memenuhi deadline. Source: ASM-004, ASM-008. Verification: Test; VER-13. */
        subject controller : TrafficController;
    }

    // ================================================================ Interface
    requirement <'REQ-I-001'> reqInputFrame {
        doc /* VehicleDetection harus memvalidasi CountsFrame sesuai domain field, empat ID unik dan aturan
               timestamp pada kontrak operasi. Source: ASM-002, ASM-006. Verification: Test; VER-14. */
        subject sensor : VehicleDetection;
    }
    requirement <'REQ-I-002'> reqOutputLamps {
        doc /* TrafficLights harus menerima LampVector empat indikasi yang masing-masing bernilai Red, Yellow
               atau Green dari SignalController. Source: EVID-TRF-002, ASM-008. Verification: Inspection; VER-15. */
        subject lights : TrafficLights[4];
    }

    // ================================================================ Reliability / failure handling
    requirement <'REQ-R-001'> reqDataFaultDetection {
        doc /* VehicleDetection harus melatch dataFault ketika frame invalid, valid=false, cache tidak lengkap
               atau umur cached sample lebih dari 3 s. Source: ASM-006, ASM-007. Verification: Test; VER-16. */
        subject sensor : VehicleDetection;
    }
    requirement <'REQ-R-002'> reqFallbackEntry {
        doc /* TrafficController harus memakai Fallback pada boundary aman berikutnya setelah dataFault dilatch
               tanpa mengubah grant aktif. Source: ASM-007. Verification: Test; VER-17. */
        subject controller : TrafficController;
    }
    requirement <'REQ-R-003'> reqFallbackTiming {
        doc /* TrafficController harus melayani eligible dalam urutan ring dengan green 10 s pada Fallback.
               Source: ASM-007. Verification: Test; VER-18. */
        subject controller : TrafficController;
    }
    requirement <'REQ-R-004'> reqRecovery {
        doc /* TrafficController harus kembali Normal hanya pada awal round setelah tiga frame lengkap
               fresh/valid dengan timestamp baru berturut-turut di tick berbeda.
               Source: ASM-007. Verification: Test; VER-19. */
        subject controller : TrafficController;
    }

    // ================================================================ Design constraint
    requirement <'REQ-D-001'> reqScope {
        doc /* Model harus membatasi operasi pada empat pendekat lurus tanpa pedestrian, dedicated turn,
               emergency atau ML. Source: ASM-001, ASM-009. Verification: Inspection; VER-20. */
        subject stl : SmartTrafficLightSystem;
    }
    requirement <'REQ-D-002'> reqSysml {
        doc /* Model harus mempertahankan identitas dan semantik subset SysML dalam tujuh view dan pemetaan
               renderer yang terdokumentasi. Source: EVID-LEC-001..004, ASM-010. Verification: Inspection; VER-21. */
        subject stl : SmartTrafficLightSystem;
    }
}
