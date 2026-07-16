# Astro Starter Kit: Basics

```sh
npm create astro@latest -- --template basics
```

> 🧑‍🚀 **Seasoned astronaut?** Delete this file. Have fun!

## 🚀 Project Structure

Inside of your Astro project, you'll see the following folders and files:

```text
/
├── public/
│   └── favicon.svg
├── src
│   ├── assets
│   │   └── astro.svg
│   ├── components
│   │   └── Welcome.astro
│   ├── layouts
│   │   └── Layout.astro
│   └── pages
│       └── index.astro
└── package.json
```

To learn more about the folder structure of an Astro project, refer to [our guide on project structure](https://docs.astro.build/en/basics/project-structure/).

## 🧞 Commands

All commands are run from the root of the project, from a terminal:

| Command                   | Action                                           |
| :------------------------ | :----------------------------------------------- |
| `npm install`             | Installs dependencies                            |
| `npm run dev`             | Starts local dev server at `localhost:4321`      |
| `npm run build`           | Build your production site to `./dist/`          |
| `npm run preview`         | Preview your build locally, before deploying     |
| `npm run astro ...`       | Run CLI commands like `astro add`, `astro check` |
| `npm run astro -- --help` | Get help using the Astro CLI                     |

## 👀 Want to learn more?

Feel free to check [our documentation](https://docs.astro.build) or jump into our [Discord server](https://astro.build/chat).

---

## トップページ（`/`）の運用（Phase 2）

トップページは `src/pages/index.astro` ＋ `src/layouts/HomeLayout.astro` で実装。
視覚的正本: `docs/homepage/yk_memo-hp-hybrid-mock-v5.html`（別リポジトリ `yk_docs`）。
詳細な実装判断・未確定要素は `yk_memo-hp-phase2-handoff-v1.0.md`（同フォルダ）を参照。

### お知らせ・予定（S6）の更新

`src/data/schedule.json` を編集するだけで反映される。

```json
{
  "date": "8月4日（火）13:30〜",
  "title": "スマホ・わいわいサロン（片倉台自治会）",
  "badge": "予約不要"
}
```

- `badge` は不要な場合 `null` にする
- 月1回、わいわいサロンの準備と合わせて更新する運用を想定

### 画像の差し替え

| 用途 | パス | 現状 |
|---|---|---|
| 顔写真（想いセクション） | `src/assets/home/portrait-placeholder.jpg` | モックのbase64を仮置き。同じファイル名で高解像度版に上書きすれば `npm run build` で自動最適化される |
| サロンの現場写真 | `src/pages/index.astro` の `.act-photo`（1つ目） | 未提供のためプレースホルダ表示（グラデーション＋テキスト）。画像が揃ったら `<Image>` に差し替え |
| 講座の現場写真 | 同上（2つ目） | 同上 |
| 研究会の様子 | 同上（3つ目） | 同上 |

### 既知の未確定要素

問い合わせ手段・現場写真3枚・のべ参加者数・代表記事「AIに考えさせるな」の実体などは
`yk_memo-hp-phase2-handoff-v1.0.md` にまとめている。
