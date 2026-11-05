package StlActivity {
    doc /* ACT-00 ManageTraffic - activity event-driven; ACT-01..10 adalah action.
           Alokasi action ke block: lihat model/traceability/allocation.sysml. */

    private import ScalarValues::*;

    action def ValidateFrameCache;   // ACT-01 validasi frame/cache, update dataFault + recovery streak
    action def ClassifyCounts;       // ACT-02 klasifikasi count fresh valid
    action def RankEligible;         // ACT-03 refresh eligible, ranking, cek deadline
    action def PrepareGrant;         // ACT-04 siapkan grant green beku
    action def AdvancePhaseTimer;    // ACT-05 majukan timer fase
    action def StmTransition;        // ACT-06 transisi STM-01 yang enabled
    action def SelectMode;           // ACT-07 pilih Normal/Fallback
    action def MarkServed;           // ACT-08 tandai served, majukan pointer ring
    action def ApplyGrant;           // ACT-09 validasi dan terapkan grant
    action def Startup;              // ACT-10 startup all-red 1 s
    action def AcceptEvent;          // penerimaan event sample/tick/timer
    action def RequestSafetyHold;    // permintaan SafetyHold all-red

    action def ManageTraffic {       // ACT-00
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
        decide cacheOk;
        decide boundaryNow;
        decide planOk;

        first start;
        then startup;
        then loopTop;
        then acceptEvent;
        then validateFrame;
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
        first holdRequest then done;
    }
}
