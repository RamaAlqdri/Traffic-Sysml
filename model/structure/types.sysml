package StlTypes {
    doc /* Kamus tipe nilai, item, antarmuka (InterfaceBlock) dan parameter baseline
           Smart Traffic Light. Seluruh angka adalah asumsi desain konseptual ASM-*,
           bukan temuan jurnal. Rujukan: model/traceability/traceability-matrix.md. */

    private import ScalarValues::*;
    private import ISQ::*;
    private import SI::*;

    // ---------------------------------------------------------------- enumerasi
    enum def Approach { enum North; enum South; enum East; enum West; }
    enum def SignalColor { enum Red; enum Yellow; enum Green; }
    enum def ControlMode { enum Normal; enum Fallback; }
    enum def DensityCategory { enum LOW; enum MEDIUM; enum HIGH; }
    enum def CommandKind { enum Grant; enum Hold; }
    enum def BoundaryKind { enum SafeBoundary; enum GrantAccepted; }

    // ---------------------------------------------------------------- record
    attribute def ApproachCount {
        doc /* Satu record count per pendekat (ASM-002). */
        attribute approach : Approach;
        attribute vehicleCount : Natural;
        attribute observedAt : DurationValue;
        attribute valid : Boolean;
    }
    attribute def ApproachDensity {
        attribute approach : Approach;
        attribute category : DensityCategory;
    }
    attribute def ApproachLamp {
        attribute approach : Approach;
        attribute color : SignalColor;
    }

    // ---------------------------------------------------------------- item (flow)
    item def CountsFrame {
        doc /* Empat record dengan ID pendekat unik (REQ-I-001). */
        attribute records : ApproachCount[4];
    }
    item def DensityFrame {
        doc /* Kategori LOW/MEDIUM/HIGH per pendekat; hanya dari frame valid. */
        attribute levels : ApproachDensity[4];
    }
    item def FaultStatus {
        attribute dataFault : Boolean;
        attribute recoveryStreak : Natural;   // 0..3
    }
    item def PhaseCommand {
        doc /* Grant: approach, greenSeconds 10..30, mode. Hold: tanpa green grant. */
        attribute kind : CommandKind;
        attribute approach : Approach[0..1];
        attribute greenSeconds : Natural[0..1];
        attribute mode : ControlMode[0..1];
    }
    item def BoundaryEvent {
        attribute kind : BoundaryKind;
        attribute timestamp : DurationValue;
        attribute completedApproach : Approach[0..1];
        attribute acceptedApproach : Approach[0..1];
    }
    item def LampVector {
        doc /* Tepat empat pasangan approach/color. */
        attribute lamps : ApproachLamp[4];
    }

    // ---------------------------------------------------------------- interface block
    port def SamplesIF  { out item counts : CountsFrame; }
    port def DensityIF  { out item density : DensityFrame; }
    port def StatusIF   { out item status : FaultStatus; }
    port def CommandIF  { out item command : PhaseCommand; }
    port def BoundaryIF { out item boundary : BoundaryEvent; }
    port def LampsIF    { out item lamps : LampVector; }

    // ---------------------------------------------------------------- parameter baseline (ASM-003..008)
    attribute minimumGreen        : DurationValue = 10 [s];   // ASM-005
    attribute maximumGreen        : DurationValue = 30 [s];   // ASM-005
    attribute maximumWaitingTime  : DurationValue = 210 [s];  // ASM-004/005
    attribute observationInterval : DurationValue = 1 [s];    // ASM-006
    attribute staleThreshold      : DurationValue = 3 [s];    // ASM-006 (umur > 3 s = stale)
    attribute yellowDuration      : DurationValue = 3 [s];    // ASM-008
    attribute allRedDuration      : DurationValue = 1 [s];    // ASM-008
    attribute fallbackGreen       : DurationValue = 10 [s];   // ASM-007
    attribute greenLow            : DurationValue = 10 [s];   // ASM-005
    attribute greenMedium         : DurationValue = 20 [s];   // ASM-005
    attribute greenHigh           : DurationValue = 30 [s];   // ASM-005
    attribute lowUpperBound       : Natural = 5;              // ASM-003: LOW 0..5
    attribute mediumUpperBound    : Natural = 15;             // ASM-003: MEDIUM 6..15, HIGH >= 16
    attribute recoveryFrames      : Natural = 3;              // ASM-007
}
