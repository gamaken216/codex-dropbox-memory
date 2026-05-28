# Codex Dropbox Memory

日本語版: [README.ja.md](README.ja.md)

Codex Dropbox Memory is a small Markdown-based memory kit for people who use Codex across multiple Windows PCs.

Codex can keep local thread history on one machine, but that context does not automatically travel between PCs. This repository uses Dropbox as a simple shared folder, so Codex can read and write the same memory files from every machine.

## What This Gives You

- A portable `memory.md` that Codex can read at the start of a new thread.
- Project-specific memory files under `projects/`.
- Raw session logs under `inbox/`.
- Daily summaries under `daily/`.
- Reusable prompts for daily rollups and long-term memory promotion.
- PowerShell helpers for creating logs and checking memory status.

No database, no API, no server. Just Markdown files in a synced Dropbox folder.

## Recommended Folder Structure

```text
Dropbox\Codexmemory\
  memory.md
  CODEX_STARTUP_PROMPT.md
  SESSION_TEMPLATE.md
  DAILY_SUMMARY_TEMPLATE.md
  PROJECT_MEMORY_TEMPLATE.md
  inbox\
  daily\
  projects\
  summaries\
  prompts\
  scripts\
  archive\
```

You can also place it under a business or workspace folder, for example:

```text
Dropbox\GAI\Codexmemory
```

## Quick Start

Clone or download this repository, then run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-codex-memory.ps1 -Target "$env:USERPROFILE\Dropbox\Codexmemory"
```

If you prefer another location:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-codex-memory.ps1 -Target "$env:USERPROFILE\Dropbox\GAI\Codexmemory"
```

The installer creates the folder structure and copies templates, scripts, and prompts. It will not overwrite existing files unless you pass `-Force`.

## Startup Prompt For Codex

At the beginning of a new Codex thread, paste the contents of:

```text
CODEX_STARTUP_PROMPT.md
```

The short version is:

```text
Use the Dropbox Codex memory folder for this work.
Find the memory folder, read memory.md, and read project files if needed.
Save raw work notes in inbox/ and durable project context in projects/.
Keep memory.md short and only promote stable information.
```

## Daily Workflow

Create a session log:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\new-session-log.ps1
```

Create or open today's daily summary:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\new-daily-summary.ps1
```

Create a project memory file:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\new-project-memory.ps1 -Name "My Project"
```

Check current memory status:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\collect-memory-status.ps1
```

## Example

See [examples/project-memory-example.md](examples/project-memory-example.md) for a project memory example.

## Publishing

If you are turning this into your own public repository, see [PUBLISHING.md](PUBLISHING.md).

## Memory Promotion Rule

Keep `memory.md` short.

Put temporary details in `inbox/` or `daily/`. Put project-specific state in `projects/`. Promote only durable context into `memory.md`, such as:

- Stable user preferences.
- Multi-PC operating rules.
- Important active project state.
- Things Codex should know at the start of most future sessions.

## Typical Use With Multiple PCs

1. Install this memory folder inside Dropbox on PC A.
2. Wait for Dropbox to sync.
3. On PC B, open the same synced folder.
4. Start Codex and paste `CODEX_STARTUP_PROMPT.md`.
5. Codex reads the same `memory.md` and `projects/` files on both PCs.

## Safety Notes

- Do not put secrets, API keys, passwords, or private customer data in public templates.
- If you use this for real work, keep your actual memory folder private.
- Review PowerShell scripts before running them, especially when using `-ExecutionPolicy Bypass`.

## License

MIT
