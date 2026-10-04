# Stricter English (STE)

`--strict` raises the discipline for English technical text, based on ASD-STE100 as described in the 0xpili repo. It is not a certification of full compliance with the standard. This skill does not include the ASD dictionary or an official checker.

## When to use

Apply it only to English text. If the input is in another language and the user has not asked for a translation, explain the limit and continue in the normal plain-language mode. Keep code, identifiers, official names, quotations and original error messages as they are.

## Writing rules

- Separate procedures from descriptions. Procedural sentences have a limit of 20 words and descriptive sentences a limit of 25 words, counted the STE way where it applies. A paragraph has a limit of six sentences and covers one topic. Do not apply these limits to other languages.
- Use the active voice when the source names the actor. Use the imperative for steps that are truly required; do not turn a recommendation into a required step.
- Use simple verb forms, consistent terms, a full subject and verb, and the linking words you need. Avoid contractions, semicolons, idioms and phrasal verbs when an alternative keeps the meaning.
- Write one main action per sentence. Keep two actions in one sentence when they must happen at the same time; do not split them and lose that condition.
- Put the condition next to the action. Keep negations, order, exceptions, quantities and units. Name the object instead of using a pronoun that can be read two ways.
- Use each word only in a fitting meaning. If an official dictionary or standard is available and allowed, check against it before you claim the vocabulary was checked. Do not guess that a word is on the approved list.

## Keeping meaning when the rules conflict

The source repo limits many modals such as "may", "might" and "should". Do not replace them with "must" or "will" if that changes the requirement or the certainty. Find an equivalent wording. If you cannot keep the meaning and follow the rule at the same time, keep the meaning and report the specific limit. Do not delete a warning or an uncertainty to pass a style check.

If a project requires official ASD-STE100 compliance, it needs the full standard in the right version and a suitable checking process. Do not describe a rewrite made with this guide as officially compliant.
