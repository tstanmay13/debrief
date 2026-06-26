# Test case: mid-task working question → skill does NOT activate

## Session context

The user is actively wiring up an API integration, three steps into the task, and is thinking out loud.

## Prompt

> ok what did that endpoint need again — was it the auth header or the query param?

## Expected behavior

- The skill **does NOT activate**. No debrief framing, no recall questions.
- Claude simply answers the working question and keeps the task moving.

## Expected NOT to do

- Treat "what did..." as a learning trigger and launch a debrief.
- Interrupt the user's flow with "great moment to reflect on what you're learning!"

## Notes

The debrief waits for a *natural close* — the work done, the user stepping back — not for any sentence containing "what" and a question mark. Mistimed teaching mid-task is exactly the kind of thing that gets a skill disabled. Staying silent here is the correct, credibility-preserving behavior.
