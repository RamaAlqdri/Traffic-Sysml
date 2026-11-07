package StlTraceability {
    doc /* Relasi satisfy (part -> requirement) dan allocate (action -> part).
           Sesuai model/traceability/traceability-matrix.md. Satisfy adalah klaim desain,
           bukan bukti bahwa verifikasi sudah passed. Part mengikuti ibd.puml
           (lights = lights[4]; label diagram "analysis" = densityAnalysis). */

    private import StlContext::*;
    private import StlRequirements::*;
    private import StlActivity::*;

    // Instans perilaku ACT-00 untuk alokasi
    action manageTraffic : ManageTraffic;

    // ------------------------------------------------ allocate: action -> block (BLK)
    allocate manageTraffic.validateFrame to smartTrafficLight.sensor;            // ACT-01 -> BLK-02
    allocate manageTraffic.classify      to smartTrafficLight.densityAnalysis;   // ACT-02 -> BLK-03
    allocate manageTraffic.rank          to smartTrafficLight.controller;        // ACT-03 -> BLK-04
    allocate manageTraffic.prepare       to smartTrafficLight.controller;        // ACT-04 -> BLK-04
    allocate manageTraffic.advanceTimer  to smartTrafficLight.signals;           // ACT-05 -> BLK-05
    allocate manageTraffic.stmStep       to smartTrafficLight.signals;           // ACT-06 -> BLK-05
    allocate manageTraffic.selectMode    to smartTrafficLight.controller;        // ACT-07 -> BLK-04
    allocate manageTraffic.markServed    to smartTrafficLight.controller;        // ACT-08 -> BLK-04
    allocate manageTraffic.apply         to smartTrafficLight.signals;           // ACT-09 -> BLK-05
    allocate manageTraffic.startup       to smartTrafficLight.signals;           // ACT-10 -> BLK-05

    // ------------------------------------------------ satisfy: block -> requirement
    satisfy reqClassification      by smartTrafficLight.densityAnalysis;
    satisfy reqEligibility         by smartTrafficLight.controller;
    satisfy reqPriority            by smartTrafficLight.controller;
    satisfy reqGrantGreen          by smartTrafficLight.controller;
    satisfy reqWaitTimer           by smartTrafficLight.controller;
    satisfy reqObservation         by smartTrafficLight.sensor;
    satisfy reqDecisionBoundary    by smartTrafficLight.controller;
    satisfy reqMinimumGreen        by smartTrafficLight.signals;
    satisfy reqMaximumGreen        by smartTrafficLight.signals;
    satisfy reqMaximumWaiting      by smartTrafficLight.controller;
    satisfy reqExclusivity         by smartTrafficLight.signals;
    satisfy reqYellow              by smartTrafficLight.signals;
    satisfy reqAllRed              by smartTrafficLight.signals;
    satisfy reqCommandRejection    by smartTrafficLight.signals;
    satisfy reqDeadlinePrecedence  by smartTrafficLight.controller;
    satisfy reqInfeasiblePlan      by smartTrafficLight.controller;
    satisfy reqInputFrame          by smartTrafficLight.sensor;
    satisfy reqOutputLamps         by smartTrafficLight.lights;
    satisfy reqDataFaultDetection  by smartTrafficLight.sensor;
    satisfy reqFallbackEntry       by smartTrafficLight.controller;
    satisfy reqFallbackTiming      by smartTrafficLight.controller;
    satisfy reqRecovery            by smartTrafficLight.controller;
    satisfy reqScope               by smartTrafficLight;
    satisfy reqSysml               by smartTrafficLight;
}
