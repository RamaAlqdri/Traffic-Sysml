package StlTypes {
    doc /* Kamus tipe nilai, item, antarmuka (InterfaceBlock) dan parameter baseline
           Smart Traffic Light. Seluruh angka adalah asumsi desain konseptual ASM-*,
           bukan temuan jurnal. Rujukan: model/traceability/traceability-matrix.md. */

    private import ScalarValues::*;
    private import ISQ::*;
    private import SI::*;

    // ---------------------------------------------------------------- enumerasi
    enum def Approach {
        doc /* Empat pendekat lurus simpang: North, South, East, West (ASM-001). */
        enum North; enum South; enum East; enum West;
    }
    enum def SignalColor {
        doc /* Indikasi satu lampu: Red, Yellow atau Green (REQ-I-002). */
        enum Red; enum Yellow; enum Green;
    }
    enum def ControlMode {
        doc /* Mode TrafficController: Normal (berbasis kepadatan) atau Fallback (urutan ring, ASM-007). */
        enum Normal; enum Fallback;
    }
    enum def DensityCategory {
        doc /* Kategori kepadatan per pendekat: LOW 0..5, MEDIUM 6..15, HIGH >= 16 (ASM-003). */
        enum LOW; enum MEDIUM; enum HIGH;
    }
    enum def CommandKind {
        doc /* Jenis PhaseCommand: Grant (beri green) atau Hold (tanpa green grant). */
        enum Grant; enum Hold;
    }
    enum def BoundaryKind {
        doc /* Jenis BoundaryEvent pada C05: SafeBoundary (startup/clearance selesai) atau GrantAccepted. */
        enum SafeBoundary; enum GrantAccepted;
    }

    // ---------------------------------------------------------------- record
    attribute def ApproachCount {
        doc /* Satu record count per pendekat (ASM-002). */
        attribute approach : Approach;
        attribute vehicleCount : Natural;
        attribute observedAt : DurationValue;
        attribute valid : Boolean;
    }
    attribute def ApproachDensity {
        doc /* Pasangan pendekat dan kategori kepadatannya (keluaran DensityAnalysis). */
        attribute approach : Approach;
        attribute category : DensityCategory;
    }
    attribute def ApproachLamp {
        doc /* Pasangan pendekat dan warna lampunya (satu entry LampVector). */
        attribute approach : Approach;
        attribute color : SignalColor;
    }

    // ---------------------------------------------------------------- item (flow)
    item def CountsFrame {
        doc /* Empat record dengan ID pendekat unik (REQ-I-001). Dibawa oleh C01. */
        attribute records : ApproachCount[4];
    }
    item def DensityFrame {
        doc /* Kategori LOW/MEDIUM/HIGH per pendekat; hanya dari frame valid. Dibawa oleh C02. */
        attribute levels : ApproachDensity[4];
    }
    item def FaultStatus {
        doc /* Status kesalahan data dari VehicleDetection: dataFault terlatch dan recoveryStreak 0..3. Dibawa oleh C03. */
        attribute dataFault : Boolean;
        attribute recoveryStreak : Natural;   // 0..3
    }
    item def PhaseCommand {
        doc /* Grant: approach, greenSeconds 10..30, mode. Hold: tanpa green grant. Dibawa oleh C04. */
        attribute kind : CommandKind;
        attribute approach : Approach[0..1];
        attribute greenSeconds : Natural[0..1];
        attribute mode : ControlMode[0..1];
    }
    item def BoundaryEvent {
        doc /* Event batas dari SignalController: SafeBoundary atau GrantAccepted(i). Dibawa oleh C05. */
        attribute kind : BoundaryKind;
        attribute timestamp : DurationValue;
        attribute completedApproach : Approach[0..1];
        attribute acceptedApproach : Approach[0..1];
    }
    item def LampVector {
        doc /* Tepat empat pasangan approach/color. Dibawa oleh C06. */
        attribute lamps : ApproachLamp[4];
    }

    // ---------------------------------------------------------------- interface block
    port def SamplesIF {
        doc /* InterfaceBlock P01/P03: CountsFrame keluar dari penyedia (C01). */
        out item counts : CountsFrame;
    }
    port def DensityIF {
        doc /* InterfaceBlock P04/P05: DensityFrame keluar dari penyedia (C02). */
        out item density : DensityFrame;
    }
    port def StatusIF {
        doc /* InterfaceBlock P02/P06: FaultStatus keluar dari penyedia (C03). */
        out item status : FaultStatus;
    }
    port def CommandIF {
        doc /* InterfaceBlock P07/P09: PhaseCommand keluar dari penyedia (C04). */
        out item command : PhaseCommand;
    }
    port def BoundaryIF {
        doc /* InterfaceBlock P10/P08: BoundaryEvent keluar dari penyedia (C05). */
        out item boundary : BoundaryEvent;
    }
    port def LampsIF {
        doc /* InterfaceBlock P11/P12: LampVector keluar dari penyedia (C06). */
        out item lamps : LampVector;
    }

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
