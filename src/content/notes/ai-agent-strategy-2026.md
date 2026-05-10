---
title: "ChatGPT 5.5に対抗できるか？｜Claude Pro × Gemini Pro でAIエージェント環境を組み立てる"
description: "Claude Pro と Google AI Pro の組み合わせで、ChatGPT 5.5 の最新エージェント機能と同等以上の環境を作れるか。Geminiは本当に遅れているのかの現状分析から、5機能の対抗策、そして「結果直行型」ワークフローの設計まで、4本のレポートにまとめた調査記録です。"
date: "2026-05-09"
dateDisplay: "2026.05.09"
tags: ["AI", "道具", "Claude", "Gemini", "ChatGPT"]
lede: "Claude Pro と Google AI Pro の組み合わせで、ChatGPT 5.5 と Workspace Agents に対抗できるのか。4本のレポートにまとめた調査記録です。"
status: "published"
wide: true
---

ChatGPTの新機能が話題になるたびに、「自分の契約だけで足りているのか」と気になることはありませんか。私の現在の契約は **Claude Pro + Google AI Pro** の組み合わせです。ChatGPT Plus は契約していません。この状態で、2026年4月にリリースされた ChatGPT 5.5 と Workspace Agents に対抗できるのか——気になって調査を始めたら、想像以上に深い話になりました。

この記事は、その調査記録を **4本のレポート** に整理したものです。下のタブで切り替えながら読めます。

> **結論を先に言うと：** 「Geminiが遅れている」は半分正しく半分間違いで、個人ユーザー向けには確かにChatGPTとClaudeが先行しています。ただし**Claude Pro + Gemini Pro の組み合わせは、ChatGPT Plus に対して劣勢ではなく、むしろ優勢な部分が多い**というのが調査結果でした。

---

<div class="report-app">

<aside class="report-nav">
  <div class="report-brand">Editorial Brief — vol.1</div>
  <div class="report-brand-sub">AI Agent Environment Strategy</div>
  <div class="report-nav-list">
    <a class="report-nav-item active" data-target="report1">
      <span class="report-nav-num">01</span>
      <span class="report-nav-text">Geminiは本当に遅れているのか</span>
    </a>
    <a class="report-nav-item" data-target="report2">
      <span class="report-nav-num">02</span>
      <span class="report-nav-text">Google AIを最大限使いこなす</span>
    </a>
    <a class="report-nav-item" data-target="report3">
      <span class="report-nav-num">03</span>
      <span class="report-nav-text">ChatGPT 5.5への対抗戦略</span>
    </a>
    <a class="report-nav-item" data-target="report4">
      <span class="report-nav-num">04</span>
      <span class="report-nav-text">優先3機能の深掘り対抗策</span>
    </a>
  </div>
</aside>

<div class="report-content">

<!-- ============ REPORT 1 ============ -->
<article class="report active" id="report1">

<div class="report-cover">
<div class="report-eyebrow">Report 01 — State of the Field</div>
<h2 class="report-title">Geminiは本当にAIエージェントで遅れているのか</h2>
<div class="report-subtitle">2026年4月時点の現状分析</div>
<div class="report-meta-bar">
<div class="report-meta-item"><strong>焦点</strong>Gemini / Claude / ChatGPT 比較</div>
<div class="report-meta-item"><strong>視点</strong>個人 × エンタープライズ</div>
</div>
</div>

<p class="report-lead">
「GeminiがAIエージェントで遅れている」という言説は、半分正しく半分間違いです。<strong>個人ユーザー向け</strong>の単発エージェントタスクではClaudeとChatGPTが明確にリードしていますが、<strong>エンタープライズ基盤</strong>では2026年4月22日のCloud Next '26でGoogleが逆に大きく前に出ています。
</p>

<div class="report-verdict">
<span class="report-verdict-label">Bottom Line</span>
<div class="report-verdict-text">
「個人ユーザーが日常的に触れるAIエージェント体験」では遅れて見えるが、Googleは別の戦場（エンタープライズ基盤）で巻き返しを図っている。モデル単体の知能・ベンチマークでは Gemini 3.1 Pro は GPT-5.4 / Claude Opus 4.6 と肩を並べる水準にあり、「全方位で遅れている」とは言い難い。
</div>
</div>

<div class="report-ornament">❦ ❦ ❦</div>

<h3>1 — なぜ「遅れている」と言われるのか</h3>

<h4>個人向けエージェント機能のローンチ順</h4>
<p>時系列で見ると、確かにGeminiは「個人が触れるエージェント機能」では後手に回っています。Operatorは2024年末、Claude Codeは2025年中盤に普及。Geminiの個人向けエージェント機能はWorkspace内での補助的な役割が中心で、「AIが代わりに作業してくれる」という体験の打ち出しが弱かったのは事実です。</p>

<h4>ベンチマークでの「コンピューター使用」スコア</h4>
<p>エージェントの基礎能力を測るOSWorld-Verified（デスクトップ操作）では：</p>
<ul class="report-list">
<li><strong>GPT-5.4</strong>：75.0%（人間ベースライン72.4%を初めて超えた）</li>
<li><strong>Claude Sonnet 4.6</strong>：72.5%</li>
<li><strong>Gemini 3.1 Pro</strong>：公表値で2位グループ（ブラウザ系の BrowseComp では逆にトップ：85.9%）</li>
</ul>
<p>デスクトップを丸ごと操作する系では3番手、ブラウザ内操作では1番手、という分かれ方です。</p>

<h4>開発者コミュニティの空気</h4>
<p>Hacker News や Reddit では、コーディングエージェント用途で <strong>Claude Code が事実上の標準</strong>になっており、その次にOpenAIのCodex系が来て、Geminiは3番手という見方が根強くあります。Cursor、Windsurf といった主要なAIコーディングIDEがClaudeを内部エンジンに採用していることも、この空気を強めています。</p>

<h3>2 — Googleは別の戦場で動いている</h3>

<p>ここが最も見落とされやすいポイントです。</p>

<h4>Gemini Enterprise Agent Platform（2026年4月22日発表）</h4>
<p>Cloud Next '26 で発表された Gemini Enterprise Agent Platform は、「個人がチャットで触るエージェント」ではなく、<strong>「企業が何千ものエージェントを安全に運用する基盤」</strong>に振り切った製品です。</p>

<ul class="report-list">
<li><strong>Agent Development Kit（ADK）</strong>の大幅強化 — Gemini モデル経由で月6兆トークン以上が処理</li>
<li><strong>Agent Registry &amp; Agent Gateway</strong> — 各エージェントに暗号学的なIDを付与し、すべての行動を監査可能にする「ゼロトラスト・エージェント管理」</li>
<li><strong>GKE Agent Sandbox</strong> — gVisor分離で1クラスタあたり毎秒300個のサンドボックスを起動可能</li>
<li><strong>Model Garden</strong> — 200以上のモデルを選択可能（Competitor の Claude Opus 4.7 も含む）</li>
<li><strong>A2A と MCP</strong> 両プロトコル対応</li>
</ul>

