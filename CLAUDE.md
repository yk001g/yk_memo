# CLAUDE.md — yk_memo（Astro公開サイト）

このリポジトリは [yk-memo.vercel.app](https://yk-memo.vercel.app) を支える Astro + Vercel 構成の公開ブログサイトです。
このファイルは Claude Code がこのリポジトリで作業する際に**毎回読み込む憲法**です。すべての作業はこのルールに従ってください。

---

## 1. このリポジトリの役割

このリポジトリは **公開フェーズ専用** です。

- ✅ 完成した記事を `src/content/notes/` に配置して公開する
- ✅ サイトのレイアウト・スタイル・コンポーネントを管理する
- ❌ 記事の執筆作業はここでは行わない（執筆は別リポジトリ `blog-project` で実施）
- ❌ 4コマ漫画の生成・HTMLプレビュー作成もここでは行わない

**「CLAUDE.md v2」と呼ばれる執筆パイプライン憲法は別リポジトリ（`blog-project`）にあります。yk_memo にはありません。混同しないこと。**

---

## 2. 技術スタック（必ず最初に把握）

| 項目 | 値 |
|---|---|
| フレームワーク | Astro（content collections使用） |
| デプロイ先 | Vercel（GitHub連携で自動デプロイ） |
| ローカルパス | `/Volumes/Data-yk1/書類２/projects/ykmemo-homepage/yk_memo`（外部SSD） |
| GitHubリポジトリ | `https://github.com/yk001g/yk_memo` |
| 公開URL | `https://yk-memo.vercel.app` |
| 記事配置先 | `src/content/notes/<slug>.md`（ファイル単独パターン） |
| 画像配置先 | `public/images/<slug>/` |

---

## 3. 記事の必須schema（厳守）

`src/content/config.ts` で notes コレクションは以下のように定義されています：

```typescript
schema: z.object({
  title:       z.string(),
  description: z.string(),
  date:        z.string(),
  dateDisplay: z.string(),
  updated:     z.string().optional(),  // 任意
  tags:        z.array(z.string()),
  lede:        z.string(),
  status:      z.enum(['published', 'draft']).default('published'),
  wide:        z.boolean().default(false),  // 任意
})
```

### 必須7キーのテンプレート（コピペ用）

```yaml
---
title: "（50〜60字、メインKWをフロントロード）"
description: "（120字前後、定義文構造でBLUF）"
date: "2026-XX-XX"
dateDisplay: "2026.XX.XX"
tags: ["タグ1", "タグ2"]
lede: "（descriptionより短い導入文、80字前後）"
status: "published"
---
```

### 各フィールドのルール

| キー | 形式 | 注意 |
|---|---|---|
| `title` | 文字列（引用符必須） | 50〜60字、メインKW前半配置 |
| `description` | 文字列（引用符必須） | 120字前後、定義文形式が望ましい |
| `date` | `"YYYY-MM-DD"` | **必ず文字列・引用符で囲む**（数値だとエラー） |
| `dateDisplay` | `"YYYY.MM.DD"` | 表示用、ドット区切り |
| `tags` | `["a", "b"]` | 配列リテラル、既存タグと統一感 |
| `lede` | 文字列 | 記事冒頭リード文 |
| `status` | `"published"` / `"draft"` | 公開時は `published` |
| `wide` | `true` / `false` | 横幅広レイアウト時のみ `true` |

---

## 4. 絶対にやってはいけないこと

- ❌ `author: "yk_memo"` を frontmatter に書く → schemaにないキーはビルドエラー
- ❌ `created: 2026-XX-XX` と書く → 正しいキー名は `date`
- ❌ `date: 2026-04-24` と引用符なしで書く → 必ず `"2026-04-24"`
- ❌ `dateDisplay` / `lede` / `status` を省略する → 必須キー
- ❌ `npm run build` 検証を飛ばして `git push` する → ビルドエラーで公開事故
- ❌ ユーザーの承認なしに自動で `git push` まで走る → ステップごとに必ず承認を取る
- ❌ 本文中の見出し区切りで `---` を3つ以上使う → YAMLフロントマターの区切りと誤認される（`***` か `<hr>` を使う）

---

## 5. 新規記事の公開フロー（厳守）

ユーザーから「記事を公開したい」と言われたら、以下の順序で進める。**勝手に最後まで走らない。各ステップでユーザーの承認を取る。**

### Step 1: 受け取った記事ファイルを確認
- ファイルパスを確認（例：`~/Desktop/<記事名>.md`）
- `head -20` で frontmatter を確認

### Step 2: 既存記事のschema規格を参照
- `head -15 src/content/notes/ai-agent-strategy-2026.md` で公開済み記事のfrontmatterを確認
- `cat src/content/config.ts` で schema を再確認

### Step 3: frontmatterをschemaに適合
- 上記の7必須キーに合わせて整形
- `author` `created` などschema外のキーは削除
- ユーザーに整形後のfrontmatterを提示して承認を取る

### Step 4: 配置
- `src/content/notes/<slug>.md` に配置
- 画像があれば `public/images/<slug>/` に配置
- スラグはファイル名から拡張子を除いたもの

### Step 5: ローカルビルド検証（必須）
- `npm run build` を実行
- 成功してから次へ
- エラー時はキー名・型・引用符を確認して修正
- ユーザーに結果を見せる

### Step 6: ローカル表示確認（推奨）
- `npm run dev` で `http://localhost:4321/notes/<slug>` を表示確認
- 問題なければ `Ctrl+C` で停止
- スキップしたい場合はユーザーに確認

### Step 7: Git操作（ユーザー承認後）
- `git status` で変更内容を確認・提示
- `git add src/content/notes/<slug>.md`（画像があれば追加）
- `git commit -m "post: <記事のトピック>"`
- ユーザーが「push」と言ってから `git push origin main`

### Step 8: デプロイ確認
- Vercelダッシュボード URL を提示
- 約2分後に `https://yk-memo.vercel.app/notes/<slug>` を確認するよう案内

---

## 6. 既存記事の参照優先順位

frontmatterの書き方で迷ったら、以下の順に既存記事を参照する：

1. `src/content/notes/ai-agent-strategy-2026.md`（直近の published 記事）
2. `src/content/notes/notebooklm-mcp-cli.md`（draft 記事の例）
3. `src/content/config.ts`（schema定義の正本）

矛盾があれば `config.ts` が正。

---

## 7. 環境特有の注意事項

### 外部SSD運用
このリポジトリは外部SSD（`/Volumes/Data-yk1/`）に配置されている。

- `Operation not permitted` エラーが出たら、macOSのフルディスクアクセス権限が不足
- システム設定 → プライバシーとセキュリティ → フルディスクアクセス → ターミナル.app を追加

### Git認証
GitHubへの push は Personal Access Token を使用。

- `remote: Support for password authentication was removed` エラー → PAT切れ
- macOS Keychain Access から `github.com` のエントリを削除して再認証

---

## 8. Git コミットメッセージのルール

| 種類 | プレフィックス | 例 |
|---|---|---|
| 新規記事公開 | `post:` | `post: Claude Code Routines 業務自動化ガイド` |
| 記事修正 | `fix:` | `fix: typo in claude-code-publish-2nd` |
| サイト機能追加 | `feat:` | `feat: タグページにOG画像追加` |
| サイト機能修正 | `fix:` | `fix: モバイル時のヘッダー崩れ` |
| デザイン調整 | `style:` | `style: 本文の行間を1.8に変更` |
| 設定変更 | `chore:` | `chore: Astroを5.2にアップデート` |

メッセージは日本語でOK。簡潔に。

---

## 9. やらないことリスト（このリポジトリの責務外）

以下の作業はこのリポジトリでは扱わない：

- 記事の新規執筆（→ `blog-project` で実施）
- 4コマ漫画のプロンプト生成・画像生成（→ `blog-project` ＋ Antigravity）
- HTMLプレビューの生成（→ `blog-project` の Phase 5）
- 記事文章のリライト・SEO診断（→ `blog-project` または対話で実施）

これらを依頼されたら「執筆作業は blog-project リポジトリで実施するのが正しい。yk_memo は公開専用です」とユーザーに案内すること。

---

## 10. ロールバック

公開後に問題が見つかった場合：

```bash
git revert HEAD
git push origin main
```

または Vercel ダッシュボードで Deployments → 1つ前の安定版 → "Promote to Production"

---

## 11. 困ったときの参照先

| 状況 | 参照 |
|---|---|
| schema詳細 | `src/content/config.ts` |
| 既存記事例 | `src/content/notes/ai-agent-strategy-2026.md` |
| 全体的な投稿手順書 | （別途保管されている `yk-memo-publish-guide-v2.md`） |
| 執筆フェーズ | `blog-project` リポジトリの `CLAUDE.md` v2 |

---

*このCLAUDE.mdは 2026-05-13 作成。schema変更時は本ファイルも更新すること。*
