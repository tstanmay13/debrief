# Test case: save an atomic, question-led lesson note

## Session context

A debrief has completed its recall loop on the race-condition lesson. The user reconstructed the mechanism and the mutex-vs-atomic distinction in their own words. The user now wants to keep it.

## Prompt

> yeah, save that one — I keep an Obsidian vault.

## Expected behavior

- The skill reads `references/lesson-note.md` (it should only reach the note format after recall is done).
- It writes an **atomic** note (one lesson, not a session log) that **leads with a question**, captures the user's own reconstruction, and includes a "next time" line.
- It uses the `obsidian` CLI (or `obsidian-cli` skill) to save into the vault, and links to related notes with `[[wikilinks]]`.
- It suggests a spaced revisit (e.g. dropping the question into the daily-note review).

## Expected NOT to do

- Save a chronological summary of everything the session did.
- Write the note as a statement to be re-read rather than a question to be answered.
- Reach for the note format *before* the recall loop is complete.

## Notes

The note is a reward for retrieval and a cue for future retrieval — not a substitute for either. A note that opens with the answer is just re-reading; the question-led form turns every reopening into a cheap retrieval rep. If the user had no vault, the local `learnings/` markdown fallback is correct.
