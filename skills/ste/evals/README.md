# Running the eval cases

`evals.json` holds nine training inputs and their grading criteria. The `rewrite-previous` case tests the main use: give `fixtures/technical-report.md` as the agent's previous answer, then call `/ste` with nothing else. When you run the agent under test, give it only the prompt and the fixture; keep `expected_output` and the assertions with the grader.

For the read-only case, copy `fixtures/input-plan.md` to `input-plan.md` in a separate temporary workspace before the run, record the SHA256 before and after, and check that no artifact was created. Do not let the agent under test read the source tree or the expected results of another variant.

Compare a baseline that does not read STE with a candidate that reads `SKILL.md` and the relevant references, using the same input, tools and settings. State whether the cases ran as a batch in one session or one per fresh session; the two are not equally independent.

## Quick live check with Claude Code

1. Make the source the agent's previous answer: `claude -p "Reply with exactly the text below, adding nothing: <source>" --output-format json`, and note the `session_id`.
2. Check that the reply matches the source exactly.
3. Run `claude -p --resume <session_id> "/ste"` and compare the rewrite with the source: number of items and questions, every identifier and number, certainty words, and the source check line.

If you want a holdout set for the next improvement, write new cases that the agent has never read.

Schema tools (for example `eval_skill.py` from skill-creator) only check the structure or grade artifacts; they do not run a model. A valid schema does not mean all tests passed.
