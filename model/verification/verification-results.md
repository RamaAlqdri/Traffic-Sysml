# Verification receipt

Run: 2026-11-05 15:19:05 WIB. Command: `python3 model/verification/check_model.py`.
Scope: executable reference-contract checks and static cross-links; not execution of diagrams, hardware, or vehicle-flow simulation. Python assertions must be enabled (do not use `-O`).

| TestCase | Verdict | Actual evidence / limit |
|---|---|---|
| VER-01 | passed (analysis) | boundary counts 0,5,6,15,16 mapped to expected categories |
| VER-03 | passed (analysis) | equal-category/wait ring; longer wait; category precedence examples |
| VER-09 | passed (analysis) | 576 adjacent-round order pairs; 2304 service waits checked; maximum 208 s ≤ 210 s; startup bound 103 s |
| VER-10 | passed (analysis) | nine distinct output vectors from the state output contract; at most one Green. This is not actuator fault testing |
| VER-13 | passed (limited analysis) | density-first deadline-miss, EDF-feasible and already-missed deadline arithmetic examples; not exhaustive scheduler implementation |
| VER-14 | passed (reference predicate) | invalid count domain, boolean, NaN, duplicate ID, future/backward timestamp, false validity, incomplete frame rejected |
| VER-16 | passed (limited analysis) | age3 accepted, age4 rejected; startup/mode transitions remain walkthrough-only |
| Cross-links | passed | 24 unique requirements, source IDs and 21 verification definitions linked to trace matrix |

VER-02/04/05/06/07/08/11/12/17/18/19 remain **not-run** as dynamic/complete inspections in this receipt. Their expected timelines/contracts are specified, but not asserted as measured or executed. VER-15/20/21 have separate source inspection receipts in manual-inspection.md; they are not executable tests here. For partially covered scenarios above, unexercised behavior remains not-run. No throughput improvement is measured.

The worst-case wait proof assumes every approach served exactly once per round, green≤30 s, clearance=4 s, ideal clock and no SafetyHold/restart. Changing these assumptions invalidates the bound. No parameter/location/hardware calibration was performed.
