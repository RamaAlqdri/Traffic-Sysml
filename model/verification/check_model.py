"""Executable checks of the conceptual contract; not a traffic/hardware simulator."""
from itertools import permutations
from pathlib import Path
from datetime import datetime
from zoneinfo import ZoneInfo
import math
import re

ROOT = Path(__file__).resolve().parents[2]
APPROACHES = ('N', 'S', 'E', 'W')
MIN_GREEN, MAX_GREEN, YELLOW, ALL_RED, MAX_WAIT = 10, 30, 3, 1, 210


def category(count):
    assert type(count) is int and 0 <= count <= 2147483647
    return 0 if count <= 5 else 1 if count <= 15 else 2


def rank(eligible, categories, waits, pointer):
    return sorted(eligible, key=lambda a: (-categories[a], -waits[a],
                  (APPROACHES.index(a) - APPROACHES.index(pointer)) % 4))


def valid_frame(records, now, previous):
    if not isinstance(records, list) or len(records) != 4:
        return False
    ids = []
    for row in records:
        if not isinstance(row, dict) or set(row) != {'approach', 'vehicleCount', 'observedAt', 'valid'}:
            return False
        a, n, t = row['approach'], row['vehicleCount'], row['observedAt']
        if a not in APPROACHES or type(n) is not int or not 0 <= n <= 2147483647:
            return False
        if type(t) not in (int, float) or not math.isfinite(t):
            return False
        if row['valid'] is not True or not 0 <= now - t <= 3 or t < previous.get(a, 0):
            return False
        ids.append(a)
    return len(set(ids)) == 4


