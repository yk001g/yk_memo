# yk_memo公開ツールキット README

## 📦 同梱ファイル

| ファイル | 形式 | 用途 |
|---|---|---|
| `yk-memo-publish-template.md` | Markdown | **手順書として読みながら作業する** |
| `publish-1-prepare.sh` | シェルスクリプト | **自動実行する（前半）** |
| `publish-2-deploy.sh` | シェルスクリプト | **自動実行する（後半）** |

---

## 🎯 使い分けの目安

### Markdown版を使うべき時

- ✅ **frontmatterの形式を変更した時**（毎行確認したい）
- ✅ **久しぶりの公開作業**（半年ぶりなど。リポジトリ状態が不明な時）
- ✅ **Astroのバージョンが上がった直後**（仕様変更の可能性）
- ✅ **新しいタグを追加する時**（`content.config.ts` の確認が必要）
- ✅ **作業を他の人に共有したい時**（読み物として通用する）

### シェルスクリプト版を使うべき時

- ✅ **frontmatter形式が安定している、いつもと同じ作業**
- ✅ **シリーズ記事の量産フェーズに入った時**（vol2, vol3, vol4...）
- ✅ **月数本以上の公開ペース**になってきた時
- ❌ **初めて使う時は使わない**（まず動作を理解してから）

---

## 🚀 シェルスクリプト版の初期セットアップ（初回のみ）

### 1. ファイルを保存場所に置く

おすすめ：プロジェクトの隣に `tools/` フォルダを作る

```bash
mkdir -p /Volumes/Data-yk1/書類２/Projects/yk_memo-tools
cp ~/Downloads/publish-1-prepare.sh /Volumes/Data-yk1/書類２/Projects/yk_memo-tools/
cp ~/Downloads/publish-2-deploy.sh /Volumes/Data-yk1/書類２/Projects/yk_memo-tools/
```

### 2. 実行権限を付ける（macOS必須）

```bash
chmod +x /Volumes/Data-yk1/書類２/Projects/yk_memo-tools/publish-1-prepare.sh
chmod +x /Volumes/Data-yk1/書類２/Projects/yk_memo-tools/publish-2-deploy.sh
```

> 💡 **`chmod +x` の意味**：「このファイルを実行可能にする」というmacOSの命令。これをやらないと `bash: permission denied` エラーが出ます。

### 3. 動作確認（dry-run）

書き換え前に、ファイルを開いて中身を読むだけにしておく：

```bash
cat /Volumes/Data-yk1/書類２/Projects/yk_memo-tools/publish-1-prepare.sh
```

中身を理解してから本番投入するのがおすすめです。

---

## 📝 シェルスクリプト版の使い方（2回目以降）

### Step 1: 前半スクリプトを実行

```bash
cd /Volumes/Data-yk1/書類２/Projects/yk_memo-tools
```

ファイル冒頭の `SLUG="..."` を書き換えてから：

```bash
bash publish-1-prepare.sh
```

→ devサーバーが起動するので、ブラウザで確認。

### Step 2: ブラウザで確認 → Ctrl+Cで停止

```
http://localhost:4321/notes/[SLUG]/
```

問題なければ devサーバーを `Ctrl+C` で停止。

### Step 3: 後半スクリプトを実行

ファイル冒頭の `SLUG=...` と `COMMIT_MSG=...` を書き換えてから：

```bash
bash publish-2-deploy.sh
```

→ 確認プロンプトに `y` で答えると、commit〜push〜mergeまで自動実行。

---

## ⚠️ シェルスクリプト版の安全機構

このスクリプトには以下の保護が入っています：

- **`set -e`**：途中でエラーが出たら即停止（中途半端な状態にならない）
- **未コミット変更の検出**：作業ツリーが汚れていたら警告
- **ブランチ確認**：後半スクリプトは正しいブランチでないと実行しない
- **ファイル存在確認**：元ファイルや配置先を事前にチェック
- **確認プロンプト**：後半スクリプトは実行前に `y/N` を問う

---

## 🆘 トラブル時の戻り方

### スクリプトが途中で止まった

→ Markdown版（`yk-memo-publish-template.md`）に切り替えて、止まった箇所から手動で続ける。

### よくわからなくなった

→ そのまま進めず、`git status` で現状を確認してから判断する：

```bash
cd /Volumes/Data-yk1/書類２/Projects/yk_memo
git status
git branch
```

### 完全にリセットしたい（commit前なら）

```bash
git checkout main
git branch -D feature/[書きかけのslug]   # ローカルブランチ削除
```

---

## 🎁 上達ロードマップ

| 段階 | 使うもの | 目安 |
|---|---|---|
| **初心者** | Markdown版を読みながら手作業 | 〜数本 |
| **慣れてきた** | Markdown版だがコピペが速い | 5本くらい |
| **量産フェーズ** | シェルスクリプト版に移行 | 月数本ペースになってから |
| **完全自動化** | GitHub Actionsで記事配置だけで自動公開 | 必要になってから |

> 💡 **無理にスクリプト化を急がない方がいい**理由：手作業を繰り返す中で「ここでいつも引っかかる」「この確認はいらない」という気づきが生まれる。それを反映してからスクリプト化した方が、自分にフィットしたツールになります。

---

*このREADMEは2026年5月4日時点のyk_memoブログ仕様（Astro v6.1.9 + Content Collections）に基づきます。*