<div class="report-insight">
<p>象徴的だったのが、2026年4月22日にOpenAIの Workspace Agents と GoogleのGemini Enterprise Agent Platform が<strong>同日発表</strong>された出来事。両社が同じ日にぶつかり合う状態は、Googleがエンタープライズ領域で遅れているどころか、真正面から競合するフェーズに入ったことを示しています。</p>
</div>

<h3>3 — ベンチマークの実態</h3>

<p>2026年4月時点の主要モデルのスコアを並べると、こうなります。</p>

<div class="report-table-wrap">
<table class="report-table">
<thead>
<tr>
<th>ベンチマーク</th>
<th>GPT-5.4</th>
<th>Claude Opus 4.6/4.7</th>
<th>Gemini 3.1 Pro</th>
</tr>
</thead>
<tbody>
<tr><td>GPQA Diamond（科学推論）</td><td>92.8%</td><td>91.3%</td><td><strong>94.3%（首位）</strong></td></tr>
<tr><td>ARC-AGI-2（抽象推論）</td><td>73.3%</td><td>—</td><td><strong>77.1%（首位）</strong></td></tr>
<tr><td>SWE-Bench Verified（コーディング）</td><td>58.7%</td><td><strong>87.6%（首位）</strong></td><td>80.6%</td></tr>
<tr><td>OSWorld（デスクトップ操作）</td><td><strong>75.0%（首位）</strong></td><td>72.5%</td><td>2位グループ</td></tr>
<tr><td>BrowseComp（ウェブ検索）</td><td>82.7%</td><td>—</td><td><strong>85.9%（首位）</strong></td></tr>
<tr><td>価格（入出力 / 1M tok）</td><td>$2.50/$15</td><td>$15/$75</td><td><strong>$2/$12（最安）</strong></td></tr>
<tr><td>コンテキスト窓</td><td>272K</td><td>1M</td><td><strong>1M〜2M（最大）</strong></td></tr>
</tbody>
</table>
</div>

<p><strong>Geminiが「全部負けている」ベンチマークはほぼ存在しません。</strong>むしろ抽象推論、ウェブエージェント、価格性能比、コンテキスト長では1位です。</p>

<h3>4 — 「遅れている感」の正体</h3>

<p>これは技術より<strong>プロダクト戦略と空気の問題</strong>です。</p>

<h4>開発者コミュニティの口コミ</h4>
<p>Claude Code が爆発的に普及した結果、<strong>「AIエージェント＝コーディングエージェント」という連想</strong>が強くなり、それ以外の文脈でのエージェント能力が話題になりにくい構造になっています。</p>

<h4>プロダクトの分散</h4>
<p>Geminiは「Gemini app」「NotebookLM」「Workspace内のGemini」「Gemini CLI」「Vertex AI」「Antigravity」「Jules」と窓口が分散しすぎていて、<strong>どれが「Geminiのエージェント」なのか一般ユーザーには見えにくい</strong>。</p>

<h4>Anthropicの研究発表が目立つ</h4>
<p>2026年3月にAnthropicが「Claudeが数日間にわたって自律的に科学計算プロジェクトを実行し、物理計算でサブパーセント精度を達成した」と発表したような、<strong>「自律エージェントの長時間実行」を象徴するエピソード</strong>がGoogleからは出ていません。</p>

<div class="report-pullquote">
Googleは基盤を作っているけれど、<br/>「エージェントが自分でやり遂げた物語」を売るのが下手。
<span class="report-pullquote-attr">— 本レポートの観察</span>
</div>

<h3>5 — 教育者視点の実用結論</h3>

<ul class="report-list">
<li><strong>個人ユーザーが「AIにやってもらう」体験を求めるなら</strong>：ClaudeとChatGPTが先行。Claude CodeやChatGPT Operatorはすでに完成度の高い「自律エージェント」体験を提供。</li>
<li><strong>企業が「AIエージェントを大量に運用する基盤」を求めるなら</strong>：Gemini Enterprise Agent Platform はAnthropicやOpenAIにはない種類の統合性・ガバナンス・マルチモデル選択肢を備えている。</li>
<li><strong>モデルそのものの知能</strong>：Gemini 3.1 Pro はGPT-5.4・Claude Opus 4.6 と並ぶ水準で、抽象推論や価格性能比ではむしろリードしている領域すらある。</li>
<li><strong>今後の見通し</strong>：各社の次世代モデルが2026年Q3に出揃う見込みで、エージェント機能はQ4までに「差別化要素」から「当たり前の機能」へ移行すると予想される。</li>
</ul>

<div class="report-ornament">❦ ❦ ❦</div>

</article>

<!-- ============ REPORT 2 ============ -->
<article class="report" id="report2">

<div class="report-cover">
<div class="report-eyebrow">Report 02 — Practical Guide</div>
<h2 class="report-title">個人ユーザーが Google AI エコシステムを最大限使いこなす実践ガイド</h2>
<div class="report-subtitle">— ClaudeやChatGPTと「同等以上」に戦うための7つの戦略</div>
<div class="report-meta-bar">
<div class="report-meta-item"><strong>対象</strong>個人 / 教育者 / クリエイター</div>
<div class="report-meta-item"><strong>前提</strong>Google AI Pro 契約</div>
</div>
</div>

<p class="report-lead">
ChatGPTやClaudeに対してGeminiが「物足りなく感じる」のは、多くの人がGemini本体だけを見て比較しているからです。実は、Googleは「ひとつの最強アプリ」ではなく<strong>多数の専門ツールが連携するエコシステム</strong>として戦略を組んでいます。NotebookLM、Antigravity、Jules、Deep Research、Workspace内のGemini、AI Studio——これらを組み合わせると、ClaudeやChatGPTでは難しい体験が生まれます。
</p>

<div class="report-ornament">❦ ❦ ❦</div>

<h3>戦略 1 — NotebookLMを「第二の脳」として中心に据える</h3>

<p>これが最重要ポイントです。NotebookLMは2026年に入って<strong>もはや単なるノート整理ツールではなく、Gemini本体に接続できる個人知識データベース</strong>に進化しました。</p>

