# Visuals only when they help understanding

Choose by the question the reader needs answered, not by a wish to decorate or to make the output look complete. Karpathy's idea is to open more ways to explain; video is not always better than text.

## Deciding in auto mode

Before you create a visual, decide what the reader will understand faster or more exactly because of it. If you cannot answer specifically, use text. You do not need to explain why you skipped a visual for every simple answer.

| Need | Suitable form | When not to add it |
|---|---|---|
| One conclusion, one action, a few clear points | A paragraph or a short list | Do not add a diagram just because there are technical names |
| Compare options, permissions or states on the same criteria | A compact table | Little information; one sentence is enough |
| Relationships, order, decision branches, responsibilities or data flows that are hard to picture | A small Mermaid diagram, a state table or a static diagram | A simple chain that is already clear in text; do not draw every component |
| Numbers or changes to compare | A chart from source data | Do not invent data, ratios, trends or precision |
| The reader needs to filter, try scenarios, change parameters or explore several layers | A compact interactive HTML page, if creating artifacts is allowed | Do not produce HTML just to show a few paragraphs |
| Change over time or motion that must be seen | Only suggest a video when it helps | Do not make a video on your own in auto mode |

With `--visual off`, do not create optional visuals. Required content of the active workflow stays. If all requirements cannot be met at once, state the conflict before changing a requirement. Do not delete existing visuals when you only review the wording.

## When the user chooses the form

- `diagram`: create a fitting diagram even if auto would choose text; keep it small. Use an installed Mermaid or diagram skill if it fits and can be called; do not ask to install a new tool just to draw.
- `html`: create HTML with the tools available. When another workflow already creates an HTML artifact (for example a plan or brainstorm with `--html`), let that workflow own the artifact and apply `ste` to its content and visuals; do not create a second HTML file.
- `video`: check the tools, image and audio sources, usage rights, cost and the approved scope. Do not fetch secrets, turn on paid services, or promise a render when no tool is available. If you cannot build it, state the limit and only write a script or storyboard when that is requested or allowed.
- `--check`: only comment and suggest visuals in chat; do not create files in any mode.

## Quality and source of truth

1. Each visual answers one question. Use plain labels and keep identifiers when they are needed to match the code.
2. Keep every error or exception branch that affects the conclusion. Mark unconfirmed parts as "proposed" or "not decided"; a diagram must not make an assumption look like the running architecture.
3. For an explanatory visual, the source text keeps the official rules. If the workflow has its own Markdown or HTML contract, keep that contract. Numbers and states in the visual must match the source.
4. Do not copy the whole document into an extra artifact. Embed the diagram in the original document when that fits; a separate file links back to the source and only serves the question it illustrates.
5. HTML works on small screens, has labels and keyboard access for interactions, and does not depend on a CDN or the network when it can be self-contained. Text content must stay readable if JavaScript does not run.
6. Check the syntax and open or render the artifact when a tool is available. If you cannot render it, say that you only checked the source or the syntax; do not claim that you looked at the image.
7. If the runtime does not display Mermaid, use ASCII or an equivalent table when that fits. State the limit without turning a simple request into an environment setup task.
