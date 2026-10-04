# Sources and credits

This skill was written for non-technical readers and for coding-agent workflows. It does not copy the dictionary or scripts from the source repo.

## Source repo

[0xpili/simplified-technical-english](https://github.com/0xpili/simplified-technical-english/tree/1e148d670cba46685ad2b4c3f2354a637a7fdbbe), commit `1e148d670cba46685ad2b4c3f2354a637a7fdbbe`.

That repo is based on ASD-STE100 Issue 7 (2017). What this skill takes from it: clear sentences, active voice, one main idea per sentence, consistent terms, keeping the words that matter, and reviewing after writing. The English `--strict` mode follows its limits of 20/25 words per sentence and six sentences per paragraph.

The repo has an MIT license for its skill and scripts. The ASD dictionary has its own rights, and this skill does not distribute it. See the [upstream license](https://github.com/0xpili/simplified-technical-english/blob/1e148d670cba46685ad2b4c3f2354a637a7fdbbe/LICENSE) and [NOTICE](https://github.com/0xpili/simplified-technical-english/blob/1e148d670cba46685ad2b4c3f2354a637a7fdbbe/NOTICE.md). A copy of the upstream license is kept in `UPSTREAM-LICENSE` as credit for the parts used.

## Karpathy's post

[The original post](https://x.com/karpathy/status/2105819303471976479) mentions ASD-STE100 and the option to relax how strictly it is applied, then extends the idea to diagrams, interactive HTML and explainer videos. This skill takes the idea of choosing the form that helps the reader most; it does not treat that list as a required order. The repo does not store the full text of the post.

## Real-world data

The meaning-preservation contract and the [common gaps](reader-gaps.md) come from reviewing about 1,740 messages between one non-technical project owner and Claude Code and Codex (August to October 2026, in Vietnamese). About 50 times the owner had to ask again. The first trial of the skill also showed meaning failures when a list was rewritten from memory. The raw data is not published; the examples in this repo are rewritten as generic situations.

## What this skill adds

The meaning-preservation contract, the source check line, the ambiguity review based on implementation behavior, workflow composition, the read-only mode and the visual routing rules are additions of this skill. They are not rules quoted from Karpathy's post, and they are not an ASD certification.

ASD-STE100 belongs to ASD. This skill is not officially linked to ASD, is not approved by ASD and does not certify compliance. The official standard is at [ASD-STE100](https://www.asd-ste100.org/).
