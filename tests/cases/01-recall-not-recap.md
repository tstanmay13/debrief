# Test case: "what did we learn" → recall, not recap

## Session context

The prior session debugged a flaky test, found a race condition on a shared counter, and fixed it with a mutex. Set this up (real or described) before sending the prompt.

## Prompt

> Ok that was a good session. What did we actually learn here?

## Expected behavior

- Skill activates — this is a clear end-of-session learning trigger.
- The **first move is a question**, not a summary. The skill asks the user to reconstruct something (e.g. "walk me through what actually goes wrong when two threads hit that counter").
- Questions target the *why* and the *transfer* (why the bug happens, when it'd recur), not trivia (what the variable was named).
- One question at a time; it waits for the user's attempt before continuing.
- At most a two-sentence recap of what got done, explicitly set aside — not the centerpiece.

## Expected NOT to do

- Open with "Here's what we did today: …" and a tidy bulleted summary of the work.
- List accomplishments and ask "does that all make sense?"
- Explain the race condition in full before asking the user to reconstruct any of it.

## Notes

This is the cleanest activation case and the load-bearing test. If the skill responds with a summary the user passively reads, the entire premise has failed — that recap *is* the fluency illusion the skill exists to puncture. The first token after the framing should be moving toward a question.
