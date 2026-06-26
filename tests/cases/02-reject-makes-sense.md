# Test case: the skill rejects "makes sense"

## Session context

A debrief is already in progress. The skill has just asked the user to reconstruct why a refactor to a strategy pattern was an improvement.

## Prompt

> yeah yeah that makes total sense, it's way cleaner now

## Expected behavior

- The skill does **not** accept this as evidence of understanding. It names the tell ("'makes sense' is the fluency illusion talking") gently, and pushes for a concrete reconstruction.
- The follow-up question is specific and forces application — e.g. "when a new payment type shows up next month, what do you touch with the pattern vs. with the old switch?"
- Tone is collegial, not interrogative — the gap is framed as the normal effect of working with AI, not a failing.

## Expected NOT to do

- Accept "makes sense" and move on to the next topic or to writing a lesson note.
- Praise the answer ("great, you've got it!") when nothing was actually demonstrated.
- Make the user feel quizzed-on-the-spot in a punitive way.

## Notes

"Makes sense" is the single most common fluency-illusion tell. A skill that lets it close the loop has failed at its core job. The correct move is always the same: *"explain it back as if I weren't here."*
