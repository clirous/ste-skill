---
name: ste
description: "Rewrite an AI agent's technical answer or document so a non-technical reader can understand it and make decisions, without changing its meaning: keep every item, number, identifier and level of certainty; explain internal codes, jargon and pending decisions. Use when the user types /ste or $ste, says they do not understand a technical answer, or asks to check a plan or requirement for ambiguity. Not for brand copy; does not certify ASD-STE100 compliance."
user-invocable: true
when_to_use: "Right after a technical report or plan that a non-technical reader must understand or act on; when reviewing a document so another agent can implement it without guessing."
category: reasoning
keywords: [ste, clarity, plain-language, ambiguity, decision, non-technical]
argument-hint: "[path|topic] [--check] [--strict] [--visual auto|off|diagram|html|video]"
license: MIT
metadata:
  version: "2.1.0"
---
# STE: rewrite for non-technical readers without changing the meaning

The reader knows their own business but does not read code: a project owner, a manager, a client. The skill has two goals. When they conflict, the second goal wins.

1. The reader understands the result and knows what they need to do or decide.
2. Every piece of information in the source is still there and still correct.

## Input

| Call | What to do |
|---|---|
| `/ste` with nothing else | Rewrite the agent's most recent answer in this conversation |
| `/ste <path>` | Rewrite that file in place; with `--check`, only comment on it |
| `/ste <topic or question>` | Write or explain from scratch under the same rules |
| Together with another workflow (brainstorm, plan, review…) | Apply while writing that workflow's output; read [workflow composition](references/workflow-composition.md) |

Write in the reader's language unless they ask for another one. Leave brand voice, poetry, fiction and quotations as they are. When you hand work to another agent, pass on the `ste` request, the language, the mode, the file scope and the meaning-preservation contract below.

## Meaning-preservation contract

This applies at all times, even if it makes the rewrite longer.

1. **Work from the exact source.** Re-read the exact source text before writing. Do not rewrite from memory of the topic. If you cannot see the exact text anymore (for example after the context was compacted), say so, re-read the source file if there is one, and state the limit if there is not.
2. **Keep the lists.** Same number of items, same order, same numbering. Do not merge, split or drop items. Open questions, pending decisions, warnings and risks must all still be there.
3. **Keep load-bearing details exactly:** numbers, units, dates and times, names of people, identifiers (files, commands, APIs, variables, commit hashes, order IDs), conditions, negations, exceptions, the order of steps, and the level of certainty (may, not yet tested, proposed, decided).
4. **Explain, do not replace.** The first time a term or internal code appears, give its meaning in plain words and keep the original in brackets, for example "put the new version of the app on the server (Release B)". The reader can then still look it up and use the same words with the agent.
5. **Add no new facts.** Common terms (smoke test, migration, webhook) get their general meaning. Project-specific codes (U01, Release B, phase 4) are explained only from the source; if the source does not explain them, write "not explained in the source". Information you take from a file you read during this turn must be marked "added from <source>".
6. **Do not hide gaps.** If the source contradicts itself, does not say what the reader must do, or asks a question without options or a recommendation, say clearly that the source does not have it. Do not fill the gap with your own guess.
7. **Source check line.** When you rewrite from a source, end the answer with one line such as: `Source check: kept 6/6 items; added: …; dropped: …; unclear in source: …`. Leave out the parts that do not apply. Write the line in the reader's language. For a file, put this line in the chat reply, not in the file.

## Common gaps between technical output and the reader

Check them in this order. Examples of right and wrong rewrites are in [reader gaps](references/reader-gaps.md).

1. **Decision questions without context.** Each question states four things: what is being decided, in plain words; why it must be decided and what difference each option makes; the options; the recommendation or default that the source gives. Separate what is already decided from what is still missing, so the reader is not asked again about something they already decided. If every question lacks the same thing (for example none has a recommendation), say it once before the list instead of under each question. Do not add a second numbered list; use bullets for supporting details.
2. **Internal codes, labels and abbreviations** (phase 4, U01–U14, Release B, variable names, YAGNI, RPC): explain them briefly at first use, following rules 4 and 5.
3. **Everyday or translated words with a special meaning.** If a word can be read with a different meaning in the reader's own business, say what it refers to here. Examples: "production" means the live system, not a manufacturing line; "issue" can mean a ticket or a problem; "export", "draft" and "sync" are also often misread. Do not invent a new translation for a technical term.
4. **Result and next action first.** Open with the result and what the reader must do now, or say clearly that nothing is needed yet.
5. **Mechanisms and trade-offs as consequences:** who sees what, when, what is gained, what is lost. Use an example with numbers if the source has them.
6. **Vague amounts** ("reduce", "cut back", "recently"): give the numbers from and to if the source has them; otherwise say they are unclear.

## Modes

| Mode | Behavior |
|---|---|
| Default | Rewrite under the meaning-preservation contract; uses `--visual auto` |
| `--check` | Read only: report the location, impact, suggestion and decision needed; do not edit or create files, including HTML |
| `--strict` | English text only, in the spirit of ASD-STE100; read [strict English](references/strict-english.md); do not translate documents in other languages on your own |
| `--visual off` | No optional tables, diagrams, HTML or video |
| `--visual diagram/html/video` | Use the requested form; read [visual routing](references/visual-routing.md) |

Choose only one `--visual` value. If `--check` comes with a request to create a file, reply only in chat and state the read-only limit.

## Checking requirements for implementers

When you write or review a plan, requirement or acceptance criteria, read the [ambiguity checklist](references/ambiguity.md). Look for the answer in the source first. Ask the decision maker only about business points that the source has not decided. Leave missing values open rather than inventing them, and do not turn a proposal into a requirement.

## Visuals

The default is `--visual auto`: text for short answers, a table when comparing, a diagram when a flow or relationship is hard to picture. Read [visual routing](references/visual-routing.md) before you create a diagram, HTML or video.

## Self-check before sending

- Count the items and questions again and compare with the source.
- Check each load-bearing detail from rule 3: is it still there and still correct?
- Look for any sentence that is more or less certain than the source.
- Read it as a non-technical reader: is there still a sentence that would make them ask "what does this mean?"
- Checking the wording is not verifying the system. Do not write "verified" if you only reviewed the text.

## Sources and limits

Read [sources](references/sources.md) for what this design is based on. This is not an official version of ASD-STE100 and not a measure of the agent's accuracy.
