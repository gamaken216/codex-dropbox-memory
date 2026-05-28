# Publishing Guide

## Recommended Repository Settings

- Repository name: `codex-dropbox-memory`
- Visibility: Public
- Description: `Markdown-based shared memory kit for using Codex across multiple PCs with Dropbox`
- License: MIT
- Default branch: `main`

## Publish With GitHub Desktop

1. Open GitHub Desktop.
2. Choose `File` -> `Add local repository`.
3. Select this repository folder.

   Example: the local folder where you cloned or downloaded `codex-dropbox-memory`.

4. Commit all files with this message:

```text
Initial release
```

5. Click `Publish repository`.
6. Keep it public if you want to share it from X and note.

## Publish With GitHub CLI

If GitHub CLI is installed and authenticated:

```powershell
git add .
git commit -m "Initial release"
gh repo create codex-dropbox-memory --public --source . --remote origin --push
```

## After Publishing

- GitHub: https://github.com/gamaken216/codex-dropbox-memory
- Add the GitHub URL near the top of the note article.
- Pin the repository or add it to a visible GitHub profile section.
- Post on X with both the GitHub URL and note URL.

## Suggested X Post

```text
Codexを複数PCで使うと、PCごとに文脈が分断される問題があります。

そこでDropboxを外部メモリにして、Codexが毎回 memory.md / projects / daily を読む仕組みを作りました。

テンプレートとPowerShellスクリプトをGitHubで公開しました。
Windows + Dropbox + Codex Desktop向けです。

GitHub:
https://github.com/gamaken216/codex-dropbox-memory

解説note:
https://note.com/gamaken216/n/n155e9a80b026
```

## Follow-Up X Post Ideas

- Show the folder structure screenshot.
- Show a before/after example: "Before: PCごとに説明し直し / After: projects/foo.md を読むだけ".
- Share a short clip or screenshot of Codex reading `memory.md`.
- Explain the key rule: "memory.mdを太らせず、projects/に逃がす".
