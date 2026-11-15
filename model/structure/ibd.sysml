package StlContext {
    doc /* IBD - konteks BLK-01 SmartTrafficLightSystem: part usage, port, connector C01..C06
           dan item flow. Panah flow = arah item, bukan dependency satisfy. */

    private import StlTypes::*;
    private import StlStructure::*;

    part trafficDataSource : TrafficDataSource;
    part roadUsers : RoadUsers;

    connection c00 connect trafficDataSource.countsOut to smartTrafficLight.sensor.countsIn;
        flow of CountsFrame from trafficDataSource.countsOut.counts to smartTrafficLight.sensor.countsIn.counts;

    part smartTrafficLight : SmartTrafficLightSystem {

        // C00: batas lingkungan - count disediakan eksternal (bukan perangkat deteksi fisik)

        connection c01 connect sensor.samplesOut to densityAnalysis.samplesIn;
        flow of CountsFrame from sensor.samplesOut.counts to densityAnalysis.samplesIn.counts;       // CountsFrame

        connection c02 connect densityAnalysis.densityOut to controller.densityIn;
        flow of DensityFrame from densityAnalysis.densityOut.density to controller.densityIn.density;   // DensityFrame

        connection c03 connect sensor.statusOut to controller.statusIn;
        flow of FaultStatus from sensor.statusOut.status to controller.statusIn.status;              // dataFault, streak

        connection c04 connect controller.commandOut to signals.commandIn;
        flow of PhaseCommand from controller.commandOut.command to signals.commandIn.command;           // PhaseCommand

        connection c05 connect signals.boundaryOut to controller.boundaryIn;
        flow of BoundaryEvent from signals.boundaryOut.boundary to controller.boundaryIn.boundary;         // BoundaryEvent

        // C06: LampVector di-fan-out ke empat lampu; tiap lampu mengambil entry approach-nya
        connection c06N connect signals.lampsOut to lightNorth.lampsIn;
        flow of LampVector from signals.lampsOut.lamps to lightNorth.lampsIn.lamps;
        connection c06S connect signals.lampsOut to lightSouth.lampsIn;
        flow of LampVector from signals.lampsOut.lamps to lightSouth.lampsIn.lamps;
        connection c06E connect signals.lampsOut to lightEast.lampsIn;
        flow of LampVector from signals.lampsOut.lamps to lightEast.lampsIn.lamps;
        connection c06W connect signals.lampsOut to lightWest.lampsIn;
        flow of LampVector from signals.lampsOut.lamps to lightWest.lampsIn.lamps;
    }
}