<h4>何が変わったか</h4>
<ul class="report-list">
<li><strong>GeminiアプリからNotebookLMをデータソースとしてマウント可能</strong>（2026年初実装）— Geminiチャットの「+」ボタンからノートブックを指定すると、Geminiが自分のノートブックを横断検索して回答する</li>
<li><strong>Cinematic Video Overview</strong>（3月リリース、Ultra限定）でPDFや資料からNano Banana Pro + Veo 3でアニメーション付き解説動画を生成</li>
<li><strong>EPUB対応・YouTube動画取り込み</strong>でソース形式の柔軟性が大幅向上</li>
<li><strong>インタラクティブモード</strong>で音声解説中に割り込み質問可能</li>
<li><strong>Quiz/Flashcard</strong>で進捗保存、「Got it / Missed it」管理対応</li>
</ul>

<h4>教育コンテンツ制作者への当てはめ</h4>
<ul class="report-list">
<li><strong>シニア向け資料の事前学習用</strong>：講座スライドや配布資料をノートブックに入れ、参加者向けに2〜3分のVideo Overviewを生成して事前送付</li>
<li><strong>過去の講座記録の知識ベース化</strong>：これまで作成した50以上のプレゼンテーションをすべて投入し、新規講座を企画する際にGeminiから横断検索する</li>
<li><strong>質問対応の精度向上</strong>：過去のサロン質問回答をすべてノートブックに集約</li>
</ul>

<h3>戦略 2 — Deep Research を「外注リサーチャー」として使い倒す</h3>

<p>Deep Researchは、ClaudeやChatGPTにある同名機能と比べて<strong>実用面で一段上</strong>にあります。</p>

<ul class="report-list">
<li><strong>20〜30分かけて数百サイトを調査</strong>し、引用付き完全レポートを生成</li>
<li><strong>Collaborative Planning</strong>でユーザーがリサーチ計画を確認・修正してから実行可能</li>
<li><strong>Deep Research Max</strong>（4月リリース）はGemini 3.1 Proベースで、ネイティブにチャート・インフォグラフィックも生成</li>
<li><strong>MCP連携</strong>で自社プライベートデータも統合可能</li>
</ul>

<h3>戦略 3 — Antigravityを「スキル開発の母艦」にする</h3>

<p>Claude Code Skillsの世界には、Google側に <strong>Antigravity</strong> という対抗馬があります。</p>

<ul class="report-list">
<li>VS Codeフォーク + Gemini 3 Pro + Gemini 2.5 Computer Use + Nano Banana 統合</li>
<li><strong>「Manager View」で複数エージェントを並列実行</strong>しながら一望できる</li>
<li><strong>個人Gmailアカウントなら無料プレビュー利用可能</strong></li>
<li>Vertex AI経由でClaude Sonnet 4.5やGPT-OSSも選択可能</li>
</ul>

<div class="report-insight">
<p><strong>Claude Codeとの使い分け：</strong>Claude Codeを母艦にしつつ、ブラウザ操作が絡むタスク（NotebookLM操作、フォーム入力など）はAntigravityに任せるハイブリッドが現実的です。</p>
</div>

<h3>戦略 4 — Workspace統合の威力をフル活用する</h3>

<p>ChatGPTやClaudeでは絶対に再現できない部分があります。それは <strong>Gmail・Docs・Sheets・Calendarの中身を直接読み取って動く</strong> Geminiの統合性です。</p>

<ul class="report-list">
<li><strong>Gmail内検索</strong>：「先月の塾関連のメールから保護者からの連絡だけ要約して」が一発で動く</li>
<li><strong>Docs内のスタイル統一</strong>：「この文書の文体に合わせて続きを書いて」が文書内で完結</li>
<li><strong>Sheets操作</strong>：「この生徒名簿シートに、出席率の計算列を追加して」を自然言語で</li>
<li><strong>Gmail AI Overview</strong>：受信箱を開かずに「今日の重要メール3件は？」が聞ける</li>
</ul>

<h3>戦略 5 — Notebooksプロジェクト機能で文脈を保つ</h3>

<p>ChatGPTのProjectsやClaudeのProjectsに対応する機能として、GeminiアプリにもNotebooksが統合されました。</p>

<ul class="report-list">
<li>講座シリーズごとにNotebookを作成して、関連資料・チャット履歴・調査結果を一元化</li>
<li>NotebookLMノートブックと同期されるので、深く調べる→使い倒す、が連続する</li>
<li>パーソナルコンテキスト（カレンダー・メール・好み）と組み合わせると「来週の講座準備でやり残しは？」のような質問が機能する</li>
</ul>

<h3>戦略 6 — Gemini CLI + Jules で「常駐型コーディング助手」を作る</h3>

<ul class="report-list">
<li><strong>Gemini CLI</strong>：ターミナル内で動くエージェント。Gemini 3 Proベースで動くので、ローカルでのスクリプト生成・コード説明に強い</li>
<li><strong>Jules</strong>：非同期コーディングエージェント。GitHubリポジトリに接続して<strong>寝ている間にPRを起こす</strong>。AI Pro：5倍制限、AI Ultra：20倍制限・マルチエージェント並列</li>
</ul>

<h3>戦略 7 — 「Gem」と「Super Gem」でカスタムアシスタントを量産する</h3>

<p>ChatGPTのCustom GPTsに相当する機能が、Geminiでは <strong>Gem（さらに2026年からSuper Gem）</strong> として提供されています。</p>

<h4>教育者にとっての可能性</h4>
<ul class="report-list">
<li><strong>「サロン専用アシスタント」Gem</strong>：過去のサロンQ&amp;A、配布資料、よくある質問を全部入れて、参加者がスマホから直接質問できる</li>
<li><strong>「ブランドチェッカー」Gem</strong>：自分の文章をブランドガイドに沿って校正してくれる専用ボット</li>
<li><strong>「AIリテラシーチューター」Gem</strong>：シニア向けにやさしい言葉で答える専用Gem</li>
</ul>

<div class="report-ornament">❦ ❦ ❦</div>

<h3>実践プラン：教育者の活動への組み込み順序</h3>

<div class="report-phase">
<div class="report-phase-num">第1段階 / 今週中</div>
<h4>NotebookLMを軸に据える</h4>
<p>過去のスライド・配布資料・サロンQAをすべてNotebookLMに投入。Gemini AppからNotebookとしてマウントできる状態にする。これだけで「自分の知識資産がAIから使える」状態になります。</p>
</div>

<div class="report-phase">
<div class="report-phase-num">第2段階 / 今月中</div>
<h4>Deep Researchをルーチン化する</h4>
<p>週1回、「今週のAI業界アップデート」「シニア向けスマホ教育のトレンド」など定型クエリでDeep Research Maxを実行。生成されたレポートをそのままNotebookLMに戻す。情報サイクルが完成します。</p>
</div>

