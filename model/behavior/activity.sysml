package StlActivity {
    doc /* ACT-00 ManageTraffic - activity event-driven; ACT-01..10 adalah action.
           Alokasi action ke block: lihat model/traceability/allocation.sysml. */

    private import ScalarValues::*;
    private import StlStateMachine::*;

    action def <'ACT-01'> ValidateFrameCache {
        doc /* ACT-01. Validasi frame/cache; update dataFault dan recovery streak; clear dataFault setelah 3 frame baru yang baik. */
    }
    action def <'ACT-02'> ClassifyCounts {
        doc /* ACT-02. Klasifikasi count fresh valid menjadi LOW/MEDIUM/HIGH. */
    }
    action def <'ACT-03'> RankEligible {
        doc /* ACT-03. Refresh eligible pada round baru, ranking, dan cek deadline. */
    }
    action def <'ACT-04'> PrepareGrant {
        doc /* ACT-04. Siapkan grant green beku (10/20/30 s Normal, 10 s Fallback). */
    }
    action def <'ACT-05'> AdvancePhaseTimer {
        doc /* ACT-05. Majukan timer fase yang telah diberikan. */
    }
    action def <'ACT-06'> StmTransition {
        doc /* ACT-06. Lakukan hanya transisi STM-01 yang enabled: green expiry, yellow expiry, clearance expiry. */
    }
    action def <'ACT-07'> SelectMode {
        doc /* ACT-07. Pilih mode Normal/Fallback; pemulihan ke Normal hanya pada awal round. */
    }
    action def <'ACT-08'> MarkServed {
        doc /* ACT-08. Pada grantAccepted: tandai pendekat served dan majukan pointer ring. */
    }
    action def <'ACT-09'> ApplyGrant {
        doc /* ACT-09. Validasi dan terapkan grant, lalu emit grantAccepted(i). */
    }
    action def <'ACT-10'> Startup {
        doc /* ACT-10. Startup: semua lampu merah selama 1 s. */
    }
    action def AcceptEvent { doc /* penerimaan event sample/tick/timer */ }
    action def RequestSafetyHold {
        doc /* Permintaan SafetyHold all-red yang ditangani transition infeasiblePlan pada STM-01. */
        out item request : InfeasiblePlanEvent;
    }

    action def <'ACT-00'> ManageTraffic {
        doc /* ACT-00 ManageTraffic; sample/observation tick validates cache, phase timer only advances lifecycle. */
        in attribute sampleOrTick : Boolean;
        in attribute isRunning : Boolean;
        in attribute freshValidCache : Boolean;
        in attribute safeBoundaryAtTick : Boolean;
        in attribute feasiblePlan : Boolean;

        action startup : Startup;
        action acceptEvent : AcceptEvent;
        action validateFrame : ValidateFrameCache;
        action classify : ClassifyCounts;
        action advanceTimer : AdvancePhaseTimer;
        action selectMode : SelectMode;
        action rank : RankEligible;
        action prepare : PrepareGrant;
        action apply : ApplyGrant;
        action markServed : MarkServed;
        action stmStep : StmTransition;
        action holdRequest : RequestSafetyHold;

        merge loopTop;
        decide runningNow;
        decide eventKind;
        decide cacheOk;
        decide boundaryNow;
        decide planOk;

        first start;
        then startup;
        then loopTop;
        then runningNow;
        if isRunning then acceptEvent;
        else done;

        first acceptEvent;
        then eventKind;
        if sampleOrTick then validateFrame;
        else advanceTimer;

        first validateFrame;
        then cacheOk;

        if freshValidCache then classify;
        else advanceTimer;

        first classify then advanceTimer;
        first advanceTimer;
        then boundaryNow;

        if safeBoundaryAtTick then selectMode;
        else stmStep;

        first selectMode then rank;
        first rank;
        then planOk;

        if feasiblePlan then prepare;
        else holdRequest;

        first prepare then apply;
        first apply then markServed;
        first markServed then stmStep;
        first stmStep then loopTop;
        first holdRequest then loopTop;
    }
}
