package StlStructure {
    doc /* BDD - definisi block BLK-01..06 dan komposisi (SysML v2 part def).
           Tipe nilai/antarmuka ada di StlTypes; lifecycle STM-01 di StlStateMachine. */

    private import ScalarValues::*;
    private import ISQ::*;
    private import SI::*;
    private import StlTypes::*;
    private import StlStateMachine::*;

    part def VehicleDetection {
        doc /* BLK-02. Adapter masukan count; memvalidasi frame dan melatch dataFault. */
        port countsIn : ~SamplesIF;
        port samplesOut : SamplesIF;
        port statusOut : StatusIF;
        attribute observationInterval : DurationValue = StlTypes::observationInterval;
        attribute staleThreshold : DurationValue = StlTypes::staleThreshold;
    }

    part def DensityAnalysis {
        doc /* BLK-03. Memetakan count valid ke LOW/MEDIUM/HIGH. */
        port samplesIn : ~SamplesIF;
        port densityOut : DensityIF;
        attribute lowUpperBound : Natural = StlTypes::lowUpperBound;
        attribute mediumUpperBound : Natural = StlTypes::mediumUpperBound;
    }

    part def TrafficController {
        doc /* BLK-04. Eligibility, prioritas, deadline, grant, mode Normal/Fallback. */
        port densityIn : ~DensityIF;
        port statusIn : ~StatusIF;
        port boundaryIn : ~BoundaryIF;
        port commandOut : CommandIF;
        attribute eligible : Approach[0..4];
        attribute mode : ControlMode;
        attribute minimumGreen : DurationValue = StlTypes::minimumGreen;
        attribute maximumGreen : DurationValue = StlTypes::maximumGreen;
        attribute maximumWaitingTime : DurationValue = StlTypes::maximumWaitingTime;
        attribute fallbackGreen : DurationValue = StlTypes::fallbackGreen;
    }

    part def SignalController {
        doc /* BLK-05. Pemilik STM-01; satu-satunya penghasil LampVector. */
        port commandIn : ~CommandIF;
        port boundaryOut : BoundaryIF;
        port lampsOut : LampsIF;
        exhibit state lifecycle : SignalLifecycle;
        attribute yellowDuration : DurationValue = StlTypes::yellowDuration;
        attribute allRedDuration : DurationValue = StlTypes::allRedDuration;
    }

    part def TrafficLights {
        doc /* BLK-06. Satu lampu logis per pendekat (aktuator ideal). */
        port lampsIn : ~LampsIF;
        attribute approach : Approach;
    }

    part def SmartTrafficLightSystem {
        doc /* BLK-01. System of Interest: satu simpang empat pendekat. */
        part sensor : VehicleDetection[1];
        part densityAnalysis : DensityAnalysis[1];
        part controller : TrafficController[1];
        part signals : SignalController[1];
        part lightNorth : TrafficLights[1] { attribute :>> approach = Approach::North; }
        part lightSouth : TrafficLights[1] { attribute :>> approach = Approach::South; }
        part lightEast  : TrafficLights[1] { attribute :>> approach = Approach::East; }
        part lightWest  : TrafficLights[1] { attribute :>> approach = Approach::West; }
    }

    // Aktor eksternal (di luar batas sistem)
    part def TrafficDataSource {
        doc /* Pemberi count terobservasi; berada di lingkungan, bukan komponen sistem. */
        port countsOut : SamplesIF;
    }
    part def RoadUsers {
        doc /* Pengguna jalan; menerima layanan fase dari sistem. */
    }

    // Definisi antarmuka antar-port (connector + item flow)
    interface def SamplesInterface {
        doc /* Connector bertipe untuk aliran CountsFrame. */
        end supplier : SamplesIF;
        end consumer : ~SamplesIF;
        flow of CountsFrame from supplier.counts to consumer.counts;
    }
    interface def DensityInterface {
        doc /* Connector bertipe untuk aliran DensityFrame. */
        end supplier : DensityIF;
        end consumer : ~DensityIF;
        flow of DensityFrame from supplier.density to consumer.density;
    }
    interface def StatusInterface {
        doc /* Connector bertipe untuk aliran FaultStatus. */
        end supplier : StatusIF;
        end consumer : ~StatusIF;
        flow of FaultStatus from supplier.status to consumer.status;
    }
    interface def CommandInterface {
        doc /* Connector bertipe untuk aliran PhaseCommand. */
        end supplier : CommandIF;
        end consumer : ~CommandIF;
        flow of PhaseCommand from supplier.command to consumer.command;
    }
    interface def BoundaryInterface {
        doc /* Connector bertipe untuk aliran BoundaryEvent. */
        end supplier : BoundaryIF;
        end consumer : ~BoundaryIF;
        flow of BoundaryEvent from supplier.boundary to consumer.boundary;
    }
    interface def LampsInterface {
        doc /* Connector bertipe untuk aliran LampVector. */
        end supplier : LampsIF;
        end consumer : ~LampsIF;
        flow of LampVector from supplier.lamps to consumer.lamps;
    }
}
