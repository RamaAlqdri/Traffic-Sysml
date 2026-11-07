package StlStateMachine {
    doc /* STM-01 - lifecycle SignalController (owner BLK-05).
           Mode Normal/Fallback adalah variabel TrafficController, bukan region konkuren.
           Perubahan mode/grant hanya pada Ready; dataFault dilatch pada fase aktif mana pun. */

    private import ScalarValues::*;
    private import ISQ::*;
    private import SI::*;
    private import StlTypes::*;

    item def GrantEvent {
        doc /* Event grant dari PhaseCommand: pendekat i dan lama green g (10..30 s). */
        attribute approach : Approach;
        attribute greenSeconds : Natural;
    }
    item def InvalidCommandEvent {
        doc /* Command di luar domain atau green yang melompati clearance (REQ-S-004). */
    }
    item def InfeasiblePlanEvent {
        doc /* Permintaan SafetyHold dari TrafficController: urutan EDF pun tidak memenuhi deadline (REQ-S-006). */
    }
    item def RestartEvent {
        doc /* Restart eksplisit: satu-satunya jalan keluar dari SafetyHold. */
    }

    state def SignalLifecycle {
        doc /* STM-01: Running (Startup, Ready, Green(i), Yellow(i), Clearance) dan SafetyHold. */
        entry; then running;

        state running {
            entry; then startup;

            state startup {
                doc /* Startup: semua Red 1 s. */
                entry action setAllRed;
            }
            state ready {
                doc /* Ready: meminta rencana ke TrafficController. */
                entry action requestPlan;
            }
            state green {
                doc /* Green(i): hanya pendekat i Green, lain Red. lockedGreen = g yang dikunci saat grant. */
                attribute lockedGreen : DurationValue;
                entry action setOnlyApproachGreen;
            }
            state yellow {
                doc /* Yellow(i): hanya pendekat i Yellow, lain Red. */
                entry action setOnlyApproachYellow;
            }
            state clearance {
                doc /* Clearance: semua Red 1 s. */
                entry action setAllRedClearance;
            }

            transition startupDone
                first startup
                accept after 1 [s]
                then ready;

            transition grantAccepted
                first ready
                accept grant : GrantEvent
                if grant.greenSeconds >= 10 and grant.greenSeconds <= 30
                do action lockGrantAndEmitAccepted
                then green;

            transition greenExpiry
                first green
                accept after green.lockedGreen
                do action recordLastGreenEnd
                then yellow;

            transition yellowExpiry
                first yellow
                accept after 3 [s]
                then clearance;

            transition clearanceDone
                first clearance
                accept after 1 [s]
                do action emitSafeBoundary
                then ready;
        }

        state safetyHold {
            doc /* SafetyHold: semua Red; keluar hanya lewat restart. */
            entry action setAllRedHold;
        }

        transition toSafetyHold
            first running
            accept invalid : InvalidCommandEvent
            then safetyHold;

        transition toSafetyHoldInfeasible
            first running
            accept infeasible : InfeasiblePlanEvent
            then safetyHold;

        transition restart
            first safetyHold
            accept restartEvent : RestartEvent
            do action resetModelClocksAndRound
            then running;
    }
}
