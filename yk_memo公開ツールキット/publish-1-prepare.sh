#!/bin/bash
# ============================================================
# yk_memo記事公開スクリプト（前半）
# ------------------------------------------------------------
# 用途：作業ブランチ作成〜記事配置〜devサーバー起動までを自動化
# 使い方：
#   1. 下の SLUG="..." を書き換える
#   2. ターミナルで: bash publish-1-prepare.sh
#   3. ブラウザで http://localhost:4321/notes/[SLUG]/ を確認
#   4. 問題なければ Ctrl+C で停止し、publish-2-deploy.sh を実行
# ============================================================

# ▼▼▼ 記事ごとに書き換える1行 ▼▼▼
SLUG="hyperframes-zero-cost-video-vol2"
# ▲▲▲ ここまで ▲▲▲

# 記事ファイルの保存元（必要に応じて書き換え）
SOURCE_FILE="$HOME/Downloads/${SLUG}.md"

# プロジェクトディレクトリ
PROJECT_DIR="/Volumes/Data-yk1/書類２/Projects/yk_memo"

# ============================================================
# 以下、自動実行
# ============================================================

set -e  # エラーが出たら即停止

echo "🚀 yk_memo公開作業（前半）を開始します"
echo "   SLUG: ${SLUG}"
echo "   元ファイル: ${SOURCE_FILE}"
echo ""

# 1. 元ファイルの存在確認
if [ ! -f "${SOURCE_FILE}" ]; then
    echo "❌ エラー：記事ファイルが見つかりません"
    echo "   ${SOURCE_FILE} を確認してください"
    exit 1
fi

# 2. プロジェクトに移動
echo "📁 プロジェクトに移動..."
cd "${PROJECT_DIR}"

# 3. 作業ツリーがクリーンか確認
if [ -n "$(git status --porcelain)" ]; then
    echo "⚠️  警告：未コミットの変更があります"
    git status --short
    echo ""
    read -p "このまま続けますか？ (y/N): " confirm
    if [ "${confirm}" != "y" ]; then
        echo "中止しました"
        exit 0
    fi
fi

# 4. mainを最新化
echo "🔄 mainブランチを最新化..."
git checkout main
git pull origin main

# 5. 新規ブランチを作成
BRANCH_NAME="feature/${SLUG}"
echo "🌿 新規ブランチを作成: ${BRANCH_NAME}"
git checkout -b "${BRANCH_NAME}"

# 6. 記事ファイルをコピー
echo "📝 記事ファイルを配置..."
cp "${SOURCE_FILE}" "src/content/notes/${SLUG}.md"
echo "   ✅ src/content/notes/${SLUG}.md"

# 7. frontmatterの先頭を表示
echo ""
echo "📋 frontmatter確認："
echo "------------------------------------"
head -10 "src/content/notes/${SLUG}.md"
echo "------------------------------------"
echo ""

# 8. devサーバーを起動
echo "🌐 devサーバーを起動します..."
echo "   ブラウザで以下のURLを確認してください："
echo "   👉 http://localhost:4321/notes/${SLUG}/"
echo "   👉 http://localhost:4321/  （トップページ一覧）"
echo ""
echo "   問題なければ Ctrl+C で停止して、次に publish-2-deploy.sh を実行してください"
echo ""

npm run dev
