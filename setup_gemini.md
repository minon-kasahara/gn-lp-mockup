# Gemini 画像生成セットアップ（実行手順）

> **kasahara セッションは初回起動時に必ず実行**（azalea は完了済み）
> 所要 3〜5分・全部 Claude（チャット）に頼むだけ
>
> 📌 **前提**:
> - Claude デスクトップアプリ（macOS）で作業
> - **コマンドはすべて Claude に依頼して Bash で実行してもらう**（ターミナル.app を開く必要なし）
> - Claude が Bash 実行する際の許可プロンプトには「許可」してください

最終更新: 2026-04-27（Claude依頼方式に変更）

---

## Step 1. Claude にセットアップ依頼

Claude デスクトップアプリの**入力欄に以下をそのままコピペ**して送信:

> 以下のセットアップ手順を Bash で順に実行してください。各コマンドの結果も簡潔に教えてください。
>
> 1. `claude plugin marketplace add guinacio/claude-image-gen`
> 2. `claude plugin install media-pipeline@media-pipeline-marketplace`
> 3. `claude plugin list`（`media-pipeline@media-pipeline-marketplace ✔ enabled` が出るか確認）
> 4. `launchctl setenv GEMINI_API_KEY "AIzaSyC5dXTwFy6VoLelFmGmgVaEyNtuO1WRNWI"`
> 5. `launchctl getenv GEMINI_API_KEY`（同じキー文字列が出るか確認）

→ Claude が「全部成功しました」と返したら次へ

---

## Step 2. Claude デスクトップアプリを再起動

**Cmd+Q で完全終了 → 再度起動**（プラグインを反映させるため必須）

---

## Step 3. 動作確認

再起動後、入力欄に以下をコピペ:

> Gemini で 1:1 のテスト画像を生成してください。プロンプトは `abstract minimal blue and yellow shapes`、保存先は `02_work/mockup/assets/generated/test_kasahara_simple_01.png`、モデルは `gemini-2.5-flash-image` でお願いします。

→ Claude が「生成完了」と返したら**完了** 🎉

---

## Step 4. 完了記録

入力欄に以下を依頼:

> activity_log.md の冒頭に、kasahara のGeminiセットアップ完了の `[DONE]` エントリを追記してください。

---

## 利用可能モデル

| モデル | 用途 |
| --- | --- |
| `gemini-2.5-flash-image` | 推奨・低コスト |
| `gemini-3.1-flash-image-preview` | バランス型 |
| `gemini-3-pro-image-preview` | 高品質・高コスト |

---

## トラブル対処

| 症状 | 対処 |
| --- | --- |
| `API key not valid` | Step 1 の手順4を再実行 → Cmd+Q で再起動 |
| `quota exceeded / limit:0` | 同梱の API キーが正しく設定されているか確認（Billing は azalea 側で済み） |
| `Invalid model` | モデル名のタイポ。利用可能モデル表を参照 |
| Claude が「Gemini 使えない」 | プラグイン未認識 → Step 1 を再依頼 → Cmd+Q で完全終了→再起動 |
| デスクトップアプリのチャットで `/plugin isn't available` と出る | `/plugin` 直接入力ではなく **Claudeに `claude plugin install ...` をBash実行依頼**するのが正解 |

---

## 補足

- `launchctl setenv` はパソコン再起動でリセット。再起動時は Step 1 の手順4のみ Claude に再依頼すれば OK
- プロジェクト終了後は API キーをローテーション（Google AI Studio で旧削除→新発行→このファイル書き換え）

---

## 関連ファイル

- AGENT.md §12 — 画像生成ワークフロー全般
- mockup/assets/INDEX.md — 生成画像の管理台帳
- mockup/assets/generated/ — 生成画像格納先
