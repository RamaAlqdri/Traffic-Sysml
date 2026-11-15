package StlInteraction {
    doc /* INT-01 - grant normal, data fault saat green, fallback dan pemulihan.
           Lifeline = part property dari IBD (StlContext), bukan block baru. */

    private import StlTypes::*;
    private import StlStructure::*;
    private import StlContext::*;

    occurrence def InteractionINT01 {
        doc /* Urutan pesan dinyatakan oleh succession antar-message. */

        ref part source : TrafficDataSource = trafficDataSource;
        ref part sensor : VehicleDetection = smartTrafficLight.sensor;
        ref part densityAnalysis : DensityAnalysis = smartTrafficLight.densityAnalysis;
        ref part controller : TrafficController = smartTrafficLight.controller;
        ref part signals : SignalController = smartTrafficLight.signals;
        ref part lightNorth : TrafficLights = smartTrafficLight.lightNorth;

        // --- grant normal
        message m01 of CountsFrame from source to sensor;               // tiap 1 s
        message m02 of CountsFrame from sensor to densityAnalysis;      // frame tervalidasi
        message m03 of DensityFrame from densityAnalysis to controller;
        message m04 of FaultStatus from sensor to controller;           // dataFault + recoveryStreak
        message m05 of BoundaryEvent from signals to controller;        // safeBoundary (startup/clearance selesai)
        message m06 of PhaseCommand from controller to signals;         // Grant(approach, greenSeconds, mode)
        message m07 of LampVector from signals to lightNorth;           // satu green, lainnya red
        message m08 of BoundaryEvent from signals to controller;        // ACT-08: tandai served

        // --- fault saat green: grant aktif dibekukan
        message m09 of CountsFrame from source to sensor;               // invalid/stale
        message m10 of FaultStatus from sensor to controller;           // latch dataFault
        message m11 of LampVector from signals to lightNorth;           // yellow 3 s
        message m12 of LampVector from signals to lightNorth;           // all-red 1 s
        message m13 of BoundaryEvent from signals to controller;        // safeBoundary
        message m14 of PhaseCommand from controller to signals;         // Fallback grant 10 s
        message m15 of LampVector from signals to lightNorth;

        // --- pemulihan: tiga frame baru valid pada tick berbeda
        message m16 of CountsFrame from source to sensor;
        message m17 of FaultStatus from sensor to controller;           // frame baik pertama; belum clear

        message m18 of CountsFrame from source to sensor;
        message m19 of FaultStatus from sensor to controller;
        message m20 of CountsFrame from source to sensor;
        message m21 of FaultStatus from sensor to controller; // frame baik ketiga; clear; Normal hanya di round baru

        first m17 then m18;
        first m18 then m19;
        first m19 then m20;
        first m20 then m21;
        first m01 then m02;
        first m02 then m03;
        first m03 then m04;
        first m04 then m05;
        first m05 then m06;
        first m06 then m07;
        first m07 then m08;
        first m08 then m09;
        first m09 then m10;
        first m10 then m11;
        first m11 then m12;
        first m12 then m13;
        first m13 then m14;
        first m14 then m15;
        first m15 then m16;
        first m16 then m17;
    }
}
