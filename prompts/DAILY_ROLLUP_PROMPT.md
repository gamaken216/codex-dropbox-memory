# Daily Rollup Prompt

Use this prompt when asking Codex to summarize inbox logs into `daily/YYYY-MM-DD.md`.

```text
Use the Dropbox Codex memory folder and summarize today's work logs.

Steps:
1. Read `memory.md`.
2. Read the target day's logs from `inbox/`.
3. Update `daily/YYYY-MM-DD.md`.
4. Use these sections:
   - Executive Summary
   - Work Completed
   - Decisions
   - Open Follow-Ups
   - Memory Updates To Promote
   - Source Logs
5. Do not directly bloat `memory.md`.
6. If something deserves long-term memory, list it as a promotion candidate.
```
