package StlActivity {
    doc /* ACT-00 ManageTraffic - activity event-driven; ACT-01..10 adalah action.
           Alokasi action ke block: lihat model/traceability/allocation.sysml. */

    private import ScalarValues::*;
    private import StlStateMachine::*;

    action def ValidateFrameCache { doc /* ACT-01 validasi frame/cache, update dataFault + recovery streak */ }
    action def ClassifyCounts { doc /* ACT-02 klasifikasi count fresh valid */ }
    action def RankEligible { doc /* ACT-03 refresh eligible, ranking, cek deadline */ }
    action def PrepareGrant { doc /* ACT-04 siapkan grant green beku */ }
    action def AdvancePhaseTimer { doc /* ACT-05 majukan timer fase */ }
    action def StmTransition { doc /* ACT-06 transisi STM-01 yang enabled */ }
    action def SelectMode { doc /* ACT-07 pilih Normal/Fallback */ }
    action def MarkServed { doc /* ACT-08 tandai served, majukan pointer ring */ }
    action def ApplyGrant { doc /* ACT-09 validasi dan terapkan grant */ }
    action def Startup { doc /* ACT-10 startup all-red 1 s */ }
    action def AcceptEvent { doc /* penerimaan event sample/tick/timer */ }
    action def RequestSafetyHold {
        doc /* Permintaan SafetyHold all-red yang ditangani transition infeasiblePlan pada STM-01. */
        out item request : InfeasiblePlanEvent;
    }

    action def ManageTraffic {
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