<div class="report-phase">
<div class="report-phase-num">第3段階 / 1〜2ヶ月</div>
<h4>AntigravityをClaude Codeと併用</h4>
<p>Claude Codeを母艦にしつつ、ブラウザ操作系タスク（NotebookLM自動投入、フォーム入力、Web検証）をAntigravityに任せる。両者をMCP経由で接続することも視野。</p>
</div>

<div class="report-phase">
<div class="report-phase-num">第4段階 / 中期的</div>
<h4>Super Gemで配布物を作る</h4>
<p>サロン参加者がスマホから直接アクセスできる「サロン専用アシスタント」をSuper Gemで構築し、紙の配布物に併せてリンクを記載。Googleアカウントを持っていれば即使えるGeminiは配布に適しています。</p>
</div>

<div class="report-pullquote">
ClaudeやChatGPTは「単発のセッションで強力」、<br/>Geminiエコシステムは「蓄積と統合で強力」。
</div>

</article>

<!-- ============ REPORT 3 ============ -->
<article class="report" id="report3">

<div class="report-cover">
<div class="report-eyebrow">Report 03 — Counter Strategy</div>
<h2 class="report-title">ChatGPT Plus 優位機能 5つに対する対抗戦略</h2>
<div class="report-subtitle">— Claude Pro + Gemini Pro での個人ユーザー視点分析</div>
<div class="report-meta-bar">
<div class="report-meta-item"><strong>前提</strong>Claude Pro $20 + Google AI Pro $19.99</div>
<div class="report-meta-item"><strong>比較</strong>ChatGPT Plus $20</div>
<div class="report-meta-item"><strong>結論</strong>3勝1分1敗</div>
</div>
</div>

<p class="report-lead">
ChatGPT Plusの優位機能5つを冷静に分解すると、現在の組み合わせでは <strong>2つで上回り、2つで互角、1つでやや劣る</strong> という構図になります。「対抗策を講じる必要があるのは Codex の macOS 操作領域のみ」というのが調査結果です。
</p>

<h3>機能マトリクス</h3>

<div class="report-table-wrap">
<table class="report-table">
<thead>
<tr>
<th>ChatGPT Plus 機能</th>
<th>代替可能性</th>
<th>推奨スタンス</th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>Codex（macOS Computer Use）</strong></td>
<td>△ 部分代替</td>
<td>Claude Code + Antigravity の組み合わせで対抗</td>
</tr>
<tr>
<td><strong>Operator（ブラウザエージェント）</strong></td>
<td>○ ほぼ同等</td>
<td>Chrome Auto Browse + Claude Computer Use</td>
</tr>
<tr>
<td><strong>Sora（動画生成）</strong></td>
<td>◎ 上回る</td>
<td>Veo 3 + Flow で<strong>むしろ優位</strong></td>
</tr>
<tr>
<td><strong>DALL-E 4 / Images 2.0</strong></td>
<td>◎ ほぼ同等以上</td>
<td>Nano Banana Pro / 2 で<strong>ほぼ互角〜優位</strong></td>
</tr>
<tr>
<td><strong>Voice Mode</strong></td>
<td>○ 同等</td>
<td>Gemini Live で対抗、独自の強みもあり</td>
</tr>
</tbody>
</table>
</div>

<div class="report-verdict">
<span class="report-verdict-label">Bottom Line</span>
<div class="report-verdict-text">
5機能のうち2つはむしろこちらの組み合わせが上回り、2つも互角、1つだけがやや劣勢。総合的には <strong>ChatGPT Plus に対して劣勢ではなく、むしろ優勢な部分が多い</strong>。
</div>
</div>

<h3>1 — Codex（macOS自律操作）への対抗</h3>

<h4>ChatGPT Plus 側の強み</h4>
<ul class="report-list">
<li>Codex Background Computer Use（4/16リリース、macOS対応）</li>
<li>複数のCodexエージェントが<strong>ユーザー作業と並行して</strong>バックグラウンドで動く</li>
<li>GPT-5.5のOSWorld 78.7%スコアの恩恵</li>
</ul>

<h4>こちらの組み合わせでの対抗</h4>
<ul class="report-list">
<li><strong>Claude Code</strong>（macOS/Linux/Windowsで動作、SWE-Bench 87.6%）+ Skills資産</li>
<li><strong>Antigravity</strong>（個人Gmailアカウントで無料プレビュー、複数エージェント並列）</li>
<li><strong>Claude Cowork Routines</strong>（クラウドホスト型、ノートPC閉じても動く）</li>
</ul>

<p><strong>正直な評価：</strong>macOSアプリの直接操作の流麗さでは、CodexのBackground Computer Useが現時点で最も洗練されています。ただし、コード品質・既存Skills資産・互換性を考えると、Claude Codeが負けているわけではありません。</p>

<h3>2 — Operator（ブラウザエージェント）への対抗</h3>

<h4>使い分け</h4>
<ul class="report-list">
<li><strong>純粋なブラウザタスク</strong>（買い物、予約、調べ物）→ Chrome Auto Browse（1日20タスク、BrowseComp 85.9%）</li>
<li><strong>ブラウザ + ローカルファイル</strong>の複合タスク → Claude Cowork + Computer Use</li>
<li><strong>複数エージェントの並列ブラウザ操作</strong> → Antigravity</li>
</ul>

<p><strong>正直な評価：</strong>実用上はOperatorと「ほぼ同等」。Chrome Auto BrowseはBrowseCompベンチマークでGPT-5.4より高いスコア。Chromeに統合されている分、配布シナリオではむしろこちらが優位です。</p>

<h3>3 — Sora（動画生成）への対抗</h3>

<p>ここは率直に言って、<strong>現在の組み合わせのほうがSoraより明確に優れています。</strong></p>

<h4>Veo 3.1（Google AI Pro契約で利用可能）</h4>
<p><strong>これが最大のポイント。</strong>Veo 3はかつてはGoogle AI Ultra（$249/月）専用機能でしたが、現在はPro $19.99/月でも使えるようになっています。</p>

<ul class="report-list">
<li>Geminiアプリ内で直接動画生成（"create video"ボタンから）</li>
<li>8秒、720p/1080p/4K、ネイティブ音声つき</li>
<li><strong>縦型動画（9:16）対応</strong> — YouTube Shortsに直接使える</li>
<li><strong>Ingredients to Video</strong> — 複数の参照画像を指定してキャラクター一貫性を保てる</li>
<li><strong>Scene Extension</strong> — クリップを連結して1分以上の動画も可能</li>
<li>Flow（フィルムメイキングツール）で本格編集</li>
</ul>

<p><strong>正直な評価：</strong>Veo 3はSoraと同等以上の品質で、しかも<strong>音声がネイティブで生成される</strong>点で優れています。ここはむしろこちらが優位な領域です。</p>

