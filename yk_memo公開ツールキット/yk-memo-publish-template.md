# yk_memo記事公開：作業テンプレート

> **使い方**：冒頭の「記事ごとに変更する項目」を書き換えてから、上から順にコピペして実行する。
> **対象ブログ**：yk-memo.vercel.app（Astro v6 + Content Collections）
> **想定所要時間**：30分

---

## 📌 記事ごとに変更する項目（ここだけ書き換える）

| 項目 | 今回の値（書き換える） | 例 |
|---|---|---|
| **SLUG** | `your-article-slug` | `hyperframes-zero-cost-video-vol2` |
| **コミットメッセージ** | `Add: [記事の短い説明]` | `Add: Hyperframes zero-cost video series vol.2` |
| **記事ファイルの場所** | `~/Downloads/` 想定 | Desktop等の場合は適宜変更 |

> 💡 **SLUG命名のヒント**：URLの一部になる。半角英小文字・ハイフンのみ。シリーズものは末尾に `-vol1`, `-vol2` のように番号を付けると統一感が出る。

---

## 🛠️ Step 1: 作業準備（5分）

### 1-1. プロジェクトに移動して状態確認

```bash
cd /Volumes/Data-yk1/書類２/Projects/yk_memo
```

```bash
git status
# ← "nothing to commit, working tree clean" が出ればOK
```

### 1-2. mainを最新化して新規ブランチを切る

```bash
git checkout main
```

```bash
git pull origin main
# ← "Already up to date." または更新が取得される
```

```bash
# ↓ SLUGの部分を実際の値に書き換えて実行
git checkout -b feature/your-article-slug
# ← "Switched to a new branch ..." が表示されればOK
```

```bash
git branch
# ← `* feature/your-article-slug` が表示されればOK
```

---

## 📝 Step 2: 記事ファイルを配置（2分）

### 2-1. 記事ファイルを `src/content/notes/` にコピー

```bash
# ↓ ファイル名を実際のSLUG.md に書き換えて実行
cp ~/Downloads/your-article-slug.md src/content/notes/
```

```bash
# ↓ ファイル名を書き換えて実行
ls -la src/content/notes/your-article-slug.md
# ← ファイルサイズと日付が表示されればOK
```

### 2-2. frontmatterの最終確認

```bash
# ↓ ファイル名を書き換えて実行
head -10 src/content/notes/your-article-slug.md
```

**確認ポイント：**
- [ ] `title` が記事タイトルになっている
- [ ] `date` と `dateDisplay` が正しい日付
- [ ] `tags` が既存記事と同じ書式
- [ ] `lede` が記事冒頭のリード文と一致
- [ ] `status: "published"` （`"draft"` だと一覧に出ない）

---

## 👀 Step 3: ローカルで動作確認（5分）

### 3-1. devサーバーを起動

```bash
npm run dev
# ← "[content] Synced content" と "astro v6.x.x ready" が出ればOK
```

### 3-2. ブラウザで確認

```
http://localhost:4321/notes/your-article-slug/
```

**チェックリスト：**
- [ ] タイトル・リード文・見出しが正しく表示
- [ ] 表（テーブル）・コードブロック・引用ブロックが崩れていない
- [ ] リンクが機能している
- [ ] トップページ `http://localhost:4321/` の Recent notes に表示されている

### 3-3. devサーバーを停止

`Ctrl + C` で停止。

---

## 📤 Step 4: commit → push → mainへmerge（10分）

### 4-1. ステージング・コミット・push

```bash
git status
# ← "Untracked files:" に新規ファイルが見えるか確認
```

```bash
# ↓ ファイル名を書き換えて実行
git add src/content/notes/your-article-slug.md
```

```bash
# ↓ コミットメッセージを記事に合わせて書き換えて実行
git commit -m "Add: [記事の短い説明]"
```

```bash
# ↓ ブランチ名を書き換えて実行
git push origin feature/your-article-slug
```

### 4-2. mainブランチへマージ

```bash
git checkout main
```

```bash
# ↓ ブランチ名を書き換えて実行
git merge feature/your-article-slug
# ← "Fast-forward" または merge commit が作成される
```

```bash
git push origin main
# ← Vercelの自動デプロイがトリガーされる
```

### 4-3.（任意）作業ブランチを削除

```bash
# ↓ ブランチ名を書き換えて実行
git branch -d feature/your-article-slug
```

---

## 🚀 Step 5: Vercel本番反映確認（3分）

### 5-1. デプロイを待つ（自動）

`git push origin main` の後、Vercelが1〜3分で自動デプロイ。

### 5-2. 本番URLで確認

```
# ↓ SLUGを書き換えて開く
https://yk-memo.vercel.app/notes/your-article-slug/
```

```
https://yk-memo.vercel.app/
```

### 5-3. ダッシュボードで進捗確認（任意）

```
https://vercel.com/dashboard
```

---

## ⚠️ よくあるトラブル対処

### ケース①：`npm run dev` でfrontmatterエラー

```bash
# 既存の安定記事と比較
head -10 src/content/notes/content-collections-migration.md
```

→ フィールド名・引用符の有無・コロン後のスペースを揃える。

### ケース②：間違えてmainで作業してしまった

```bash
git stash
git checkout -b feature/your-article-slug
git stash pop
```

### ケース③：commit前に「やっぱりやめたい」

```bash
git restore src/content/notes/your-article-slug.md
```

### ケース④：push後にtypoに気づいた

```bash
# 修正後に
git add src/content/notes/your-article-slug.md
git commit -m "Fix: typo in [記事名]"
git push origin feature/your-article-slug
# その後、再度merge → push origin main
```

---

## 📋 公開後のチェックリスト

- [ ] トップページの Recent notes に表示されている
- [ ] 記事ページが正しく開ける
- [ ] OGP画像が表示される（X/Facebookでシェア時のプレビュー）
- [ ] 過去記事への内部リンクが機能する
- [ ] X（旧Twitter）で告知投稿
- [ ] 記事末の「要ファクトチェック」項目を最終確認

---

## 🔁 再利用時のチェックポイント

このテンプレートは何度でも使い回せますが、以下の状況では **手順書本体（`yk-memo-publishing-guide.md`）に立ち戻って確認** することをおすすめします：

- 新しいタグを追加する時 → `content.config.ts` のスキーマ確認
- Astroのバージョンが上がった直後 → 仕様変更の可能性
- 半年以上ぶりの公開作業 → 久しぶりだとリポジトリの状態が不明
- frontmatterの形式を変えた時 → `npm run dev` でのプレビュー必須

---

*このテンプレートは2026年5月4日時点のyk_memoブログ仕様（Astro v6.1.9 + Content Collections）に基づきます。*
