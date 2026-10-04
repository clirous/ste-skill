# ste — make AI explain itself to non-technical people without changing the meaning

*Inspired by [Andrej Karpathy's post](https://x.com/karpathy/status/2105819303471976479) on Simplified Technical English (ASD-STE100).*

An Agent Skill for Claude Code, Codex and other agents that support the Agent Skills format. When an AI has just sent you a wall of technical text (test results, deploys, plans, questions you need to decide), type `/ste`. The agent rewrites that exact answer so someone who does not read code can understand it and knows what to do next, while every detail of the original stays intact.

## Why

The author, a non-technical project owner, reviewed about 1,740 of their own messages with Claude Code and Codex over two months. About 50 times they had to ask again: "I don't get it", "what does that mean?". The main causes were not hard sentences. They were:

1. **Internal codes and labels left unexplained:** "U01–U14", "phase 4/5", "Release B", variable names.
2. **Decision questions without context:** nothing about what is being decided, why, which options exist, or what the AI recommends.
3. **Mechanisms or trade-offs not fully explained**, sometimes contradicting themselves.
4. **Everyday words with a special meaning:** in Vietnamese, the word for "release" is also the word for issuing an invoice, so "Release B tonight" read as "issue invoices tonight". English has the same trap with words like "production" or "issue".
5. **Reports that do not say what the reader must do.**

A fixed "write simply" line in the agent's instruction file only reduced the last group. So the skill handles each group directly. Details and examples: [reader-gaps.md](skills/ste/references/reader-gaps.md).

## Plain, but not wrong

The biggest risk of "translating" into plain language is that the AI changes the meaning. The skill has a mandatory meaning-preservation contract:

- Rewrite from the exact source, never from memory.
- Keep the same number of items, in the same order, and every open question.
- Keep numbers, dates, file names, commands, codes, conditions, negations and certainty ("may", "not tested", "proposed") exactly.
- Explain jargon but keep the original term in brackets, so you can still use the same words with the AI.
- Invent nothing. If the source does not say something (for example, there is no recommendation), the rewrite says so.
- End with a source check line, for example: `Source check: kept 6/6 items; unclear in source: what U01–U14 are.`

The source check line is the agent checking itself, so it is not independent proof. For important decisions, still compare quickly with the original.

## Install

macOS or Linux:

```bash
git clone https://github.com/clirous/ste-skill.git ~/Code/ste-skill
~/Code/ste-skill/install.sh
```

The script links `skills/ste` into `~/.claude/skills/`, `~/.codex/skills/` and `~/.agents/skills/`, only for the tools already on your machine. If a real `ste` folder already exists there, the script leaves it alone and tells you. To update, run `git pull` in the repo.

On Windows, or if you prefer not to use the script, copy the whole `skills/ste` folder to `%USERPROFILE%\.claude\skills\ste` (Claude Code) or `%USERPROFILE%\.codex\skills\ste` (Codex).

After installing, start a new session.

## Usage

```text
/ste                                  rewrite the AI's last answer
/ste plans/my-plan/plan.md            rewrite that file
/ste --check plans/my-plan/plan.md    comment only, do not edit the file
/ste explain what a webhook is        write from scratch under the same rules
/ste --visual off                     text only, no tables or diagrams
/ste --visual diagram                 add a diagram when a flow is hard to picture
/ste --strict                         English text in the spirit of ASD-STE100
```

In Codex, type `$ste` instead of `/ste`. You can combine it with other workflows, for example "plan feature X, use ste for the whole plan". The skill replies in the language you are using.

## Limits

- The skill only rewrites. If the source is wrong or incomplete, the rewrite is not more correct; the skill only tries to point out the gaps.
- It runs when you call it; it does not switch on for every answer.
- It is not an official version of ASD-STE100 and does not certify compliance.

## Credits and license

The plain-writing rules build on [0xpili/simplified-technical-english](https://github.com/0xpili/simplified-technical-english); details in [sources.md](skills/ste/references/sources.md). MIT license. The license of the reference repo is in `skills/ste/UPSTREAM-LICENSE`.
