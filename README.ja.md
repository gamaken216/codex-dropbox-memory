# Codex Dropbox Memory

Codex Dropbox Memory は、複数のWindows PCでCodexを使う人向けの、Markdownベースの外部メモリキットです。

Codexのチャット履歴はPCごとに分かれます。このリポジトリでは、Dropboxで同期されるローカルフォルダを「共有メモリ」として使い、どのPCからでも同じ `memory.md` や `projects/` をCodexに読ませられるようにします。

関連記事: https://note.com/gamaken216/n/n155e9a80b026

## できること

- Codexが最初に読む `memory.md` を作る
- プロジェクト別メモリを `projects/` に残す
- 作業ログを `inbox/` に残す
- 日次要約を `daily/` にまとめる
- 日次要約・長期メモリ昇格用のプロンプトを使う
- PowerShellでログやプロジェクトメモを素早く作る

データベースもAPIもサーバーも使いません。Dropboxで同期されるMarkdownファイルだけで動きます。

## フォルダ構成

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

Dropbox内の別フォルダに置いても構いません。

```text
Dropbox\GAI\Codexmemory
```

## 5分で導入

このリポジトリをダウンロードまたはcloneして、次を実行します。

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-codex-memory.ps1 -Target "$env:USERPROFILE\Dropbox\Codexmemory"
```

別の場所に作る場合:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-codex-memory.ps1 -Target "$env:USERPROFILE\Dropbox\GAI\Codexmemory"
```

既存ファイルは上書きしません。上書きしたい場合だけ `-Force` を付けます。

## Codex起動時に使うプロンプト

新しいCodexスレッドの最初に、作成された `CODEX_STARTUP_PROMPT.md` の内容を貼り付けます。

短く言うと、Codexに次を指示します。

```text
DropboxのCodexメモリフォルダを探してください。
memory.mdを読み、必要ならprojects/も確認してください。
作業ログはinbox/へ、長期メモリはmemory.mdへ、プロジェクト文脈はprojects/へ整理してください。
memory.mdは短く保ってください。
```

## よく使うコマンド

セッションログを作る:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\new-session-log.ps1
```

今日の日次要約ファイルを作る:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\new-daily-summary.ps1
```

プロジェクトメモリを作る:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\new-project-memory.ps1 -Name "My Project"
```

現在の状態を確認する:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\collect-memory-status.ps1
```

## サンプル

プロジェクトメモリの例は [examples/project-memory-example.md](examples/project-memory-example.md) にあります。

## GitHub公開

公開手順とX投稿例は [PUBLISHING.md](PUBLISHING.md) にまとめています。

## 運用ルール

`memory.md` は短く保ちます。

その日の作業ログは `inbox/`、日次まとめは `daily/`、プロジェクト固有の文脈は `projects/` に入れます。`memory.md` に入れるのは、今後のCodexセッションで毎回役立つものだけです。

`memory.md` に入れてよいもの:

- ユーザーの永続的な好み
- 複数PC運用に必要なルール
- 継続中プロジェクトの重要な状態
- Codexが毎回知っておくべき注意点

入れない方がよいもの:

- その日だけの作業ログ
- 一時的なTODO
- 機密情報
- APIキー、パスワード、顧客情報

## 複数PCでの使い方

1. PC AでDropbox内にCodexmemoryフォルダを作る
2. Dropboxの同期を待つ
3. PC Bで同じフォルダが同期されていることを確認する
4. Codexの新しいスレッドで `CODEX_STARTUP_PROMPT.md` を貼る
5. どのPCでも同じ `memory.md` と `projects/` を参照できる

## 注意

- 実際のメモリフォルダには個人情報や業務情報が入る可能性があります。公開リポジトリに入れないでください。
- PowerShellの `-ExecutionPolicy Bypass` は、自分で内容を確認したスクリプトに限って使ってください。
- このリポジトリはテンプレートです。実運用のメモリ本体はprivateなDropboxフォルダに置く想定です。

## ライセンス

MIT
