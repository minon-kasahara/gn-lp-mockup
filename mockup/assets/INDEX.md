# LP用アセット管理

LPで使用する画像・素材ファイルの管理インデックス。

最終更新: 2026-04-27（初版作成）

---

## ディレクトリ構成

```
02_work/mockup/assets/
├── INDEX.md           ← 本ファイル
├── laurel.svg         ← 月桂樹（Record セクション 実績訴求装飾）
├── illustrations/     ← セクション用イラスト SVG
│   ├── prob-01.svg    ← Problem No.01 カード用
│   ├── prob-02.svg    ← Problem No.02 カード用
│   ├── prob-03.svg    ← Problem No.03 カード用
│   └── prob-04.svg    ← Problem No.04 カード用
├── vc_logos/          ← 提携VCロゴ（12社）
└── generated/         ← Gemini で生成した画像
```

将来的に追加予定（必要時）:
- `case_logos/` — 事例企業ロゴ
- `originals/` — 元素材（Adobe Stock 等の購入素材があれば）

---

## 個別素材

### `illustrations/prob-01〜04.svg`（2026-05-12 追加・2026-05-13 INDEX 登録）
- **用途**: Problem セクション 4 カード（No.01〜04）の右下装飾イラスト。各カードのテーマ（制度選定困難 / 書類負担 / 採択後手続き / 落とし穴）に対応したビジネス系イラスト SVG。
- **元素材**: ユーザー提供（2026-05-12 13:33〜13:42 に illustrations/ に配置）
- **主な色**: 白・水色・濃青・グレー・黒（prob-03 のみオレンジあり）
- **利用箇所**: `mockup/drafts/v09_20260424_full_castme-hubblecolor.html` Problem セクション各 `.prob-card` 内。CSS `.prob-illust`（absolute, bottom:16px, right:16px, width:120px, z-index:0）で右下に配置。テキスト（z-index:1）の背面に収まる。

| ファイル | viewBox | 主な色 | 説明 |
|---|---|---|---|
| `prob-01.svg` | 0 0 287.249 246.773 | 白・水色・濃青・グレー・黄系（ネクタイ）・黒 | ビジネスマン顔アップ＋疑問符（顔フォーカス版・2026-05-13 再差替。旧版は `prob-01_orig.svg`） |
| `prob-02.svg` | 0 0 407.294 288.715 | 白・水色・濃青・グレー・黒 | （初版のまま） |
| `prob-03.svg` | 0 0 321.178 380.678 | 白・濃青・グレー・黒 | （旧 prob-04 を割当） |
| `prob-04.svg` | 0 0 457.739 351.719 | （要視認） | 2026-05-13 ユーザー添付の新規イラスト |

**割当変更履歴**:
- 2026-05-13: 03 → 01 / 04 → 03 / 添付 → 04 にシフト（ユーザー指示）。02 は変更なし。
- 2026-05-13（再差替）: prob-01.svg をユーザー添付の `18834_color.svg`（ビジネスマン顔アップ＋疑問符）に再差替。直前版は `prob-01_orig.svg` として退避。

---

### `laurel.svg`（2026-05-12 追加・差替）
- **用途**: Record セクション（実績数字バナー）の左右装飾。各統計を月桂樹で挟むことで「権威・実績の象徴」を演出。
- **元素材**: ユーザー提供（k0040_5.svg 由来 / 初版は k0040_6 だったが、よりコンパクトな k0040_5 に差替）。Adobe Illustrator エクスポートを軽量化整理。
- **viewBox**: `0 0 800 493.352`（左右1対の月桂樹を内包、横長で実績バナーに最適）
- **色**: `#B69333`（ゴールド）— SVG内 `.st0` クラスで指定
- **利用箇所**: `mockup/drafts/v09_20260424_full_castme-hubblecolor.html` Record セクション内 4 統計（1,200社 / 800件 / 200億円 / 279件）。2×2 グリッド配置、各 stat 幅 520px × aspect-ratio 800/493。

---

## 生成画像の命名規則

`{section}_{purpose}_{description}_{seq}.{ext}`

| 要素 | 内容 | 例 |
| --- | --- | --- |
| section | LP上のセクション短縮名 | `fv` / `problem` / `solution` / `service` / `record` / `vc` / `case` / `cta` / `common` |
| purpose | 用途種別 | `hero`（メインビジュアル）/ `bg`（背景）/ `icon`（アイコン）/ `illust`（イラスト）/ `card`（カード装飾） |
| description | 簡潔な内容説明（英語/日本語ローマ字） | `startup-tailwind` / `subsidy-flow` |
| seq | 同テーマの連番（複数案がある場合） | `01` / `02` |
| ext | 拡張子 | `png` / `jpg` / `webp` |

**例**:
- `fv_hero_startup-tailwind_01.png`（FV用ヒーロー画像、スタートアップ追い風テーマ、1案目）
- `problem_illust_4-pain-points_01.png`（課題提示用イラスト）
- `service_icon_subsidy_01.png`（サービスアイコン）

---

## 生成履歴

（生成の都度追記）

| 日付 | ファイル名 | プロンプト要約 | 用途 | アスペクト比 | モデル |
| --- | --- | --- | --- | --- | --- |
| 2026-04-27 | `test_imagen_helper_01.png` | imagen.sh 動作確認 / 流体blob・ライトブルー×淡イエロー | 動作確認テスト（B-1.5） | 16:9 | imagen-4.0-generate-001 |
| 2026-04-27 | `test_imagen_simple_01.png` | Imagen 4 直接APIテスト / 流体blob | 動作確認テスト（B-2） | 1:1 | imagen-4.0-generate-001 |
| 2026-04-27 | `test_common_simple_01.png` | ライトブルー×淡イエローの抽象幾何学、余白多め、モダンフラット | 動作確認テスト（media-pipeline） | 1:1 | gemini-2.5-flash-image |

---

## 採用済み画像（モックアップに組み込み済み）

| 採用先 | ファイル名 | 適用バージョン |
| --- | --- | --- |
| — | （未採用） | — |
