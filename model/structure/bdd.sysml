package StlStructure {
    doc /* BDD - definisi block BLK-01..06 dan komposisi (SysML v2 part def).
           Tipe nilai/antarmuka ada di StlTypes; lifecycle STM-01 di StlStateMachine. */

    private import ScalarValues::*;
    private import ISQ::*;
    private import SI::*;
    private import StlTypes::*;
    private import StlStateMachine::*;

    part def <'BLK-02'> VehicleDetection {
        doc /* BLK-02. Adapter masukan count; memvalidasi frame dan melatch dataFault. */
        port countsIn : ~SamplesIF;
        port samplesOut : SamplesIF;
        port statusOut : StatusIF;
        attribute observationInterval : DurationValue = StlTypes::observationInterval;
        attribute staleThreshold : DurationValue = StlTypes::staleThreshold;
    }

    part def <'BLK-03'> DensityAnalysis {
        doc /* BLK-03. Memetakan count valid ke LOW/MEDIUM/HIGH. */
        port samplesIn : ~SamplesIF;
        port densityOut : DensityIF;
        attribute lowUpperBound : Natural = StlTypes::lowUpperBound;
        attribute mediumUpperBound : Natural = StlTypes::mediumUpperBound;
    }

    part def <'BLK-04'> TrafficController {
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

    part def <'BLK-05'> SignalController {
        doc /* BLK-05. Pemilik STM-01; satu-satunya penghasil LampVector. */
        port commandIn : ~CommandIF;
        port boundaryOut : BoundaryIF;
        port lampsOut : LampsIF;
        exhibit state lifecycle : SignalLifecycle;
        attribute yellowDuration : DurationValue = StlTypes::yellowDuration;
        attribute allRedDuration : DurationValue = StlTypes::allRedDuration;
    }

    part def <'BLK-06'> TrafficLights {
        doc /* BLK-06. Satu lampu logis per pendekat (aktuator ideal). */
        port lampsIn : ~LampsIF;
        attribute approach : Approach;
    }

    part def <'BLK-01'> SmartTrafficLightSystem {
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
        doc /* C01: CountsFrame dari VehicleDetection (P01) ke DensityAnalysis (P03). */
        end supplier : SamplesIF;
        end consumer : ~SamplesIF;
        flow of CountsFrame from supplier.counts to consumer.counts;
    }
    interface def DensityInterface {
        doc /* C02: DensityFrame dari DensityAnalysis (P04) ke TrafficController (P05). */
        end supplier : DensityIF;
        end consumer : ~DensityIF;
        flow of DensityFrame from supplier.density to consumer.density;
    }
    interface def StatusInterface {
        doc /* C03: FaultStatus (dataFault, streak) dari VehicleDetection (P02) ke TrafficController (P06). */
        end supplier : StatusIF;
        end consumer : ~StatusIF;
        flow of FaultStatus from supplier.status to consumer.status;
    }
    interface def CommandInterface {
        doc /* C04: PhaseCommand dari TrafficController (P07) ke SignalController (P09). */
        end supplier : CommandIF;
        end consumer : ~CommandIF;
        flow of PhaseCommand from supplier.command to consumer.command;
    }
    interface def BoundaryInterface {
        doc /* C05: BoundaryEvent (SafeBoundary atau GrantAccepted) dari SignalController (P10) ke TrafficController (P08). */
        end supplier : BoundaryIF;
        end consumer : ~BoundaryIF;
        flow of BoundaryEvent from supplier.boundary to consumer.boundary;
    }
    interface def LampsInterface {
        doc /* C06: LampVector dari SignalController (P11) ke TrafficLights (P12); fan-out ke empat lampu. */
        end supplier : LampsIF;
        end consumer : ~LampsIF;
        flow of LampVector from supplier.lamps to consumer.lamps;
    }
}
