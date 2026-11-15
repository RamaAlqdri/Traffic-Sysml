package StlTypes {
    doc /* Kamus tipe nilai, item, antarmuka (InterfaceBlock) dan parameter baseline
           Smart Traffic Light. Seluruh angka adalah asumsi desain konseptual ASM-*,
           bukan temuan jurnal. Rujukan: model/traceability/traceability-matrix.md. */

    private import ScalarValues::*;
    private import ISQ::*;
    private import SI::*;

    // ---------------------------------------------------------------- enumerasi
    enum def Approach { doc /* Empat pendekat baseline, hanya gerak lurus. */ enum North; enum South; enum East; enum West; }
    enum def SignalColor { doc /* Indikasi lampu logis untuk setiap pendekat. */ enum Red; enum Yellow; enum Green; }
    enum def ControlMode { doc /* Mode scheduler; bukan region sinyal konkuren. */ enum Normal; enum Fallback; }
    enum def DensityCategory { doc /* Kategori proksi hitungan kendaraan ASM-003. */ enum LOW; enum MEDIUM; enum HIGH; }
    enum def CommandKind { doc /* Grant normal atau permintaan semua merah. */ enum Grant; enum Hold; }
    enum def BoundaryKind { doc /* Notifikasi boundary aman atau grant yang sudah diterima. */ enum SafeBoundary; enum GrantAccepted; }

    // ---------------------------------------------------------------- record
    attribute def ApproachCount {
        doc /* Satu record count per pendekat (ASM-002). */
        attribute approach : Approach;
        attribute vehicleCount : Natural;
        assert constraint countDomain { vehicleCount <= 2147483647 }
        attribute observedAt : DurationValue;
        attribute valid : Boolean;
    }
    attribute def ApproachDensity { doc /* Kategori hasil klasifikasi untuk satu pendekat. */
        attribute approach : Approach;
        attribute category : DensityCategory;
    }
    attribute def ApproachLamp { doc /* Warna lampu untuk satu pendekat. */
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
    item def FaultStatus { doc /* Latch dataFault dan jumlah frame baru baik berturut-turut. */
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
    item def BoundaryEvent { doc /* Notifikasi lifecycle dari signals ke controller. */
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
    port def SamplesIF  { doc /* Aliran CountsFrame. */ out item counts : CountsFrame; }
    port def DensityIF  { doc /* Aliran DensityFrame. */ out item density : DensityFrame; }
    port def StatusIF   { doc /* Aliran FaultStatus. */ out item status : FaultStatus; }
    port def CommandIF  { doc /* Aliran PhaseCommand. */ out item command : PhaseCommand; }
    port def BoundaryIF { doc /* Aliran BoundaryEvent. */ out item boundary : BoundaryEvent; }
    port def LampsIF    { doc /* Aliran LampVector. */ out item lamps : LampVector; }

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