<h3>4 — DALL-E 4 / Images 2.0 への対抗</h3>

<h4>Nano Banana Pro の強み</h4>
<ul class="report-list">
<li><strong>4K解像度出力</strong>（DALL-Eは1024×1024中心）</li>
<li><strong>多言語テキスト描画の精度がトップクラス</strong> — 日本語ポスター、インフォグラフィック、図解に強い</li>
<li>最大8枚の参照画像、5人の人物の一貫性維持</li>
<li>Web検索グラウンディングで実在物を正確に描ける</li>
<li>Thinkingモードで複雑なプロンプトを推論</li>
</ul>

<p><strong>正直な評価：</strong>Nano Banana Pro は DALL-E 4 / Images 2.0 と完全に互角、領域によっては優位。特にテキスト描画精度・図解生成・4K出力では Nano Banana Pro に分があります。</p>

<h3>5 — Voice Mode への対抗</h3>

<h4>Gemini Live の特徴</h4>
<ul class="report-list">
<li><strong>45以上の言語、150以上の国で利用可能</strong>（日本語完全対応）</li>
<li>カメラ共有・画面共有しながらの対話</li>
<li>アクセント・キャラクター切り替え（カウボーイ風、英国風など）</li>
<li>会話速度・トーン調整（"speed up" "slow down"で動的調整）</li>
<li>Google Maps、Calendar、Tasks、Keepと連携</li>
<li>ハンズフリー対応（バックグラウンド・画面ロック中も継続）</li>
</ul>

<p><strong>正直な評価：</strong>Gemini Live は ChatGPT Voice Mode と機能的にほぼ同等。特に多言語対応・Google アプリ連携・ハンズフリー継続では優れています。</p>

<div class="report-pullquote">
Codex の macOS 操作以外、勝負はほぼついている。<br/>
必要が出たら、その月だけ ChatGPT Plus を追加すれば良い。
</div>

</article>

<!-- ============ REPORT 4 ============ -->
<article class="report" id="report4">

<div class="report-cover">
<div class="report-eyebrow">Report 04 — Deep Dive</div>
<h2 class="report-title">優先3機能 + 「アウトプット直行型」の深掘り対抗策</h2>
<div class="report-subtitle">— Codex / Operator / DALL-E に「結果だけ欲しい」の観点を加えた実践ガイド</div>
<div class="report-meta-bar">
<div class="report-meta-item"><strong>核心</strong>結果直行型ワークフロー</div>
<div class="report-meta-item"><strong>装備</strong>Cowork × Skills × Routines</div>
</div>
</div>

<p class="report-lead">
最も重要なのは <strong>「期待するアウトプットを入力するだけで、最終結果まで出してくれる」</strong> という観点。これは個別機能の話とは別次元の、<strong>エージェント体験の質そのもの</strong>を問う問いです。
</p>

<div class="report-verdict">
<span class="report-verdict-label">Core Insight</span>
<div class="report-verdict-text">
ChatGPT 5.5の Workspace Agents が売りにしている「結果だけ返す」体験は、<strong>Claude Cowork + Skills + Routines</strong> の組み合わせで本質的に同じものを月$20で再現できる。これが本レポートの核心。
</div>
</div>

<div class="report-ornament">❦ ❦ ❦</div>

<h3>0 — 「結果だけ欲しい」をClaude Coworkで実現する</h3>

<p>ChatGPT 5.5が「インプットからアウトプットまで一気通貫」を売りにしているなら、<strong>Claude Coworkはまさに同じ思想で作られています</strong>。Anthropic公式の表現：</p>

<div class="report-pullquote">
Cowork delivers finished work instead of step-by-step updates:<br/>
a formatted spreadsheet, a memo, a briefing doc.
<span class="report-pullquote-attr">— Anthropic 公式</span>
</div>

<h4>3つの仕掛け</h4>

<h4>① Skills（自分専用の処方箋）</h4>
<p>Claude Codeに自分のSkillを登録しておくと、「サロンの質問票を処理して」と一言で：</p>
<ol class="report-list-num">
<li>質問内容を解析</li>
<li>管理番号を採番</li>
<li>参加者向けハンドアウト + 講師用詳細を生成</li>
<li>操作イメージ図を Pillow で自動描画</li>
<li>ブランドガイド準拠で整形</li>
</ol>

<h4>② Cowork Plugins（複数Skillをパッケージ化）</h4>
<p>2026年2月にリリースされたPlugin Marketplaceには1,000以上のスキル：</p>
<ul class="report-list">
<li><strong>Superpowers</strong>（GitHub Stars 40.9K）：「ブレインストーム→仕様→計画→サブエージェント実行→レビュー→マージ」を構造化</li>
<li><strong>Subagent-driven Development</strong>：タスクごとに新鮮なサブエージェントを派遣、二段階レビュー</li>
<li><strong>agent-browser</strong>：Webインターフェースを安定したエレメント参照で操作</li>
</ul>

<h4>③ Routines（クラウド常駐の決定打）</h4>
<p>4月14日リリース。<strong>ノートPCを閉じていてもクラウドで自動実行</strong>。具体例：</p>
<ul class="report-list">
<li>毎週日曜23時：今週のAIニュース → Deep Research Max → ブランドガイドで整形 → Drive保存</li>
<li>毎月1日：先月のサロン質問集計 → FAQ抽出 → 次回FAQ資料を自動生成</li>
<li>毎日朝6時：Claude/Gemini/ChatGPT最新アップデート → 重要度判定 → 配信</li>
</ul>

<h3>1 — Codex への深掘り対抗策</h3>

<h4>対抗の本質</h4>
<p>Codexの強みは「macOSアプリをそのまま動かす」こと。しかし教育コンテンツ制作で実際に作っているのは <strong>.pptxファイル直接生成</strong>。これはCodexのアプローチより<strong>むしろ堅牢で再現性が高い</strong>です。</p>

<h4>戦略</h4>
<ol class="report-list-num">
<li>Claude Code + Skills を「.pptx生成パイプライン」として完成させる（AutoDream / Auto Mode（Aggressive）/ Channels）</li>
<li>macOSアプリ操作が本当に必要な場合は Antigravity（無料プレビュー）</li>
<li>「macOSアプリを動かす」発想自体を疑う</li>
</ol>

<div class="report-insight">
<p><strong>結論：</strong>この領域は実は既に勝っている可能性が高い。Claude Code + Skills の蓄積資産が、Codex Computer Useよりも安定した「結果だけ欲しい」体験を作っています。</p>
</div>

<h3>2 — Operator への深掘り対抗策</h3>

<h4>使い分けマトリクス</h4>

