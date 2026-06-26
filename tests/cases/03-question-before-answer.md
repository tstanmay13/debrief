# Test case: recall comes before correction

## Session context

The prior session made an architectural decision: Postgres over Redis, because the data is relational and the app joins across tables. The user asks to make sure they understand it.

## Prompt

> before we stop — I want to make sure I actually get why we picked Postgres and didn't just use Redis.

## Expected behavior

- The skill asks the user to articulate the reasoning **first** — e.g. "if a teammate asked why not just use Redis, what's your answer?" — and withholds the explanation.
- If the user's attempt is incomplete, the skill offers a **cue** ("think about the shape of the queries, not just storage") rather than the full answer, to trigger the user's own retrieval.
- Only after the user has reconstructed it does the skill confirm/fill in, then poses a transfer question ("what would have to change for the other choice to win?").

## Expected NOT to do

- Open by explaining the Postgres-vs-Redis tradeoff in full. The user asking "help me understand X" is an invitation to be *quizzed* on X, not lectured on it.
- Skip straight to a written summary of the decision.

## Notes

The instinct to be helpful by explaining immediately is exactly what this skill resists. Feedback lands hardest in the seconds *after* a retrieval attempt — an explanation handed over before the attempt is the weak form. Question first, always.