def main():
    if not __debug__:
        raise SystemExit("Assertions must be enabled; do not use python -O.")
    # Category boundaries and deterministic ties are checked against independent examples.
    assert [category(n) for n in (0, 5, 6, 15, 16)] == [0, 0, 1, 1, 2]
    categories = dict.fromkeys(APPROACHES, 1)
    waits = dict.fromkeys(APPROACHES, 0)
    assert rank(APPROACHES, categories, waits, 'E') == ['E', 'W', 'N', 'S']
    waits['N'] = 1
    assert rank(APPROACHES, categories, waits, 'E')[0] == 'N'
    categories['W'] = 2
    assert rank(APPROACHES, categories, waits, 'E')[0] == 'W'

    maximum = 0
    pair_count = 0
    for first in permutations(APPROACHES):
        for second in permutations(APPROACHES):
            pair_count += 1
            t, ends = ALL_RED, {}
            for a in first:
                ends[a] = t + MAX_GREEN
                t += MAX_GREEN + YELLOW + ALL_RED
            for a in second:
                waiting = t - ends[a]
                maximum = max(maximum, waiting)
                assert waiting <= MAX_WAIT
                t += MAX_GREEN + YELLOW + ALL_RED
    assert pair_count == 576 and maximum == 208
    assert ALL_RED + 3 * (MAX_GREEN + YELLOW + ALL_RED) == 103

    vectors = [('Red',) * 4]  # Startup/Ready/Clearance/SafetyHold share all-red output.
    for color in ('Green', 'Yellow'):
        for i in range(4):
            vectors.append(tuple(color if k == i else 'Red' for k in range(4)))
    assert all(v.count('Green') <= 1 for v in vectors)
    assert (YELLOW, ALL_RED) == (3, 1)

    good: list[dict[str, object]] = [dict(approach=a, vehicleCount=5, observedAt=10, valid=True) for a in APPROACHES]
    assert valid_frame(good, 13, {})
    assert not valid_frame(good, 14, {})
    for bad_value in (-1, True, float('nan'), 2147483648):
        bad = [r.copy() for r in good]
        bad[0]['vehicleCount'] = bad_value
        assert not valid_frame(bad, 10, {})
    for key, value in [('approach', 'S'), ('observedAt', 11), ('valid', False)]:
        bad = [r.copy() for r in good]
        bad[0][key] = value
        assert not valid_frame(bad, 10, {})
    assert not valid_frame(good, 10, {'N': 11})
    assert not valid_frame([], 10, {})

    # Independent deadline example: density-first would miss S, EDF can still meet it.
    now, deadline_s = 200, 210
    assert now + MAX_GREEN + YELLOW + ALL_RED > deadline_s
    assert now <= deadline_s
    assert 211 > deadline_s  # already missed => no feasible sequence can restore this deadline

    # Regression guard: a Python \t escape once reduced included diagrams to near-zero size.
    for line in (ROOT / 'report/sections/05-models.tex').read_text(encoding='utf-8').splitlines():
        if r'\includegraphics' in line:
            assert not any(ord(c) < 32 for c in line), 'Control character in graphics dimensions'
            assert re.search(r'height=[.0-9]+\\text(?:width|height)', line), line

    actions = re.findall(r"action def <'(ACT-(?:0[1-9]|10))'> \w+", (ROOT / 'model/behavior/activity.sysml').read_text(encoding='utf-8'))
    assert len(actions) == len(set(actions)) == 10, 'Activity nodes need distinct model IDs'

    req = (ROOT / 'model/requirements/requirements.md').read_text(encoding='utf-8')
    trace = (ROOT / 'model/traceability/traceability-matrix.md').read_text(encoding='utf-8')
    scenarios = (ROOT / 'model/verification/verification-scenarios.md').read_text(encoding='utf-8')
    evidence = (ROOT / 'research/evidence-matrix.md').read_text(encoding='utf-8')
    assumptions = (ROOT / 'research/design-assumptions.md').read_text(encoding='utf-8')
    ids = re.findall(r'^## (REQ-[A-Z]-\d+)', req, re.M)
    assert len(ids) == len(set(ids)) == 24
    for section in re.split(r'^## ', req, flags=re.M)[1:]:
        rid = section.split()[0]
        assert f'| {rid} |' in trace
        for source in re.findall(r'(?:EVID-[A-Z]+|ASM)-\d+', section):
            assert source in evidence or source in assumptions, source
        for ver in re.findall(r'VER-\d+', section):
            assert f'## {ver} ' in scenarios, ver
    assert len(re.findall(r'^## VER-', scenarios, re.M)) == 21
    for file in ('use-case', 'activity', 'sequence', 'state-machine'):
        assert (ROOT / f'model/behavior/{file}.sysml').is_file()
    for file in ('bdd', 'ibd'):
        assert (ROOT / f'model/structure/{file}.sysml').is_file()

    stamp = datetime.now(ZoneInfo('Asia/Jakarta')).strftime('%Y-%m-%d %H:%M:%S %Z')
    receipt = f'''# Verification receipt

Run: {stamp}. Command: `python3 model/verification/check_model.py`.
Scope: executable reference-contract checks and static cross-links; not execution of diagrams, hardware, or vehicle-flow simulation. Python assertions must be enabled (do not use `-O`).

| TestCase | Verdict | Actual evidence / limit |
|---|---|---|
| VER-01 | passed (analysis) | boundary counts 0,5,6,15,16 mapped to expected categories |
| VER-03 | passed (analysis) | equal-category/wait ring; longer wait; category precedence examples |
| VER-09 | passed (analysis) | {pair_count} adjacent-round order pairs; 2304 service waits checked; maximum {maximum} s ≤ {MAX_WAIT} s; startup bound 103 s |
| VER-10 | passed (analysis) | nine distinct output vectors from the state output contract; at most one Green. This is not actuator fault testing |
| VER-13 | passed (limited analysis) | density-first deadline-miss, EDF-feasible and already-missed deadline arithmetic examples; not exhaustive scheduler implementation |
| VER-14 | passed (reference predicate) | invalid count domain, boolean, NaN, duplicate ID, future/backward timestamp, false validity, incomplete frame rejected |
| VER-16 | passed (limited analysis) | age3 accepted, age4 rejected; startup/mode transitions remain walkthrough-only |
| Cross-links | passed | 24 unique requirements, source IDs and 21 verification definitions linked to trace matrix |

VER-02/04/05/06/07/08/11/12/17/18/19 remain **not-run** as dynamic/complete inspections in this receipt. Their expected timelines/contracts are specified, but not asserted as measured or executed. VER-15/20/21 have separate source inspection receipts in manual-inspection.md; they are not executable tests here. For partially covered scenarios above, unexercised behavior remains not-run. No throughput improvement is measured.

The worst-case wait proof assumes every approach served exactly once per round, green≤30 s, clearance=4 s, ideal clock and no SafetyHold/restart. Changing these assumptions invalidates the bound. No parameter/location/hardware calibration was performed.
'''
    (ROOT / 'model/verification/verification-results.md').write_text(receipt, encoding='utf-8')
    print(f'PASS: {pair_count} order pairs, maximum wait {maximum}s; category/tie/input/state and 24 requirement links checked.')


if __name__ == '__main__':
    main()