<div class="report-table-wrap">
<table class="report-table">
<thead>
<tr><th>タスクの性質</th><th>使うツール</th></tr>
</thead>
<tbody>
<tr><td>純粋なブラウザ完結タスク</td><td>Chrome Auto Browse</td></tr>
<tr><td>ブラウザ + ローカルファイル</td><td>Claude Cowork Computer Use</td></tr>
<tr><td>複数ブラウザタスクの並列実行</td><td>Antigravity</td></tr>
<tr><td>定期実行が必要</td><td>Claude Cowork Routines</td></tr>
</tbody>
</table>
</div>

<h4>具体例</h4>
<ul class="report-list">
<li>「片倉台周辺のシニア向けカフェを5件比較して、Wi-Fi有・席間隔広め・電源あり、で表に」→ Auto Browse</li>
<li>「公民館予約サイトをチェックして、空き状況を /Desktop/サロン予定.xlsx に追記」→ Claude Cowork CU</li>
<li>「サイトの過去記事一覧を取得して、Obsidian管理ノートを更新」→ Claude Cowork CU</li>
</ul>

<h3>3 — DALL-E 4 / Images 2.0 への深掘り対抗策</h3>

<h4>Nano Banana Pro を「メインエンジン」にする</h4>

<h4>教育インフォグラフィックのプロンプト構造</h4>
<pre class="report-code"><code>Topic: 何の話か
Audience: 誰向けか
Title: タイトル文字（日本語OK）
Data/Context: 含めるべき具体的な情報・順序
Reference Materials: 元になるソース
Style: ブランド準拠（カラー、フォント、レイアウト）</code></pre>

<p>これを使うと、「NotebookLMの基本機能を3ステップで説明する縦型インフォグラフィック」が、<strong>プロンプト1つで4K完成品まで一直線</strong>に生成されます。これこそ「アウトプット直行型」の典型例。</p>

<h3>4 — 「アウトプット直行型」体験の総合戦略</h3>

<h4>3段ロケット構成</h4>

<div class="report-phase">
<div class="report-phase-num">段階 1</div>
<h4>Claude Cowork Routines（クラウド常駐の情報収集）</h4>
<p>毎週・毎日・毎月の自動情報収集。Deep Research Maxを内部で呼び出して、構造化レポートを保存。「寝ている間に、今週のAI業界がブリーフィングされている」状態を作る。</p>
</div>

<div class="report-phase">
<div class="report-phase-num">段階 2</div>
<h4>Claude Skills（教材・配布物の自動生成）</h4>
<p>既存のSkillが動く。段階1で集めた情報をインプットに、配布可能な完成品を生成。「インプット = 1行のテーマ指示」「アウトプット = .pptx + .docx + 画像セット」。</p>
</div>

<div class="report-phase">
<div class="report-phase-num">段階 3</div>
<h4>Nano Banana Pro / Veo 3（ビジュアル仕上げ）</h4>
<p>段階2の完成品に、画像・動画を自動付加。講座導入用の8秒動画（Veo 3）、補足インフォグラフィック（Nano Banana Pro）。</p>
</div>

<div class="report-pullquote">
この3段ロケットが完成すると、やることは<br/>「今月のテーマは○○です」と入力するだけになる。
</div>

<h3>5 — 実装ロードマップ</h3>

<div class="report-phase">
<div class="report-phase-num">Week 1</div>
<h4>Claude Cowork基本設定</h4>
<p>Claude Desktopアプリの Cowork機能を有効化。既存Skillsの動作確認。Auto Mode を Balanced に設定。</p>
</div>

<div class="report-phase">
<div class="report-phase-num">Week 2</div>
<h4>Routinesで情報収集を自動化</h4>
<p>「週次AIニュース収集」Routine（Deep Research Max呼び出し）。「月次サロン質問集計」Routine。Driveとの連携を確認。</p>
</div>

<div class="report-phase">
<div class="report-phase-num">Week 3-4</div>
<h4>Chrome Auto Browse の運用開始</h4>
<p>1日20タスクの上限内で実用ケースを5つ試す。Cowork Computer Useとの使い分けを定着させる。</p>
</div>

<div class="report-phase">
<div class="report-phase-num">Month 2</div>
<h4>画像生成パイプライン構築</h4>
<p>infographicプロンプト生成SkillをNano Banana Pro最適化版に拡張。ブランドガイド参照画像を14枚セット作成。</p>
</div>

<div class="report-phase">
<div class="report-phase-num">Month 3</div>
<h4>3段ロケットの統合</h4>
<p>Routines → Skills → Nano Banana Pro の連鎖を実装。「テーマ1行 → 完成配布物」の最短ルートを完成。Dispatchでモバイル運用にも対応。</p>
</div>

<h3>6 — 結論</h3>

<p>ChatGPT 5.5が「Workspace Agentsで結果だけ返す」を売りにしている裏側には、<strong>事前に仕組みを作り込む</strong>設計思想があります。同じ思想を、Claude Pro + Gemini Pro でも完全に再現可能です。</p>

<p>その鍵は：</p>
<ol class="report-list-num">
<li>Claude Skills（処方箋）</li>
<li>Claude Cowork（実行エンジン）</li>
<li>Routines（クラウド常駐）</li>
<li>Nano Banana Pro / Veo 3（ビジュアル）</li>
<li>Chrome Auto Browse（ブラウザタスク）</li>
</ol>

<p>これらを組み合わせれば、「<strong>テーマを1行入力するだけで、配布可能な教材が手元に届く</strong>」体験を、月$40の契約範囲内で構築できます。</p>

<div class="report-ornament">❦ ❦ ❦</div>

</article>

</div>

</div>

<style>
/* === yk_memo埋め込みレポートUI（スコープ限定） === */
.report-app {
  --r-ink: #1a1a1a;
  --r-ink-soft: #2d2d2d;
  --r-ink-muted: #6b6b6b;
  --r-paper: #f5f1e8;
  --r-paper-soft: #ebe5d4;
  --r-accent: #c8392f;
  --r-accent-soft: #e8a098;
  --r-gold: #b8924a;
  --r-line: #d4cdb8;
  --r-highlight: #fff8d6;
  --r-code-bg: #2a2620;
  --r-code-text: #e8d8b0;

  display: grid;
  grid-template-columns: 240px 1fr;
  gap: 0;
  margin: 3rem 0;
  background: var(--r-paper);
  border: 2px solid var(--r-ink);
  font-family: "Noto Serif JP", "Cormorant Garamond", Georgia, serif;
  line-height: 1.85;
  color: var(--r-ink);
}

.report-app * {
  box-sizing: border-box;
}

