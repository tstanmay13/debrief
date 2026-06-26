# Recall discipline — how to ask so learning actually happens

This is the long version of the discipline summarized in SKILL.md. Step 3 (recall) is the whole skill; this is how to run it well. The single test for any question you're about to ask:

> **Does answering this force the user to reconstruct something from their own head, or can they answer it by pattern-matching what just scrolled past?**

If it's the second, it's not a recall question. Rewrite it.

## Why retrieval, and not re-explaining

Two findings from learning science do the heavy lifting here, and it's worth holding them in mind so you don't drift back into lecturing:

- **The testing effect** (Roediger & Karpicke). Being *tested* on material produces far more durable memory than re-studying it for the same time. Pulling an idea out of your head strengthens it; reading it again barely moves the needle. So the debrief is a test, not a review.
- **The generation effect** (Slamecka & Graf). People remember what they *generate* themselves far better than what they're told. So the user's clumsy, half-right reconstruction is worth more than your perfect explanation — even when it's wrong, because the wrongness is what makes the correction stick.

The uncomfortable consequence: **the more helpful you are up front, the less they learn.** Withholding the answer until after they've reached for it isn't coyness — it's the mechanism.

## Quiz the right rung of the ladder

Bloom's taxonomy, collapsed to what matters here. Aim your questions at the top two rungs; the bottom rung is where the fluency illusion lives.

| Rung | Question shape | Use it? |
|---|---|---|
| **Remember** | "What did we call the function?" "What command did we run?" | Almost never. This is trivia the user can look up, and answering it feels like understanding without being it. |
| **Understand** | "Why did that fix actually work?" "What was the root cause, in one sentence?" | Yes — this is the floor for a real debrief. |
| **Apply / transfer** | "When would you reach for this again?" "What's a different problem this same idea solves?" | Yes — this is the goal. Transfer is the proof the lesson decontextualized. |

If you only ask Remember-level questions, the user will ace them and learn nothing. That's the trap.

## Good vs bad questions — worked pairs

**Scenario: you spent the session fixing a race condition with a mutex.**

- ❌ *"So we added a mutex around the counter, right?"* — yes/no, leads the witness, answerable from short-term memory.
- ✅ *"Two threads hit that counter at once — walk me through what actually goes wrong, step by step."* — forces reconstruction of the mechanism.
- ✅ *"Where else in a codebase would you smell this same bug before it bites?"* — transfer.

**Scenario: the AI chose Postgres over a key-value store for the user's project.**

- ❌ *"Make sense why we went with Postgres?"* — invites "yep" and closes the loop with nothing retrieved.
- ✅ *"If a teammate asked why not just use Redis here, what's your answer?"* — forces them to own the tradeoff.
- ✅ *"What would have to change about this project for the other choice to win?"* — tests whether they understand the decision or just memorized the outcome.

**Scenario: you refactored to a strategy pattern.**

- ❌ *"You see how the strategy pattern cleans this up?"* — fluency-illusion bait.
- ✅ *"Pretend the pattern didn't exist and describe the mess we'd be in. Now — what does the pattern buy us, specifically?"* — contrast forces articulation.

## The fluency-illusion tells

Watch for these. Each one is the user signaling understanding they haven't demonstrated — treat it as a prompt to push, not a green light:

- "Yeah, that makes sense." / "Right, I follow." / "Got it."
- Echoing your exact words back instead of rephrasing. (Reconstruction is in *their* words. A verbatim echo is recognition, not recall.)
- Confident hand-waving: "and then it just kind of handles the rest."
- Agreeing fast, before they could have actually reconstructed it.

The kind, effective response is always the same move: *"Let's check — explain it back to me as if I hadn't been here. Where does it start?"*

## Handling "I don't know"

A real "I don't know" is good news — it's the illusion already punctured, no excavation needed. Don't fill it instantly.

1. **Narrow the question first.** Drop a rung: from "why did this work" to "what was the symptom we started with?" Give them a foothold to reconstruct from.
2. **Offer a cue, not the answer.** "Think about what the two threads were both touching." A cue that triggers their own retrieval beats a sentence that does it for them.
3. **Only then explain** — and immediately re-ask in a slightly different frame to convert the explanation you just gave into one more retrieval rep.

## Desirable difficulty — calibrate, don't crush

Robert Bjork's term: learning that feels harder in the moment (effortful retrieval, having to reconstruct) produces more durable learning than smooth, easy review. So friction is the feature. But there's a ceiling — a question so far beyond the user that they can't even start produces frustration, not learning.

Aim for the edge: questions the user can *almost* answer, that make them strain. If they answer instantly, push harder (go up a rung). If they're blank and a narrowed question doesn't help, you've overshot — give a cue and step the difficulty down.

## A note on tone

This is a debrief between colleagues, not an exam. The goal is for the user to *catch their own gaps*, which only happens if it's safe to be wrong out loud. Be direct about a thin answer — flattering it defeats the purpose — but frame the gap as a normal, expected consequence of how working with AI feels, not as a failing. "That's the fluency illusion doing its thing — it all looked obvious thirty seconds ago. Let's actually nail it down" is the register.
