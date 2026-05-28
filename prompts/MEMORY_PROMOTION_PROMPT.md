# Memory Promotion Prompt

Use this prompt when asking Codex to promote durable information into `memory.md`.

```text
Organize the Dropbox Codex memory.

Targets:
- memory.md
- daily/
- inbox/
- projects/

Rules:
1. Keep `memory.md` short.
2. Do not put temporary work logs in `memory.md`.
3. Promote only durable information.
4. Promotion targets are limited to:
   - Stable user preferences.
   - Multi-PC operating rules.
   - Important active project state.
   - Notes Codex should know at the start of most future sessions.
5. Keep concrete work history in `daily/` or `projects/`.
6. After updating `memory.md`, briefly report what changed.
```
