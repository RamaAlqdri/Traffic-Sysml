package StlStateMachine {
    doc /* STM-01 - lifecycle SignalController (owner BLK-05).
           Mode Normal/Fallback adalah variabel TrafficController, bukan region konkuren.
           Perubahan mode/grant hanya pada Ready; dataFault dilatch pada fase aktif mana pun. */

    private import ScalarValues::*;
    private import SI::*;
    private import StlTypes::*;

    item def GrantEvent {
        attribute approach : Approach;
        attribute greenSeconds : Natural;
    }
    item def InvalidCommandEvent;
    item def RestartEvent;

    state def SignalLifecycle {
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
                doc /* Green(i): hanya pendekat i Green, lain Red. */
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
                accept after 30 [s]
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

        transition restart
            first safetyHold
            accept restartEvent : RestartEvent
            do action resetModelClocksAndRound
            then running;
    }
}
