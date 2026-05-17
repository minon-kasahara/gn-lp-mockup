# モックアップ管理インデックス

HTMLモックアップの版管理・履歴を記録するファイル。
新規モックアップを作成・更新した際に、Agentが本ファイルに追記する。

---

## ディレクトリ構成

```
02_work/mockup/
├── INDEX.md           ← 本ファイル。版履歴・確定状況
├── drafts/            ← 壁打ち用のドラフト版（複数世代を保持）
└── final/             ← 最終確定版（1つ、または主要ページごと）
```

---

## ファイル命名ルール

### drafts/
- フォーマット: `v{連番}_{YYYYMMDD}_{対象セクション}_{短い説明}.html`
- 例:
  - `v01_20260424_fv_initial.html` — FVのたたき台1案目
  - `v02_20260424_fv_color_adjust.html` — FVの色調整2案目
  - `v03_20260425_full_first.html` — LP全体通しの1案目
- セクション単位で作る場合はそのセクション名、全体通しなら `full`
- 並列案の場合は同じ `v{連番}` で末尾に `_A` / `_B` / `_C` を付与
  - 例: `v04_20260425_fv_A.html`, `v04_20260425_fv_B.html`

### final/
- フォーマット: `{対象}_final.html`
- 例:
  - `lp_full_final.html` — LP全体の最終版
  - `fv_final.html` — FV単独の最終版（セクション単位で確定する場合）

---

## 版履歴

（新規作成時に追記。最新が上）

| 版 | 日付 | 保存先 | 対象 | 概要 | ステータス |
| --- | --- | --- | --- | --- | --- |
| v09-castme-hubblecolor | 2026-04-24 | drafts/v09_20260424_full_castme-hubblecolor.html | **全体** | **castme構造×hubbleカラー** (azalea): castme構造ベース（アシンメトリック/sparkle/ピル/ロゴ壁）+ hubble配色（濃紺×ブルー×黄×白）に置換 | 壁打ち中 |
| v08-hubble-full | 2026-04-24 | drafts/v08_20260424_full_hubble.html | **全体** | **hubble準拠 LP 全体** (azalea): 問いかけ型見出し主体・濃紺×ブルー波線×イエローマーカー・円形stat連結・Noto Serif引用 | 壁打ち中 |
| v07-castme-full | 2026-04-24 | drafts/v07_20260424_full_castme.html | **全体** | **castme準拠 LP 全体** (azalea): 大胆アシンメトリック・多色グラデ（pink/orange/yellow/blue）・丸ピルボタン・sparkle装飾・VCロゴ壁 | 壁打ち中 |
| v06-caroa-full  | 2026-04-24 | drafts/v06_20260424_full_caroa.html  | **全体** | **caroa準拠 LP 全体** (azalea): 物語型エディトリアル・Chapter I-VII構造・旅路SVG・クリーム×テラコッタ・明朝+サンス | 壁打ち中 |
| v05-muroom-full | 2026-04-24 | drafts/v05_20260424_full_muroom.html | **全体** | **muroom準拠 LP 全体** (azalea): 8セクション全通し・ヘッダー/フッター込み・実ロゴSVG埋込 | 壁打ち中 |
| v04-opex      | 2026-04-24 | drafts/v04_20260424_fv_opex.html      | FV | opex準拠v2 (azalea): 英語主題型エディトリアル・雑誌表紙風・オレンジCTA | 壁打ち中 |
| v04-castme    | 2026-04-24 | drafts/v04_20260424_fv_castme.html    | FV | castme準拠v2 (azalea): 大胆アシンメトリック・多色グラデ・VCロゴ壁面 | 壁打ち中 |
| v04-hubble    | 2026-04-24 | drafts/v04_20260424_fv_hubble.html    | FV | hubble準拠v2 (azalea): 問いかけ型見出し主体・円形stat連結・波線背景 | 壁打ち中 |
| v04-ecology   | 2026-04-24 | drafts/v04_20260424_fv_ecology.html   | FV | ecology準拠v2 (azalea): グリーン主軸・統合stat・葉っぱ装飾 | 壁打ち中 |
| v04-dginvoice | 2026-04-24 | drafts/v04_20260424_fv_dginvoice.html | FV | dginvoice準拠v2 (azalea): トップバナー×水平バブル5個×90秒CTA | 壁打ち中 |
| v04-muroom    | 2026-04-24 | drafts/v04_20260424_fv_muroom.html    | FV | muroom準拠v2 (azalea): 超ミニマル・白一色・大ブロブ・フッター内実績 | 壁打ち中 |
| v04-kagami    | 2026-04-24 | drafts/v04_20260424_fv_kagami.html    | FV | kagami準拠v2 (azalea): 縦型中央寄せ・フローティングカード5枚下配置 | 壁打ち中 |
| v04-caroa     | 2026-04-24 | drafts/v04_20260424_fv_caroa.html     | FV | caroa準拠v2 (azalea): 物語型エディトリアル・旅路SVG・Chapter構造 | 壁打ち中 |
| v03-opex    | 2026-04-24 | drafts/v03_20260424_fv_opex.html     | FV | opexpark準拠: ライトグレー×英字バックテキスト×3Dブロック | 壁打ち中 |
| v03-castme  | 2026-04-24 | drafts/v03_20260424_fv_castme.html   | FV | castme準拠: マルチグラデ×白×VCロゴ多段×安心ボックス | 壁打ち中 |
| v03-hubble  | 2026-04-24 | drafts/v03_20260424_fv_hubble.html   | FV | hubble準拠: 濃紺×ブルー波線×カードスタック | 壁打ち中 |
| v03-ecology | 2026-04-24 | drafts/v03_20260424_fv_ecology.html  | FV | ecology準拠: グリーン×数字大バナー×3カラムカード | 壁打ち中 |
| v03-dginvoice | 2026-04-24 | drafts/v03_20260424_fv_dginvoice.html | FV | dginvoice準拠: 信頼バッジ×3Dバブル訴求×並列CTA | 壁打ち中 |
| v03-muroom  | 2026-04-24 | drafts/v03_20260424_fv_muroom.html   | FV | muroom準拠: 白×大余白×淡ピンク×ブルーblob×数字リスト | 壁打ち中 |
| v03-kagami  | 2026-04-24 | drafts/v03_20260424_fv_kagami.html   | FV | kagami準拠: 白→ライトブルーグラデ×3Dカードスタック×2段CTA | 壁打ち中 |
| v03-caroa   | 2026-04-24 | drafts/v03_20260424_fv_caroa.html    | FV | caroa準拠: クリーム×テラコッタ×並列2CTA×ドット背景 | 壁打ち中 |
| v02E | 2026-04-24 | drafts/v02_20260424_fv_E.html | FV | パターンE: 斜め分割ダイナミック（白左／ネイビー右） | 壁打ち中 |
| v02D | 2026-04-24 | drafts/v02_20260424_fv_D.html | FV | パターンD: 大数字インパクト型（横一列グリッド） | 壁打ち中 |
| v02C | 2026-04-24 | drafts/v02_20260424_fv_C.html | FV | パターンC: ミントグリーン系（グリーングラデ） | 壁打ち中 |
| v02B | 2026-04-24 | drafts/v02_20260424_fv_B.html | FV | パターンB: ネイビー×白 2トーン（上濃紺・下白） | 壁打ち中 |
| v02A | 2026-04-24 | drafts/v02_20260424_fv_A.html | FV | パターンA: ライトブルー×グラデーション洗練版 | 壁打ち中 |
| v01 | 2026-04-24 | drafts/v01_20260424_fv_initial.html | FV | 初案。ライトブルー系グラデ＋ブロブ装飾、実績カード、確定コピー使用 | 壁打ち中 |

