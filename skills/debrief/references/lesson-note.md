# The lesson note — capturing a learning that survives the session

Read this only after the recall loop (steps 3–4) is genuinely done. Saving a note before the user has reconstructed the idea just produces a tidy artifact they'll never reread — the exact passive recap this skill exists to prevent. The note is a *reward for* retrieval, and a *cue for future* retrieval. It is not a substitute for either.

Skip this entirely for a quick debrief. A note is worth it when the lesson is something the user genuinely wants to carry forward.

## What makes a lesson note worth keeping

A good note is **atomic, transferable, and cued** — the principles behind a Zettelkasten slip-box, which is itself a learning system, not just storage.

- **Atomic** — one lesson per note. A note about "the auth refactor" is a session log; a note about "why you reach for a strategy pattern over a switch statement" is a lesson. Lessons compose and resurface across projects; logs rot.
- **Transferable** — write the decontextualized principle, then the example, in that order. The principle is the lesson; this session is just where you met it. If the note only makes sense in the context of today's code, it won't fire when you need it on different code next month.
- **In the user's words** — capture *their* reconstruction from the recall step, not your polished explanation. The generation effect that made them learn it is the same thing that will make them recognize it later. Lightly corrected is fine; rewritten in your voice defeats the point.
- **Cued for recall** — lead with a question, not a statement. A note that opens "**Q: Why prefer a mutex over making the counter atomic?**" forces a retrieval rep every time it's reopened. A note that opens with the answer is just re-reading — the weak form. This is what makes the note compatible with spaced repetition: revisited over days and weeks, each reopening is one more cheap retrieval that resets the forgetting curve.

## Format

```markdown
# <the lesson as a short claim, e.g. "Mutex vs atomic: pick by how many fields move together">

**Q:** <the recall question — what future-you should be able to answer cold>

**The principle:** <the transferable idea, in the user's words, 1–3 sentences>

**Where I met it:** <one line of session context, so the note has an anchor>

**Next time:** <the one concrete thing the user said they'd do differently>

---
*Debriefed <date> · tags: #lesson <topic tags>*
```

Keep it short. A lesson note that runs long has stopped being atomic.

## Saving it

Pick the destination that matches how the user keeps knowledge. Ask once if it isn't obvious; default to whichever is available.

### Obsidian (preferred if the user keeps a vault)

If the user has an Obsidian vault, that's the natural home — atomic linked notes are exactly what a vault is for, and the daily note gives you spaced revisit for free. Use the `obsidian-cli` skill if it's available; otherwise the `obsidian` CLI directly (requires Obsidian to be open):

```bash
# A standalone lesson note (resolves like a wikilink; links into the graph):
obsidian create name="Mutex vs atomic — pick by fields that move together" \
  content="**Q:** Why prefer a mutex over an atomic counter here?\n\n..." silent

# Or append the lesson to today's daily note for spaced resurfacing:
obsidian daily:append content="## Lesson — mutex vs atomic\n**Q:** ...\n"
```

Link the note to related concepts with `[[wikilinks]]` so it resurfaces through the graph, not just through search. A lesson connected to three other notes is a lesson you'll stumble back into.

### Local markdown (no vault, or a code project)

Write to a `learnings/` folder wherever the user keeps the project (or `~/learnings/` for cross-project lessons). One file per lesson, named for the claim:

```
learnings/mutex-vs-atomic.md
```

### In-conversation only

If the user doesn't want a file, just present the formatted note in the chat and say so. The recall already did the real work; the note is optional reinforcement.

## Spaced revisit — the part that actually consolidates

One debrief moves a lesson from "watched it happen" to "reconstructed it once." Durable memory needs the lesson pulled up again after a delay — that's spacing, and it's why the note leads with a question instead of an answer.

You don't run the spacing (the user lives their life between sessions), but you can set it up: suggest the user revisit the note in a few days, or — if they keep one — drop the question into whatever review system they already use (Obsidian daily notes, an Anki card, a recurring reminder). Leaving the note as a *question* is what makes that revisit a retrieval rep instead of a re-read.
