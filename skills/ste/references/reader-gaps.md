# Gaps between technical output and a non-technical reader

These groups come from real data: about 1,740 messages from a non-technical project owner who worked with Claude Code and Codex for two months, in Vietnamese. About 50 times they had to ask again ("I don't get it", "what does that mean?"). The examples below are rewritten as generic situations and contain none of the original data.

| Group | Times in the 50 follow-ups | Signs |
|---|---|---|
| Codes, internal labels, abbreviations | 17 | "What is U01–U14?", "what is phase 4/5?" |
| Decision questions without context | 14 | "I don't understand the question", "what do you recommend?" |
| Mechanism or trade-off not fully explained, or self-contradictory | 8 | "meaning what?", "it still works, so why do you say it's broken?" |
| Everyday or translated words with a special meaning | 6 | "release what, the invoices?" |
| Report too technical, does not say what the reader must do | 5 | "I can't understand any of this", "so what do I need to do?" |

An always-on style rule ("write simply") cut the "too technical" complaints from 4 to 1, but it did not reduce the first two groups: after the rule was added, confusion about decision questions rose from 3 to 11. That is why the skill turns those two groups into specific rules.

## 1. Decision questions

Source:

> Need you to decide:
> 1. Run migrations 0075–0078 in the Release B rollout tonight?
> 2. Enable `NOTIFY_ENABLED`?

Rewrite:

> 1. **Do you approve the database structure update (migrations 0075–0078) when the new version goes onto the server tonight (Release B)?**
>    - Options: do it tonight, or move it to a later rollout.
>    - Why it must be decided, and a recommendation: not given in the source. Ask the agent to add them before you answer.
> 2. **Do you want to turn on automatic notifications (`NOTIFY_ENABLED`)?**
>    - On: the system sends notifications automatically. Off: it sends nothing. The source does not say who receives them, so ask the agent.

Both questions are kept, together with the migration numbers, the flag name and "tonight". Where the source has nothing, the rewrite says so and does not invent a reason.

## 2. Codes and internal labels

- Wrong: "Please run UAT U01–U14."
- Right, when the source explains it: "Please try the 14 test steps in the app yourself (U01–U14, listed in `owner-uat.md`)."
- Right, when the source does not explain it: "Please run U01–U14. The source does not explain what U01–U14 are."

## 3. Words with a special meaning

In the Vietnamese data, the word for "release" (*phát hành*) is also the usual word for issuing an invoice. For a shop that issues e-invoices, "Release B tonight" read as "issue invoices tonight". Better: "Put the new version of the app on the server tonight (Release B; this has nothing to do with invoices)."

English has the same trap. For a clothing brand with its own workshop, "deploy to production" can sound like the production line. Other words that often mislead: "issue" (a ticket or a problem), "export" (a file export or exporting goods), "draft" (a draft in the app or a Draft tab in a spreadsheet), "sync" (once, or continuously).

## 4. Result and next action first

- Source: "Vitest 183/183, Playwright 7/7, typecheck clean, 4 old warnings remain. Commit `a1b2c3d`."
- Rewrite: "The fix passed all automated tests (183/183 and 7/7). You do not need to do anything yet; the next step waits for your decision in item 2. There are 4 old warnings that existed before this fix. Commit: `a1b2c3d`."

## 5. Mechanisms and trade-offs

- Source: "Audit feed is page 1, limit 200 events across all admin activity."
- Rewrite: "The system only reads the 200 most recent events from the admin area, including events that are not orders. On a busy day, if the system pauses for a long time, some orders can be missed. The data is not lost; it is just not read yet (audit feed, limit 200)."

When the source has two statements that look opposite, for example "can deploy right away" and "auto-deploy will produce a broken page", point it out and explain it from the source. In this example, auto-deploy only updates the code, while this release also needs three manual configuration steps. If the source cannot explain it, say that the source contradicts itself.

## 6. Vague amounts

- Wrong: "Proposal: cut back the cron frequency."
- Right: "Proposal: reduce the automatic runs from 12 to 6 times per hour (notification cron)."

## Meaning failures seen in rewrites

- A list rewritten from memory: 6 pending decisions became 10 items plus a second numbered list, and the reader missed items 9 and 10.
- One open question and one number (the migration number) were dropped.
- An item was moved to "decide later" when the source put it in the current round.
- The reader was asked again about something they had already decided, because the rewrite did not separate what was decided from what was missing.
- "Proposed" became "will", or "may be slow" became "will be slow".

The source check line at the end helps catch these failures:

> Source check: kept 6/6 items and 2/2 open questions; added: reason for item 1 (from `plan.md` phase 7); unclear in source: what U01–U14 are.