.report-nav {
  background: var(--r-ink);
  color: var(--r-paper);
  padding: 2rem 1.5rem;
  border-right: 4px solid var(--r-accent);
  position: relative; /* sticky was removed due to Astro rendering issue (2026-05-10) */
  top: 1rem;
  align-self: start;
  max-height: calc(100vh - 2rem);
  overflow-y: auto;
}

.report-brand {
  font-style: italic;
  font-weight: 500;
  font-size: 0.75rem;
  letter-spacing: 0.2em;
  color: var(--r-gold);
  text-transform: uppercase;
  margin-bottom: 0.3rem;
}

.report-brand-sub {
  font-size: 1rem;
  font-weight: 700;
  line-height: 1.4;
  margin-bottom: 1.5rem;
  padding-bottom: 1.5rem;
  border-bottom: 1px solid #444;
  color: var(--r-paper);
}

.report-nav-list {
  display: flex;
  flex-direction: column;
}

.report-nav-item {
  display: flex;
  align-items: flex-start;
  gap: 0.6rem;
  color: var(--r-paper);
  text-decoration: none;
  padding: 0.7rem 0;
  font-size: 0.9rem;
  line-height: 1.4;
  border-bottom: 1px dotted #333;
  transition: all 0.3s ease;
  cursor: pointer;
}

.report-nav-item:hover, .report-nav-item.active {
  color: var(--r-accent-soft);
  padding-left: 0.5rem;
  border-bottom-color: var(--r-accent);
}

.report-nav-num {
  font-style: italic;
  color: var(--r-gold);
  font-size: 0.85rem;
  flex-shrink: 0;
  padding-top: 0.1rem;
}

.report-nav-text {
  flex: 1;
}

.report-content {
  padding: 3rem;
  min-height: 600px;
}

.report {
  display: none;
}

.report.active {
  display: block;
  animation: report-fade-in 0.5s ease;
}

@keyframes report-fade-in {
  from { opacity: 0; transform: translateY(8px); }
  to { opacity: 1; transform: translateY(0); }
}

.report-cover {
  margin-bottom: 2.5rem;
  padding-bottom: 2rem;
  border-bottom: 3px double var(--r-ink);
}

.report-eyebrow {
  font-style: italic;
  font-size: 0.85rem;
  color: var(--r-accent);
  letter-spacing: 0.1em;
  margin-bottom: 1rem;
  display: flex;
  align-items: center;
  gap: 1rem;
}

.report-eyebrow::after {
  content: "";
  flex: 1;
  height: 1px;
  background: var(--r-line);
}

.report-title {
  font-size: 1.8rem !important;
  font-weight: 700;
  line-height: 1.3;
  color: var(--r-ink) !important;
  margin: 0 0 0.8rem !important;
  border: none !important;
  padding: 0 !important;
}

.report-subtitle {
  font-style: italic;
  font-size: 1.1rem;
  color: var(--r-ink-muted);
  margin-bottom: 1.5rem;
  font-weight: 400;
}

.report-meta-bar {
  display: flex;
  gap: 1.5rem;
  font-size: 0.8rem;
  color: var(--r-ink-muted);
  padding: 0.8rem 0;
  border-top: 1px solid var(--r-ink);
  border-bottom: 1px solid var(--r-line);
  flex-wrap: wrap;
}

.report-meta-item strong {
  font-style: italic;
  font-weight: 500;
  color: var(--r-accent);
  margin-right: 0.4rem;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  font-size: 0.7rem;
  background: none !important;
}

.report-lead {
  font-size: 1.1rem !important;
  line-height: 1.7;
  color: var(--r-ink) !important;
  margin: 1.5rem 0 2rem !important;
}

.report .report-lead::first-letter {
  font-family: "Cormorant Garamond", Georgia, serif;
  float: left;
  font-size: 4rem;
  line-height: 0.9;
  padding: 0.3rem 0.7rem 0 0;
  color: var(--r-accent);
  font-weight: 600;
}

.report h3 {
  font-size: 1.4rem !important;
  font-weight: 700;
  margin: 2.5rem 0 1rem !important;
  color: var(--r-ink) !important;
  line-height: 1.4;
  position: relative;
  padding-left: 1.2rem !important;
  border: none !important;
}

.report h3::before {
  content: "";
  position: absolute;
  left: 0;
  top: 0.5rem;
  width: 5px;
  height: 1.3rem;
  background: var(--r-accent);
}

.report h4 {
  font-size: 1.05rem !important;
  font-weight: 600;
  margin: 1.6rem 0 0.8rem !important;
  color: var(--r-ink-soft) !important;
  border: none !important;
  padding: 0 !important;
}

.report p {
  margin-bottom: 1.1rem !important;
  color: var(--r-ink-soft) !important;
  font-size: 0.98rem;
}

.report strong {
  font-weight: 700;
  color: var(--r-ink);
  background: linear-gradient(180deg, transparent 60%, var(--r-highlight) 60%);
  padding: 0 0.1em;
}

.report-pullquote {
  font-style: italic;
  font-size: 1.3rem;
  line-height: 1.5;
  color: var(--r-ink);
  border-left: 4px solid var(--r-accent);
  padding: 1.3rem 1.8rem;
  margin: 2rem 0;
  background: var(--r-paper-soft);
  position: relative;
}

