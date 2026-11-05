package StlContext {
    doc /* IBD - konteks BLK-01 SmartTrafficLightSystem: part usage, port, connector C01..C06
           dan item flow. Panah flow = arah item, bukan dependency satisfy. */

    private import StlTypes::*;
    private import StlStructure::*;

    part trafficDataSource : TrafficDataSource;
    part roadUsers : RoadUsers;

    part smartTrafficLight : SmartTrafficLightSystem {

        // C00: batas lingkungan - count disediakan eksternal (bukan perangkat deteksi fisik)

        interface c01 : SamplesInterface
            connect supplier ::> sensor.samplesOut to consumer ::> densityAnalysis.samplesIn;       // CountsFrame

        interface c02 : DensityInterface
            connect supplier ::> densityAnalysis.densityOut to consumer ::> controller.densityIn;   // DensityFrame

        interface c03 : StatusInterface
            connect supplier ::> sensor.statusOut to consumer ::> controller.statusIn;              // dataFault, streak

        interface c04 : CommandInterface
            connect supplier ::> controller.commandOut to consumer ::> signals.commandIn;           // PhaseCommand

        interface c05 : BoundaryInterface
            connect supplier ::> signals.boundaryOut to consumer ::> controller.boundaryIn;         // BoundaryEvent

        // C06: LampVector di-fan-out ke empat lampu; tiap lampu mengambil entry approach-nya
        interface c06N : LampsInterface
            connect supplier ::> signals.lampsOut to consumer ::> lightNorth.lampsIn;
        interface c06S : LampsInterface
            connect supplier ::> signals.lampsOut to consumer ::> lightSouth.lampsIn;
        interface c06E : LampsInterface
            connect supplier ::> signals.lampsOut to consumer ::> lightEast.lampsIn;
        interface c06W : LampsInterface
            connect supplier ::> signals.lampsOut to consumer ::> lightWest.lampsIn;
    }
}
