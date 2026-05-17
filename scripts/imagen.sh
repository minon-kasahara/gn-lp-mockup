#!/bin/bash
# imagen.sh - Imagen 4 image generation helper
# Usage: ./scripts/imagen.sh "prompt" [aspect_ratio] output_path [model]
#
# Defaults:
#   aspect_ratio = 1:1
#   model        = imagen-4.0-generate-001
#
# Available aspect ratios: 1:1 / 16:9 / 9:16 / 4:3 / 3:4 / 3:2 / 2:3
# Available models:
#   imagen-4.0-generate-001        (default — 標準・高品質)
#   imagen-4.0-ultra-generate-001  (Imagen 4 Ultra — 最高品質・コスト高)
#   imagen-4.0-fast-generate-001   (Imagen 4 Fast — 高速・低コスト)
#   imagen-3.0-generate-002        (Imagen 3 — 旧世代)
#
# Requires:
#   - GEMINI_API_KEY set via `launchctl setenv GEMINI_API_KEY "..."`
#   - jq installed (default on macOS)
#   - curl

set -e

PROMPT="$1"
ASPECT="${2:-1:1}"
OUTPUT="$3"
MODEL="${4:-imagen-4.0-generate-001}"

# --- 引数検証 ---
if [ -z "$PROMPT" ] || [ -z "$OUTPUT" ]; then
  cat <<EOF
Usage: $0 "prompt" [aspect_ratio] output_path [model]

  aspect_ratio: 1:1 (default) / 16:9 / 9:16 / 4:3 / 3:4 / 3:2 / 2:3
  output_path:  保存先パス（拡張子.pngを推奨）
  model:        imagen-4.0-generate-001 (default)
                imagen-4.0-ultra-generate-001
                imagen-4.0-fast-generate-001
                imagen-3.0-generate-002

Example:
  $0 "abstract minimal blue and yellow shapes" 16:9 /tmp/test.png
  $0 "FV hero illustration ..." 16:9 ./hero.png imagen-4.0-ultra-generate-001
EOF
  exit 1
fi

# --- API キー取得 ---
API_KEY=$(launchctl getenv GEMINI_API_KEY)
if [ -z "$API_KEY" ]; then
  echo "❌ Error: GEMINI_API_KEY が launchctl に未設定です"
  echo "   設定方法: launchctl setenv GEMINI_API_KEY \"AIzaSy...\""
  exit 1
fi

# --- 出力先ディレクトリ作成 ---
mkdir -p "$(dirname "$OUTPUT")"

# --- API 呼び出し ---
TMP=$(mktemp)
trap "rm -f $TMP" EXIT

# jq でJSONを安全に構築（プロンプト内の特殊文字対策）
PAYLOAD=$(jq -n --arg prompt "$PROMPT" --arg aspect "$ASPECT" '{
  instances: [{prompt: $prompt}],
  parameters: {sampleCount: 1, aspectRatio: $aspect}
}')

HTTP_STATUS=$(curl -s -o "$TMP" -w "%{http_code}" -X POST \
  "https://generativelanguage.googleapis.com/v1beta/models/${MODEL}:predict?key=${API_KEY}" \
  -H "Content-Type: application/json" \
  -d "$PAYLOAD")

# --- HTTPステータスチェック ---
if [ "$HTTP_STATUS" != "200" ]; then
  echo "❌ Error: HTTP $HTTP_STATUS"
  echo "--- レスポンス（先頭500文字） ---"
  head -c 500 "$TMP"
  echo ""
  exit 1
fi

# --- 画像保存 ---
B64=$(jq -r '.predictions[0].bytesBase64Encoded // empty' "$TMP")
if [ -z "$B64" ] || [ "$B64" = "null" ]; then
  echo "❌ Error: 画像データが返ってきませんでした"
  echo "--- レスポンス ---"
  cat "$TMP"
  exit 1
fi

echo "$B64" | base64 -d > "$OUTPUT"

# --- 結果報告 ---
if [ -s "$OUTPUT" ]; then
  SIZE=$(stat -f%z "$OUTPUT" 2>/dev/null || stat -c%s "$OUTPUT")
  echo "✅ Saved: $OUTPUT ($SIZE bytes)"
  echo "   model:  $MODEL"
  echo "   aspect: $ASPECT"
else
  echo "❌ Error: 保存に失敗（出力が空）"
  exit 1
fi