---

## 確定状況

**LP全体確定版**: [`final/lp_full_final.html`](final/lp_full_final.html)（2026-05-06、v09 ベース、64,000 bytes / 995 行）
**確定経緯**: ユーザー指示「v09 を最終版として Studio 実装を開始」（2026-05-06）

| セクション | 状態 | 確定版ファイル | 概要 |
| --- | --- | --- | --- |
| ヘッダー | ✅ 確定 | final/lp_full_final.html | ロゴSVG・ナビ6項目（課題/特徴/サービス/実績/提携VC/事例）・CTA2種（無料相談/資料DL） |
| FV（Hero） | ✅ 確定 | final/lp_full_final.html | キャッチ「挑戦するスタートアップに、補助金という追い風を。」+ VC特典比較カード + ロゴマーキー12社 |
| 課題提示（Problem） | ✅ 確定 | final/lp_full_final.html | 4枚カード（No.01〜04） |
| アプローチ（Approach） | ✅ 確定 | final/lp_full_final.html | 3ステップフロー（Discovery / Application / After Approval） |
| サービス詳細（Service） | ✅ 確定 | final/lp_full_final.html | 4カード（補助金/助成金/法認定/融資）+ VC特典バナー |
| 実績（Record） | ✅ 確定 | final/lp_full_final.html | 4スタッツカード（1,200社/800件/200億/279件）+ 補注 |
| VC提携（VC Partners） | ✅ 確定 | final/lp_full_final.html | 50+ ヘッドライン + ロゴグリッド12社 + 特典バナー |
| 事例（Cases） | ✅ 確定 | final/lp_full_final.html | 匿名3件（SaaS/D2C/FinTech） |
| CTA | ✅ 確定 | final/lp_full_final.html | 「1時間の無料相談」+ 3項目フォーム |
| フッター | ✅ 確定 | final/lp_full_final.html | 会社情報・サブナビ・認定経営革新等支援機関番号 |

**法務未確定事項**: [`../legal_check_20260506.md`](../legal_check_20260506.md) 参照。クライアント回答待ちの修正は Studio 実装後に追記反映予定。

---
