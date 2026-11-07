package StlUseCases {
    doc /* Use case view SmartTrafficLightSystem (BLK-01). UC-01..04, sesuai use-case.puml.
           TrafficDataSource dan RoadUsers adalah aktor eksternal; komponen internal bukan aktor. */

    private import StlStructure::*;

    use case def <'UC-01'> ObserveTraffic {
        doc /* Count masuk dari luar; VehicleDetection berada di dalam sistem. Asinkron: bukan include wajib. */
        subject stl : SmartTrafficLightSystem;
        actor trafficDataSource : TrafficDataSource;
    }

    use case def <'UC-03'> MaintainSafeSignals {
        doc /* Eksklusivitas green, yellow 3 s, all-red 1 s, command rejection. */
        subject stl : SmartTrafficLightSystem;
    }

    use case def <'UC-02'> ServeApproach {
        doc /* Pilih dan layani pendekat sekali per round; «include» UC-03. */
        subject stl : SmartTrafficLightSystem;
        actor roadUsers : RoadUsers;
        include use case maintainSafeSignals : MaintainSafeSignals;
    }

    use case def <'UC-04'> HandleDataFailure {
        doc /* «extend» UC-02 dengan guard [dataFault]. Fallback mempertahankan grant aktif,
               clearance, eligible set dan wait timer. SysML v2 tidak punya relasi extend
               khusus, sehingga dinyatakan sebagai dependency di bawah. */
        subject stl : SmartTrafficLightSystem;
    }

    dependency ExtendServeApproach from HandleDataFailure to ServeApproach;
}
