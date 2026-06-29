# Changelog

All notable changes to the `debrief` skill are documented here.

This project follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.1] — 2026-06-26

### Changed
- Added "what are the takeaways" / "wrap up" to the trigger phrases, with an explicit note that a takeaways/wrap-up request still triggers — the skill turns it into recall rather than handing over a summary. A triggering eval (3 independent judges per query) found "wrap up — what are the 3 takeaways?" split the judges 2/3; this sits on the skill's core recap-vs-recall boundary and should reliably engage. The re-test resolved it to consensus "trigger." The status-summary / handoff-notes exclusion remains intact.

## [0.1.0] — 2026-06-25

Initial release.

### Added
- `skills/debrief/SKILL.md` — the skill itself: the five-step debrief loop (scope → bracket the recap → recall → expose-then-close the gap → make it stick), the recall discipline summary, the fluency-illusion framing, the acid test, and explicit when-NOT-to-debrief clauses. The note-writing step is deliberately held behind a pointer so the recall can't be shortcut into a passive recap.
- `references/recall-discipline.md` — how to ask: the testing and generation effects, Bloom-level targeting, worked good/bad question pairs, the fluency-illusion tells, handling "I don't know," and calibrating desirable difficulty.
- `references/lesson-note.md` — the durable-lesson format (atomic, transferable, question-cued) and how to save it to Obsidian or local markdown, plus setting up spaced revisit.
- `EXAMPLES.md` — five before/after debriefs (debugging, an architectural decision, catching the illusion live, saving a note to Obsidian) and two counter-examples where the skill correctly stays out of the way (a mechanical session and a mid-task moment).
- Plugin manifest at `.claude-plugin/plugin.json` and marketplace entry at `.claude-plugin/marketplace.json` for install.
- GitHub issue templates for recall-skipped reports and activation misfires.
- Test cases under `tests/cases/`.
