# Contributing to debrief

Two contribution types are by far the most useful, because they're the two failure modes the skill exists to handle:

1. **Recall got skipped.** The skill handed you a passive recap — a tidy summary of what got done — instead of making you reconstruct it yourself. This is the core failure: it reproduces the exact fluency illusion the skill is meant to puncture.
2. **Activation misfire.** The skill fired when it shouldn't (mid-task, or on a mechanical session with nothing transferable), or didn't fire when you genuinely wanted to learn.

Both are fixable. File a GitHub issue with a reproducible prompt and we'll tighten the recall discipline, sharpen the activation rules, or — if the case is genuinely ambiguous — document it.

## Filing a recall-skipped report

Use the [recall-skipped issue template](.github/ISSUE_TEMPLATE/recall-skipped.md). At minimum we need:

- The exact prompt you sent (and the prior turn or two — a debrief depends on the session before it).
- What the skill did instead of making you recall (paste the response, or the part that was a summary handed to you).
- Where in the loop it slipped — did it skip the recall questions entirely, accept a "makes sense" without pushing, or correct before you'd attempted anything?

Concrete prompts beat abstract complaints. *"It listed everything we did and asked if it made sense"* is fixable. *"It felt a bit passive"* is hard to act on.

## Filing an activation issue

Use the [activation issue template](.github/ISSUE_TEMPLATE/activation.md). Tell us:

- The exact prompt and the surrounding context (was the work done, or still in progress?).
- Whether the skill activated or not.
- Whether you think it should have, and why — which trigger fits, or which when-NOT-to-debrief clause covers it.

## Improving the recall discipline

`references/recall-discipline.md` is the heart of the skill. If you find a question shape that consistently lets the user off the hook (a phrasing they can answer by pattern-matching the transcript instead of retrieving), add it to the bad-question pairs with a better alternative. If you find a fluency-illusion tell that slips through, add it to the tells list.

## Improving the examples

`EXAMPLES.md` is the single best place to make the skill concrete for new users. A real before/after — a recap you got that should have been a recall — is the most useful thing you can contribute. New examples are most useful when they cover a domain or session-type not yet represented (current set covers debugging, an architecture decision, a refactor, and two non-activations).

## What we don't need

- Stylistic rewrites of SKILL.md without a concrete failure case behind them.
- New steps in the loop. Five is the design — adding a sixth has to come with a clear gap the existing five don't cover.
- Turning the skill into a document generator that writes "lessons learned" reports without the recall. That defeats the entire purpose — the recap *is* the failure mode.

## Code of conduct

Be specific. Be kind. The skill is about catching your own gaps safely; the repo should feel the same way to contribute to.
