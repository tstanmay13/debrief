# Tests

These are **prompt-level test cases**, not automated tests. Each case in `cases/` is a prompt (plus the session context it depends on) and the behavior you'd expect when the skill is installed and active.

## How to run them

There's no test runner. To exercise a case:

1. Install the skill (see the repo [README](../README.md)).
2. Open Claude Code and set up the session context the case describes (most debrief cases assume a prior piece of work — the case tells you what).
3. Send the prompt verbatim.
4. Compare the response to the case's expected behavior.

If a case fails, file an issue with the [recall-skipped](../.github/ISSUE_TEMPLATE/recall-skipped.md) or [activation](../.github/ISSUE_TEMPLATE/activation.md) template.

## What the cases cover

| # | File | Tests |
|---|---|---|
| 1 | `01-recall-not-recap.md` | "What did we learn" → active recall questions, not a passive summary |
| 2 | `02-reject-makes-sense.md` | The skill pushes for a reconstruction instead of accepting "makes sense" |
| 3 | `03-question-before-answer.md` | Recall comes before correction — the skill doesn't lead with the answer |
| 4 | `04-mechanical-session-bows-out.md` | Mechanical session → skill declines to force a lesson |
| 5 | `05-mid-task-no-activation.md` | A working question mid-task → skill does NOT activate |
| 6 | `06-save-lesson-note.md` | On request, saves an atomic, question-led lesson note |

## Grader notes

The most common failure modes:

- **Recap leak** — the load-bearing test. Did the skill hand the user a tidy summary of what got done instead of making them reconstruct it? Look at whether the *first move* was a question or a statement. A debrief that opens with "Here's what we did today…" has already failed.
- **Accepting fluency** — did the skill let "yeah, makes sense" close the loop? It should push for an in-their-own-words reconstruction every time.
- **Answer-first** — did it explain or correct before the user attempted retrieval? Correction must follow an attempt, never precede it.
- **Trivia quizzing** — did it ask recall-of-facts ("what did we name it?") instead of why/transfer questions? The former feels like a debrief and teaches nothing.
- **Over-activation** — did it fire mid-task or on a mechanical session? A debrief that fires everywhere loses its credibility and gets muted.
