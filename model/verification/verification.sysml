package StlVerification {
    doc /* 21 verification case (VER-01..21). Semua berstatus not-run pada definisi; status pelaksanaan
           hanya pada model/verification/verification-results.md. Ini analisis/walkthrough konseptual,
           bukan pengujian perangkat nyata. */

    private import StlStructure::*;
    private import StlRequirements::*;

    verification def <'VER-01'> BoundaryKategori {
        doc /* count 0,5,6,15,16 -> LOW,LOW,MEDIUM,MEDIUM,HIGH. Method: analysis. */
        subject densityAnalysis : DensityAnalysis;
        objective { verify reqClassification; }
    }
    verification def <'VER-02'> SekaliPerRound {
        doc /* Setelah grant N, N tidak eligible hingga round berikut. Method: walkthrough. */
        subject controller : TrafficController;
        objective { verify reqEligibility; }
    }
    verification def <'VER-03'> TieDanRing {
        doc /* Kategori dan wait sama, pointer E -> E terpilih. Method: analysis. */
        subject controller : TrafficController;
        objective { verify reqPriority; }
    }
    verification def <'VER-04'> GrantDibekukan {
        doc /* N LOW green10 t=1; sampel HIGH di t=2 tidak mengubah akhir green t=11. Method: walkthrough. */
        subject controller : TrafficController;
        objective { verify reqGrantGreen; }
    }
    verification def <'VER-05'> WaitTimer {
        doc /* Green N berakhir t=11; wait pada t=15 adalah 4 s; nol saat green. Method: walkthrough. */
        subject controller : TrafficController;
        objective { verify reqWaitTimer; }
    }
    verification def <'VER-06'> Cadence {
        doc /* Satu frame lengkap per tick 1 s. Method: walkthrough. */
        subject sensor : VehicleDetection;
        objective { verify reqObservation; }
    }
    verification def <'VER-07'> BoundaryKeputusan {
        doc /* Tidak ada grant baru sebelum akhir all-red (t=15); semua boundary integer. Method: walkthrough. */
        subject controller : TrafficController;
        objective { verify reqDecisionBoundary; }
    }
    verification def <'VER-08'> BatasGreen {
        doc /* Grant dalam [10,30]; Fallback 10; SafetyHold adalah pengecualian. Method: analysis/inspection. */
        subject signals : SignalController;
        objective {
            verify reqMinimumGreen;
            verify reqMaximumGreen;
        }
    }
    verification def <'VER-09'> BoundDuaRound {
        doc /* 24 permutasi x 24 permutasi (576 pasangan): wait maks 208 s <= 210 s. Method: exhaustive analysis. */
        subject controller : TrafficController;
        objective { verify reqMaximumWaiting; }
    }
    verification def <'VER-10'> ConflictingGreen {
        doc /* Enumerasi state output: tidak pernah lebih dari satu Green. Method: analysis. */
        subject signals : SignalController;
        objective { verify reqExclusivity; }
    }
    verification def <'VER-11'> Clearance {
        doc /* Yellow 3 s lalu all-red 1 s sebelum green berikutnya; startup all-red 1 s. Method: walkthrough. */
        subject signals : SignalController;
        objective {
            verify reqYellow;
            verify reqAllRed;
        }
    }
    verification def <'VER-12'> CommandUnsafe {
        doc /* Command melompati clearance atau greenSeconds=31 -> SafetyHold all-red. Method: inspection/walkthrough. */
        subject signals : SignalController;
        objective { verify reqCommandRejection; }
    }
    verification def <'VER-13'> DeadlinePrecedence {
        doc /* N HIGH wait0, S LOW wait200: nominal membuat S mulai 234 s > 210 s; EDF memilih S;
               bila semua urutan melewati deadline -> SafetyHold. Method: analysis/walkthrough. */
        subject controller : TrafficController;
        objective {
            verify reqDeadlinePrecedence;
            verify reqInfeasiblePlan;
        }
    }
    verification def <'VER-14'> DomainInput {
        doc /* Count bool/negatif/NaN, ID duplikat, timestamp future/mundur ditolak; count valid termasuk 0 diterima. Method: analysis. */
        subject sensor : VehicleDetection;
        objective { verify reqInputFrame; }
    }
    verification def <'VER-15'> InterfaceOutput {
        doc /* Telusuri C06 dan approach tiap lampu: empat lampu mengambil entry masing-masing. Method: inspection. */
        subject light : TrafficLights;
        objective { verify reqOutputLamps; }
    }
    verification def <'VER-16'> StaleFault {
        doc /* Umur 3 s masih fresh; umur 4 s stale dan fault latch; cache awal hilang -> Fallback. Method: analysis + walkthrough. */
        subject sensor : VehicleDetection;
        objective { verify reqDataFaultDetection; }
    }
    verification def <'VER-17'> FaultSaatGreen {
        doc /* Fault di t=5 saat N green 1..31: N tetap berakhir 31, yellow, all-red, Fallback 10 s mulai 35. Method: walkthrough. */
        subject controller : TrafficController;
        objective { verify reqFallbackEntry; }
    }
    verification def <'VER-18'> FallbackRing {
        doc /* Eligible S/E/W pointer S: S,E,W masing-masing 10 s + clearance 4 s; N tidak diulang. Method: walkthrough. */
        subject controller : TrafficController;
        objective { verify reqFallbackTiming; }
    }
    verification def <'VER-19'> RecoveryStreak {
        doc /* Streak reset oleh frame invalid; siap pulih pada frame baik ke-3; Normal hanya di round baru;
               retransmisi timestamp sama tidak menaikkan streak. Method: walkthrough. */
        subject controller : TrafficController;
        objective { verify reqRecovery; }
    }
    verification def <'VER-20'> ScopeCheck {
        doc /* Tidak ada pedestrian/turn/emergency/CNN/dashboard pada seluruh view. Method: inspection. */
        subject stl : SmartTrafficLightSystem;
        objective { verify reqScope; }
    }
    verification def <'VER-21'> SysmlSemantics {
        doc /* Pemetaan elemen, ownership, tipe part, jenis/arah relasi konsisten lintas view. Method: inspection. */
        subject stl : SmartTrafficLightSystem;
        objective { verify reqSysml; }
    }
}
