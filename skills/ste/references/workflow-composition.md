# Using STE inside other workflows

The active workflow decides the steps and the required outputs. That can be a skill set such as AgentKit/ClaudeKit (brainstorm, plan, cook, test, code-review, fix) or the project's own process. STE helps with wording and with finding missing meaning inside that step; STE does not add a mandatory approval gate.

| Step | Where STE applies | What stays unchanged |
|---|---|---|
| Brainstorm | Goals, options, trade-offs, assumptions and recommendations | Decisions already made, scope, acceptance criteria; open ideas stay ideas |
| Plan | The plan file and the phases in the task scope; check before hand-off | Frontmatter, required sections, links, checklists, file/API/table names, error conditions and how to verify |
| Code | Explaining the change and the points that need a decision | Code, commands, identifiers; plain wording does not replace build and test |
| Test | Results, impact of failures and what was not tested | Commands run, actual results, failures and missing tests |
| Code review | Failure scenario, impact, evidence, suggestion | Severity, the decision maker's decisions, findings that match reality |
| Fix | Cause, the behavior that was fixed, and evidence | Fix scope and test results; do not turn "not tested" into "correct" |

When the workflow has its own output template, read it and keep it; the table above does not replace the template. If the workflow is not installed, STE still runs on its own.

When one request calls both a document workflow (for example `/plan`) and `ste`, apply STE while writing. Do not write the document and then create a second "plain" version. Sub-agents get the same instructions and scope. The main agent reviews the result against the decisions and the sources.

When only `--check` is requested, return findings; do not edit the plan, checkboxes, phase status or report files. Do not run a workflow that writes files to serve a read-only request.

When a review suggests replacing a library or threshold that the decision maker chose, keep the original decision and present the new suggestion as a question to decide. Clearer wording is not a reason to change business rules.