.report-pullquote::before {
  content: """;
  font-family: "Cormorant Garamond", Georgia, serif;
  font-size: 4rem;
  color: var(--r-accent);
  position: absolute;
  top: -0.8rem;
  left: 0.8rem;
  opacity: 0.3;
  line-height: 1;
}

.report-pullquote-attr {
  display: block;
  font-style: normal;
  font-size: 0.8rem;
  color: var(--r-ink-muted);
  margin-top: 0.8rem;
  text-align: right;
  letter-spacing: 0.05em;
}

.report-table-wrap {
  margin: 1.5rem 0;
  border: 2px solid var(--r-ink);
  background: white;
  overflow-x: auto;
}

.report-table {
  width: 100%;
  border-collapse: collapse;
  font-size: 0.85rem;
  margin: 0 !important;
}

.report-table th {
  background: var(--r-ink);
  color: var(--r-paper);
  padding: 0.8rem;
  text-align: left;
  font-weight: 600;
  font-size: 0.8rem;
  letter-spacing: 0.05em;
  border-right: 1px solid #444;
}

.report-table th:last-child { border-right: none; }

.report-table td {
  padding: 0.8rem;
  border-bottom: 1px solid var(--r-line);
  border-right: 1px solid var(--r-line);
  vertical-align: top;
  color: var(--r-ink-soft);
}

.report-table td:last-child { border-right: none; }

.report-table tr:last-child td { border-bottom: none; }

.report-table tr:nth-child(even) td { background: var(--r-paper-soft); }

.report-table td strong {
  background: none;
  color: var(--r-accent);
}

.report-list {
  margin: 1rem 0 1.3rem !important;
  padding-left: 0 !important;
  list-style: none !important;
}

.report-list li {
  position: relative;
  padding: 0.3rem 0 0.3rem 1.6rem !important;
  color: var(--r-ink-soft) !important;
  font-size: 0.95rem;
  list-style: none !important;
  margin: 0 !important;
}

.report-list li::before {
  content: "✦";
  position: absolute;
  left: 0;
  top: 0.3rem;
  color: var(--r-accent);
  font-size: 0.8rem;
}

.report-list-num {
  margin: 1rem 0 1.3rem !important;
  padding-left: 0 !important;
  list-style: none !important;
  counter-reset: r-counter;
}

.report-list-num li {
  position: relative;
  padding: 0.3rem 0 0.3rem 2rem !important;
  color: var(--r-ink-soft) !important;
  font-size: 0.95rem;
  counter-increment: r-counter;
  list-style: none !important;
  margin: 0 !important;
}

.report-list-num li::before {
  content: counter(r-counter, decimal-leading-zero);
  position: absolute;
  left: 0;
  top: 0.3rem;
  color: var(--r-accent);
  font-style: italic;
  font-weight: 600;
  font-size: 0.9rem;
}

.report-verdict {
  background: white;
  border-left: 6px solid var(--r-accent);
  padding: 1.3rem 1.8rem;
  margin: 2rem 0;
  box-shadow: 4px 4px 0 var(--r-ink);
}

.report-verdict-label {
  font-style: italic;
  font-size: 0.8rem;
  color: var(--r-accent);
  letter-spacing: 0.15em;
  text-transform: uppercase;
  margin-bottom: 0.5rem;
  display: block;
}

.report-verdict-text {
  font-size: 1.05rem;
  font-weight: 600;
  color: var(--r-ink);
  line-height: 1.5;
}

.report-insight {
  background: var(--r-paper-soft);
  padding: 1.3rem 1.8rem;
  margin: 1.8rem 0;
  border: 1px dashed var(--r-ink-muted);
  position: relative;
}

.report-insight::before {
  content: "INSIGHT";
  position: absolute;
  top: -0.7rem;
  left: 1.3rem;
  background: var(--r-paper);
  padding: 0.15rem 0.7rem;
  font-style: italic;
  font-size: 0.65rem;
  letter-spacing: 0.2em;
  color: var(--r-accent);
}

.report-insight p {
  margin: 0 !important;
}

.report-code {
  background: var(--r-code-bg) !important;
  color: var(--r-code-text);
  padding: 1.2rem !important;
  margin: 1.3rem 0 !important;
  overflow-x: auto;
  border-left: 4px solid var(--r-gold);
  font-family: "JetBrains Mono", "Courier New", monospace;
  font-size: 0.82rem;
  line-height: 1.6;
}

.report-code code {
  background: none !important;
  padding: 0 !important;
  color: var(--r-code-text) !important;
}

.report-ornament {
  text-align: center;
  margin: 2.5rem 0;
  color: var(--r-gold);
  font-size: 1.3rem;
  letter-spacing: 1rem;
}

.report-phase {
  background: white;
  border: 2px solid var(--r-ink);
  padding: 1.3rem;
  margin: 1rem 0;
  position: relative;
}

.report-phase-num {
  position: absolute;
  top: -0.9rem;
  left: 1rem;
  background: var(--r-accent);
  color: white;
  padding: 0.25rem 0.9rem;
  font-style: italic;
  font-weight: 600;
  font-size: 0.85rem;
  letter-spacing: 0.1em;
}

.report-phase h4 {
  margin: 0.5rem 0 0.5rem !important;
}

.report-phase p {
  margin: 0 !important;
  font-size: 0.95rem;
}

/* Mobile */
@media (max-width: 768px) {
  .report-app {
    grid-template-columns: 1fr;
  }

  .report-nav {
    position: static;
    max-height: none;
    border-right: none;
    border-bottom: 4px solid var(--r-accent);
    padding: 1.5rem;
  }

  .report-nav-list {
    flex-direction: row;
    overflow-x: auto;
    gap: 1rem;
    margin: 0 -1.5rem;
    padding: 0 1.5rem;
  }

  .report-nav-item {
    flex-shrink: 0;
    min-width: 180px;
    border-bottom: 2px solid #333;
  }

  .report-content {
    padding: 1.5rem;
  }

  .report-title {
    font-size: 1.4rem !important;
  }

  .report-pullquote {
    font-size: 1.05rem;
    padding: 1rem 1.2rem;
  }

  .report-cover {
    margin-bottom: 1.5rem;
  }

  .report h3 {
    font-size: 1.2rem !important;
  }
}
</style>

<script is:inline>
(function() {
  document.querySelectorAll('.report-app').forEach(app => {
    const navItems = app.querySelectorAll('.report-nav-item');
    const reports = app.querySelectorAll('.report');

    navItems.forEach(item => {
      item.addEventListener('click', (e) => {
        e.preventDefault();
        const target = item.getAttribute('data-target');

        navItems.forEach(n => n.classList.remove('active'));
        item.classList.add('active');

        reports.forEach(r => r.classList.remove('active'));
        const targetEl = app.querySelector('#' + target);
        if (targetEl) targetEl.classList.add('active');

        app.scrollIntoView({ behavior: 'smooth', block: 'start' });
      });
    });
  });
})();
</script>

</div>

---

## 注釈：このレポートの位置づけ

このレポートは、私がClaude（チャット版）と対話しながら作成した調査記録です。AnthropicのClaude（特にClaude Opus 4.7）のWeb検索機能を使って、2026年4月時点の各社製品情報を収集し、自分の活動文脈に当てはめながら4本のレポートに整理しました。

「Geminiが遅れている」という巷の言説に違和感を覚えたのが出発点で、調べていくうちに**実は前提が間違っていた**ことが見えてきたのが面白かったところです。同じように「自分の契約で足りているのか」と気になっている方の参考になれば嬉しいです。

なお、Claude Cowork RoutinesやAntigravityなど、本記事で取り上げた機能の一部は、私自身まだ本格運用していないものも含まれます。今後の実践記録は、シリーズ続編としてまた書きます。

### 関連リンク

- [Anthropic Claude](https://claude.ai/)
- [Google AI（Gemini）](https://gemini.google.com/)
- [NotebookLM](https://notebooklm.google.com/)
- [Antigravity](https://antigravity.google/)

---

*この記事は2026年5月9日時点の情報をもとにしています。各社のサービスは日々更新されるため、最新の情報は公式サイトをご確認ください。*
