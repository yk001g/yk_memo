#!/bin/bash
# ============================================================
# yk_memo記事公開スクリプト（後半）
# ------------------------------------------------------------
# 用途：commit〜push〜mainへのマージまでを自動化
# 前提：publish-1-prepare.sh を実行済みで、ブラウザ確認も完了していること
# 使い方：
#   1. 下の SLUG="..." を publish-1-prepare.sh と同じ値にする
#   2. COMMIT_MSG を記事に合わせて書き換える
#   3. ターミナルで: bash publish-2-deploy.sh
#   4. 1〜3分待って https://yk-memo.vercel.app/ で本番反映を確認
# ============================================================

# ▼▼▼ 記事ごとに書き換える項目 ▼▼▼
SLUG="hyperframes-zero-cost-video-vol2"
COMMIT_MSG="Add: Hyperframes zero-cost video series vol.2"
# ▲▲▲ ここまで ▲▲▲

# プロジェクトディレクトリ
PROJECT_DIR="/Volumes/Data-yk1/書類２/Projects/yk_memo"

# ============================================================
# 以下、自動実行
# ============================================================

set -e  # エラーが出たら即停止

BRANCH_NAME="feature/${SLUG}"

echo "🚀 yk_memo公開作業（後半）を開始します"
echo "   SLUG: ${SLUG}"
echo "   ブランチ: ${BRANCH_NAME}"
echo "   コミットメッセージ: ${COMMIT_MSG}"
echo ""

# 確認プロンプト
read -p "続行してよいですか？ (y/N): " confirm
if [ "${confirm}" != "y" ]; then
    echo "中止しました"
    exit 0
fi

# 1. プロジェクトに移動
cd "${PROJECT_DIR}"

# 2. 現在のブランチが正しいか確認
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "${CURRENT_BRANCH}" != "${BRANCH_NAME}" ]; then
    echo "❌ エラー：現在のブランチが ${BRANCH_NAME} ではありません"
    echo "   現在のブランチ: ${CURRENT_BRANCH}"
    echo "   先に publish-1-prepare.sh を実行してください"
    exit 1
fi

# 3. ファイルが存在するか確認
ARTICLE_PATH="src/content/notes/${SLUG}.md"
if [ ! -f "${ARTICLE_PATH}" ]; then
    echo "❌ エラー：記事ファイルが見つかりません"
    echo "   ${ARTICLE_PATH}"
    exit 1
fi

# 4. ステージング・コミット・push
echo "📦 commit & push..."
git add "${ARTICLE_PATH}"
git commit -m "${COMMIT_MSG}"
git push origin "${BRANCH_NAME}"

# 5. mainにマージ
echo "🔀 mainにマージ..."
git checkout main
git merge "${BRANCH_NAME}"
git push origin main

# 6. 作業ブランチを削除（任意）
echo ""
read -p "作業ブランチ ${BRANCH_NAME} を削除しますか？ (y/N): " del_confirm
if [ "${del_confirm}" = "y" ]; then
    git branch -d "${BRANCH_NAME}"
    git push origin --delete "${BRANCH_NAME}" 2>/dev/null || true
    echo "   ✅ 作業ブランチを削除しました"
fi

# 7. 完了メッセージ
echo ""
echo "============================================"
echo "✅ 公開作業が完了しました！"
echo "============================================"
echo ""
echo "🌐 1〜3分後に以下のURLで本番反映を確認："
echo "   👉 https://yk-memo.vercel.app/notes/${SLUG}/"
echo "   👉 https://yk-memo.vercel.app/"
echo ""
echo "📊 デプロイ進捗の確認："
echo "   👉 https://vercel.com/dashboard"
echo ""
echo "📝 公開後のチェックリスト："
echo "   - [ ] トップページのRecent notesに表示されているか"
echo "   - [ ] OGP画像が表示されるか"
echo "   - [ ] X（旧Twitter）で告知投稿"
echo "   - [ ] 記事末の「要ファクトチェック」項目を最終確認"
echo ""
