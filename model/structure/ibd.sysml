package StlContext {
    doc /* IBD - konteks BLK-01 SmartTrafficLightSystem: part usage, port P01..P12, connector C01..C06
           dan item flow, sesuai ibd.puml. Panah flow = arah item, bukan dependency satisfy. */

    private import StlTypes::*;
    private import StlStructure::*;

    part trafficDataSource : TrafficDataSource;
    part roadUsers : RoadUsers;

    part smartTrafficLight : SmartTrafficLightSystem {

        // C00: batas lingkungan - count disediakan eksternal (bukan perangkat deteksi fisik)

        interface c01 : SamplesInterface
            connect supplier ::> sensor.samplesOut to consumer ::> densityAnalysis.samplesIn;              // P01 -> P03, CountsFrame

        interface c02 : DensityInterface
            connect supplier ::> densityAnalysis.densityOut to consumer ::> controller.densityIn;          // P04 -> P05, DensityFrame

        interface c03 : StatusInterface
            connect supplier ::> sensor.statusOut to consumer ::> controller.statusIn;              // P02 -> P06, dataFault, streak

        interface c04 : CommandInterface
            connect supplier ::> controller.commandOut to consumer ::> signals.commandIn;           // P07 -> P09, PhaseCommand

        interface c05 : BoundaryInterface
            connect supplier ::> signals.boundaryOut to consumer ::> controller.boundaryIn;         // P10 -> P08, BoundaryEvent

        // C06: LampVector di-fan-out ke empat lampu (lights[4]); lights[k] mengambil entry approach-nya
        interface c06 : LampsInterface
            connect supplier ::> signals.lampsOut to consumer ::> lights.lampsIn;                   // P11 -> P12, LampVector
    }
}
