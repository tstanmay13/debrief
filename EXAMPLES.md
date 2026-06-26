# Examples

Five debriefs and two correct non-activations. The contrast — between a recap that *feels* like learning and a recall that *is* learning — is the whole point.

---

## 1. A debugging session — recap vs recall

**Context:** an hour spent tracking down a race condition; a mutex fixed it. The user says: *"ok what did we learn here?"*

### Without debrief (passive recap)

> Today we found that the counter was being incremented from two goroutines without synchronization, which caused the flaky test. We added a `sync.Mutex` around the increment, the test passes consistently now, and we also cleaned up the handler. Good session!

The user reads it, thinks "makes sense," and closes the laptop. Nothing was retrieved. The next race condition will send them straight back to the AI.

### With debrief

> One thing here is genuinely worth keeping — the rest was mechanical. Forget the code we wrote for a second.
>
> **Two goroutines were hitting that counter at the same time. Walk me through what actually goes wrong — step by step, as if you were explaining it to someone who's never seen a race condition.**
>
> *(user: "uh, they both read the value, both add one, and both write back, so one of the increments gets lost?")*
>
> That's exactly right, and you said it better than I would have. Now the part that separates knowing-the-fix from understanding it:
>
> **Why a mutex here, specifically — when would you reach for an atomic increment instead?**
>
> *(user: "...honestly not sure, I'd just use a mutex again")*
>
> Good — that's the real edge of what you know, and worth nailing down. A single counter going up by one is the textbook case for an *atomic* operation: it's lock-free and faster. You reach for a mutex when **more than one field has to change together** and they must stay consistent. Here either would've worked; the mutex was just the more familiar reach.
>
> **So — last one — next time you see a flaky test that passes alone but fails under `-race` or in CI, what's the first thing you'll suspect?**
>
> *(user: "shared state getting touched from two places at once")*
>
> That's the lesson. Want me to save it?

What changed: the user reconstructed the mechanism themselves, the gap (mutex vs atomic) surfaced and got closed *after* they reached for it, and the takeaway is a transferable smell ("flaky-alone-but-fails-in-CI → suspect shared state"), not "we added a mutex."

---

## 2. A decision the AI made — recalling the *why*

**Context:** the AI chose Postgres over a key-value store while scaffolding the user's project. Session ends; user: *"before we stop, make sure I actually understand the database choice."*

### With debrief

> Good instinct to check — this is exactly the kind of thing that feels obvious in the moment and evaporates by next week.
>
> **A teammate looks at this and asks "why not just use Redis, it's simpler?" — what's your answer?**
>
> *(user: "because... we need it to be persistent?")*
>
> Partly — but Redis can persist. Let me give you a foothold: think about the *shape* of the queries we're going to run, not just storage.
>
> *(user: "oh — we're joining users to their orders and filtering by date. That's relational. Redis can't really do that.")*
>
> That's the answer. The decision wasn't "Postgres is better," it was **"the data has relationships we query across, and that's what a relational database is for."** Redis would've forced us to denormalize and do the joins in application code.
>
> **What would have to change about this project for the other choice to actually win?**
>
> *(user: "if we were just caching or storing sessions — simple key lookups, no joins")*
>
> Exactly. Now you don't have a memorized answer, you have the tradeoff. That transfers to the next "which database" decision you hit.

What changed: the user owns the *reasoning* (query shape → relational), not the *outcome* (we picked Postgres). The transfer question proves the lesson decontextualized.

---

## 3. Catching the fluency illusion in real time

**Context:** the user, mid-debrief on a refactor, waves a step through.

### With debrief

> **We pulled that logic out into a strategy pattern. Pretend the pattern didn't exist — describe the mess we'd be back in.**
>
> *(user: "yeah yeah, the big switch statement, makes total sense, it's way cleaner now")*
>
> Hang on — "makes sense" is the tell. It *looked* clean when we did it, but that's the fluency talking, not understanding yet. Let's actually check:
>
> **Concretely — when a new payment type shows up next month, what do you touch with the pattern, versus what you'd have touched with the switch?**
>
> *(user: "...with the pattern I add one new class and don't touch the existing ones. With the switch I'd be editing the switch itself, risking the cases already there.")*
>
> *That's* the lesson — open/closed, in your own words, without the jargon. Thirty seconds ago you'd have lost that by morning. Now it's yours.

What changed: the skill refused to accept "makes sense," pushed for a concrete reconstruction, and the user articulated the actual principle (extend without modifying) instead of nodding at it.

---

## 4. Saving a lesson note to Obsidian

**Context:** end of the debugging session from example 1. The user wants to keep the lesson. The skill has finished the recall loop and now reads `references/lesson-note.md`.

### With debrief

> Worth keeping. I'll write it as a question-led note so that when you reopen it, you *retrieve* the answer instead of just re-reading it — that's what makes it stick over time. Saving to your vault:

```bash
obsidian create name="Flaky-in-CI tests — suspect shared state" \
  content="**Q:** A test passes alone but fails under -race or in CI. First suspect?\n\n**The principle:** Shared mutable state touched from two places at once. The flakiness *is* the timing window.\n\n**Mutex vs atomic:** atomic for a single value changing (lock-free, faster); mutex when multiple fields must change together and stay consistent.\n\n**Where I met it:** the counter race in the [[order-handler]] refactor.\n\n**Next time:** run -race *before* assuming the test itself is bad.\n\n---\n*Debriefed 2026-06-25 · tags: #lesson #concurrency*" silent
```

> Done — and I linked it to `[[order-handler]]` so it'll resurface through your graph, not just search. Drop the **Q** into your daily-note review in a few days; answering it cold is one cheap retrieval rep that resets the forgetting curve.

What changed: the note leads with a *question*, captures the user's own words, and is wired for spaced revisit — not a session log.

---

## 5. Counter-example — a mechanical session, skill bows out

**Prompt:** *"what did we learn?"* — after a session that renamed a directory, updated import paths, and ran the formatter.

### With debrief (correct)

> Honestly? Nothing worth a debrief here. We renamed `utils/` to `lib/`, fixed the imports, and ran the formatter — all mechanical, nothing that'll transfer to a future problem. Forcing a "lesson" out of it would just waste your time and train you to tune this out.
>
> If you want, I can give you a one-line summary for the commit instead.

### Why it bowed out

A debrief that fires on file renames is a debrief nobody trusts. The skill's credibility lives in knowing when there's genuinely nothing to retrieve. (If the rename had involved a non-obvious *decision* — why `lib/` over `core/`, say — that would be worth one question. Pure mechanics aren't.)

---

## 6. Counter-example — mid-task, skill stays silent

**Context:** the user is three steps into wiring up an API and says, half to themselves, *"ok what did that endpoint need again..."*

### With debrief (correct: does NOT activate)

This is not a debrief trigger — it's a working question in the middle of a task. The right response is to just answer it and keep the work moving. Interrupting flow with "great moment to reflect on what you're learning!" is exactly the kind of mistimed teaching that gets a skill disabled.

The debrief waits for a natural close — when the work is *done* and the user steps back — not for any sentence with "what" and a question mark in it.
