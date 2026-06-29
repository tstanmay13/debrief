---
name: debrief
description: Debrief a finished work session into actual learning instead of just output. Make the user recall and reconstruct what happened in their own words before you fill any gaps, catch the fluency illusion (feeling you learned something you only watched get done), and distill one or two durable, transferable lessons. Use when the user asks "what did we learn", "what have we learned this session", "what are the takeaways", "did I actually learn this", "teach me what we just did", wants to reflect or wrap up at the end of a session, or worries they're executing without understanding. A "give me the takeaways / wrap-up" request still triggers — the skill turns it into recall rather than handing over a summary. Proactively offer it after a substantial build, debugging, or decision session. Do NOT use mid-task when the user just wants the work finished, for purely mechanical sessions with nothing transferable, or when the user wants a status summary or handoff notes rather than to learn.
license: MIT
metadata:
  version: 0.1.1
---

# debrief

> Output is not understanding. Retrieval is the test.

A structured end-of-session debrief that converts a finished piece of work into something the user actually knows — by making them *reconstruct* it, not read it back.

## The principle

A work session produces output: code that runs, a bug that's fixed, a decision that's made. Whether the *user* can reproduce any of it next week — without the AI, without notes — is a separate question. Output answers the first. Only retrieval answers the second.

The whole job of this skill is to keep those two apart. The session already handled the output. The debrief exists to find out, and then improve, what the user can do on their own.

This is an old discipline under many names: the military **after-action review**, the aviation and surgical **debrief**, the agile **retrospective**. They share one move — reconstruct what happened *before* anyone hands you the answer — and one finding: the reconstruction is where the learning is, not the recap.

## The enemy: the fluency illusion

When you watch an expert (or an AI) do something fluently, your brain reads that fluency as your own understanding. It isn't. You can follow every step in the moment and reproduce none of it cold. Psychologists call the general effect the **illusion of explanatory depth** — people are sure they understand how a zipper or a government works until asked to explain it, and the confidence collapses on contact with retrieval.

Working with a capable AI is a fluency-illusion machine. The work flows past, it all makes sense, the session feels productive — and the user ends it no more able to do the thing than when they started. That feeling of "yeah, I get it" is the symptom, not the evidence.

Every move in this skill is built to puncture that illusion early, while it's cheap to fix, instead of letting the user discover it next week when they're stuck.

## The debrief loop

Run these in order. Each step ends when its **done-when** is true — don't move on early, and especially don't skip ahead to the satisfying write-up.

**1. Scope it.** Skim the session and pick the **one to three** ideas actually worth keeping — the load-bearing concepts, the *why* behind a decision, the pattern that transfers. Not everything that happened. If the session was pure mechanical execution with nothing transferable (renamed files, ran a formatter, looked up a fact they'll never need again), say so plainly and stop. Forcing a lesson where there isn't one is theatre.
   *Done when:* you have a short candidate list, or an honest "nothing here worth a debrief."

**2. Bracket the recap.** Name what the session *did* in at most two sentences, then set it aside out loud. The recap is orientation, not the product. If you find yourself writing a tidy summary of everything you built, stop — that's the failure mode wearing a helpful face.
   *Done when:* the work is summarized in ≤2 sentences and explicitly set aside.

**3. Recall.** This is the skill. For each candidate idea, ask the user to reconstruct it **in their own words**, one question at a time, and *withhold the answer*. How you ask decides whether this works — follow the **recall discipline** below. This step is effortful for the user by design; that difficulty is the learning, not a flaw in the process.
   *Done when:* the user has made a real reconstruction attempt at each idea — an actual explanation, not "makes sense."

**4. Expose the gap, then close it — in that order.** Compare each reconstruction to what's true. Where it was thin, vague, or confidently wrong, name that plainly and kindly: that is the fluency illusion caught in the act, and naming it is most of the cure. *Only then* fill in or correct — feedback lands hardest in the seconds after a retrieval attempt, never before one. Correct only the shaky ideas; leave the solid ones alone.
   *Done when:* each idea is marked solid / shaky / illusion, and every shaky-or-illusion one has a correct restatement in the user's own words.

**5. Make it stick.** For each surviving lesson, distill the **transferable principle** — decontextualized, so it applies to the next problem and not just this one — and name one concrete thing the user will do differently next time. If the user wants to keep the lesson, read `references/lesson-note.md` and save it. Don't read that file until step 4 is genuinely done — saving a note is a reward for recall, not a substitute for it.
   *Done when:* the acid test passes for each lesson kept.

## The recall discipline

How you ask in step 3 is the whole ballgame. Get this wrong and the debrief collapses back into a lecture the user nods through.

- **Ask before you tell.** Never lead with the answer. The first move is always a question.
- **One question at a time.** Wait for a real attempt before the next. (Same instinct as a good grilling: walk one branch to the ground before opening another.)
- **"Makes sense" is not evidence — it's the illusion talking.** When the user signals understanding without demonstrating it, push: *show me — explain it back as if I weren't here.*
- **Quiz the *why* and the *transfer*, not the trivia.** "Why did that fix actually work?" and "when would you reach for this again?" build understanding. "What did we name the variable?" builds nothing.
- **Don't correct until they've tried.** A wrong attempt followed by correction beats a right answer handed over. Sit with the silence.
- **Don't praise a thin answer to be nice.** Hollow reassurance reseals the illusion you're trying to puncture.
- **Tune the difficulty so they stretch, not drown.** If they're lost, narrow the question; if it's easy, push to application.

Full version with worked good/bad question pairs, how to handle "I don't know," and the fluency-illusion tells: `references/recall-discipline.md`.

## The acid test

Before you call a lesson learned, ask yourself:

> If I posed this same question to the user cold next week — no AI, no notes — could they answer it from their own understanding?

If all they did was nod along, the answer is no, and the debrief isn't done. Go back to step 3 on that idea.

## When NOT to debrief

Staying out of the way matters as much as showing up. Don't run a debrief:

- **Mid-task.** The user is executing and wants the work finished. Interrupting flow to teach is a tax, not a gift. Wait for a natural close.
- **On a mechanical session.** Nothing transferable happened. A forced "lesson" about renaming files is a no-op that trains the user to ignore the skill.
- **When they want a recap, not learning.** Status summaries, handoff notes, and changelogs are legitimate and different jobs. Don't hijack them into a quiz.

A debrief that fires everywhere gets muted. The credibility of the skill is in knowing when to sit down.

## References

- `references/recall-discipline.md` — how to ask: good vs bad questions, Bloom levels, handling "I don't know," the fluency-illusion tells, desirable difficulty.
- `references/lesson-note.md` — the durable-lesson format and how to save it (Obsidian or a local file). Read only after the recall loop is done.
