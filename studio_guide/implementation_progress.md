# Studio 実装進捗トラッカー

**目的**: ユーザーが Studio 上で実装作業を進めている間、進捗・選択・詰まり所をセッション横断で共有する。
**対象指示書**: [`drafts/v01_20260506_guide_full.md`](drafts/v01_20260506_guide_full.md)
**対象モックアップ**: [`../mockup/final/lp_full_final.html`](../mockup/final/lp_full_final.html)
**着手日**: 2026-05-06
**公開目標**: 未定（5月中目処、2026-05-12 更新）／ 当初計画 2026-05-07 は経過済

---

## ステータス凡例

- ⏳ 未着手
- 🔄 着手中
- ✅ 完了
- 🚧 ブロック中（詳細を「メモ」欄に記載）
- ⏭️ スキップ（理由を記載）

---

## 前提プラン

- **実装中**: **Free プラン**（Custom Code 不可、Embed 利用可）
- **納品後**: Mini プラン切替予定（カスタムドメイン取得 / Studio ロゴ非表示）

## §1 Studio プロジェクト初期設定（Free プラン版）

| Step | 内容 | 状態 | メモ |
| --- | --- | --- | --- |
| 1.1 | Studio プロジェクトを作成 or 既存プロジェクトを開く | ✅ | URL: https://orange265484.studio.site/ ／プロジェクト名: G&N - VC特典LP |
| 1.2 | Page タイトル設定 | ✅ | 現状「G&N VC特典— 挑戦するスタートアップに、補助金という追い風を。」（仕様＋VC特典の追加要素・要確認） |
| 1.3 | meta description 設定 | ✅ | スタートアップ向け補助金・助成金支援。提携VC50社以上、1,200社支援、800件採択。 |
| 1.4 | OGP 画像 設定 | ⏳ | 公開直前で OK |
| 1.5 | Favicon 設定 | ⏳ | Studio デフォルト。公開直前で OK |
| 1.6 | 言語設定: 日本語 | ✅ | ja |
| 1.7 | ベース幅 | ✅ | 1280px（私の指示は 1320 だったが Studio 標準値で OK） |
| 1.8a | テキスト要素を仮配置 | ✅ | （Font 追加が完了しているため達成済） |
| 1.8b | Add Font → Google Fonts → Noto Sans JP 追加 | ✅ | 5ウェイト+α |
| 1.8c | Add Font → Google Fonts → Inter 追加 | ✅ | 豊富なウェイト |
| 1.8d | Font List の最上部に Noto Sans JP をドラッグ | 🔄 | **要確認**: Lato がリストに残っている可能性 |
| 1.8e | テキストスタイル登録 | ✅ | H1 Hero / H2 Section / H3 Card / Body / Lead / Hero Sub / English Label / English Number L / Footnote の9種完全登録 |
| 1.8f | （任意）副フォント設定 | ⏳ | 任意 |
| 1.9 | 左サイドバー → レイヤー → `<Base>` 選択 | ⏭️ | スキップ（Studio 仕様で Base 塗り UI 不在を確認 2026-05-06） |
| 1.10 | Base 背景色設定 | ⏭️ | スキップ（v09 全セクションが独自背景を持つため Base 表示領域なし。`#FCFDFF` カラースタイルは §5-5 Service で参照） |
| 1.11 | Base 文字色設定 | ⏭️ | スキップ。代替: 各テキストスタイル（Body 等）に文字色 `#0F1A33`（ink）を追加 |
| 1.11.alt | テキストスタイル全種に文字色追加 | 🔄 | Body / H1 Hero / H2 Section / H3 Card / Lead / Hero Sub / Footnote に ink #0F1A33、English 系は ink or sub 適宜（ユーザーが 2026-05-06 OK 出した作業） |
| ⏭️ | ~~Page Default Line Height: 1.7~~ | ✅ | §2.2 Body テキストスタイル（lh 1.70）で管理済 |
| ⏭️ | ~~Custom Code (Head): フォント読込~~ | ⏭️ | **削除** — Free プランで使用不可。1.8 で代替 |
| ⏭️ | ~~Custom Code (Head): グローバルスタイル~~ | ⏭️ | **削除** — Free プランで使用不可。1.9〜1.11 + §2 Color Styles で代替 |

## §2 デザイントークン

| Step | 内容 | 状態 | メモ |
| --- | --- | --- | --- |
| 2.1 | Color スタイルに 20色 登録 | 🔄 | **19色登録済み**（Background/Default Text Color/blue/blue-dk/blue-lt/blue-bg/blue-soft/navy/navy-dk/navy-lt/yellow/yellow-dk/yellow-bg/yellow-soft/ink/ink-lt/sub/sub-lt/white）。**未登録: line / line-2**（rgba 半透明罫線色、§5 で個別対応も可） |
| 2.2 | Text スタイル登録: H1 Hero | ✅ | Noto Sans JP 64px / 900 / lh 1.18 |
| 2.3 | Text スタイル登録: H2 Section | ✅ | Noto Sans JP 52px / 900 / lh 1.22 |
| 2.4 | Text スタイル登録: H3 Card | ✅ | Noto Sans JP 16px / 900 / lh 1.40 |
| 2.5 | Text スタイル登録: Lead | ✅ | Noto Sans JP 15.5px / 400 / lh 1.95 |
| 2.6 | Text スタイル登録: Body / Hero Sub / English Label / English Number L / Footnote | ✅ | 5種すべて登録済 |
| 2.7 | ブレークポイント設定: PC / Tablet / Mobile | ⏳ | Studio 標準（PC 1280+ / Tablet 540-840 / Mobile <540）で進行中 |

## §5 セクション別実装

| Step | セクション | 状態 | メモ |
| --- | --- | --- | --- |
| 5-1 | ヘッダー | ⏳ | Mobile ハンバーガー必須 |
| 5-2 | FV (Hero) | ⏳ | h1 nowrap 解除・Embed カスタムコード必要 |
| 5-2.5 | Hero ロゴマーキー | ⏳ | Embed カスタムコード必須 |
| 5-3 | Problem | ⏳ | 4枚カード |
| 5-4 | Approach | ⏳ | 3ステップ |
| 5-5 | Service | ⏳ | 4カード + Perk Banner |
| 5-6 | Record | ⏳ | 4スタッツカード |
| 5-7 | VC Partners | ⏳ | 50+ 表示 + ロゴグリッド + Perk Banner |
| 5-8 | Cases | ⏳ | 3カード |
| 5-9 | CTA | ⏳ | フォーム3項目 |
| 5-10 | Footer | ⏳ | 会社情報 + Nav3カラム |

## §6 アニメーション

| Step | 内容 | 状態 | メモ |
| --- | --- | --- | --- |
| 6.1 | カード hover translateY | ⏳ | Mobile では無効化 |
| 6.2 | ボタン hover 色変化・浮き上がり | ⏳ | — |
| 6.3 | pill .dot 点滅 | ⏳ | — |
| 6.4 | セクション entrance fade-in | ⏳ | スクロールトリガー |
| 6.5 | FV h1 グラデ＋マーカー演出 (Embed §9.2) | ⏳ | Embed コンポーネント |
| 6.6 | VC ロゴマーキー (Embed §9.3) | ⏳ | Embed コンポーネント・12社 URL 置換必要 |
| 6.7 | グラデ文字 VC `50+` (Embed §9.4) | ⏳ | Embed |
| 6.8 | グラデ文字 Record 数字 (Embed §9.4) | ⏳ | Embed or 単色代替 |
| 6.9 | グラデ文字 Service `0` 円 (Embed §9.4) | ⏳ | Embed or 単色代替 |

## §7 レスポンシブ実装

| Step | 内容 | 状態 | メモ |
| --- | --- | --- | --- |
| 7.1 | Header → ハンバーガー化 (Mobile) | ⏳ | §11.5 |
| 7.2 | Hero → 縦スタック (Mobile) | ⏳ | §11.2 |
| 7.3 | h1 nowrap 解除 (Mobile) | ⏳ | §11.1 |
| 7.4 | VC Perk Card vp-compare 縦化 | ⏳ | §11.3 |
| 7.5 | 各セクション grid → 1カラム | ⏳ | Problem/Service/Cases |
| 7.6 | Section padding 縮小 | ⏳ | 120px → 72px |
| 7.7 | カード padding 縮小 | ⏳ | 32px → 24px |
| 7.8 | Service Perk Banner 縦化 | ⏳ | §11.8 |
| 7.9 | CTA 縦スタック | ⏳ | §11.9 |
| 7.10 | Footer 縦スタック | ⏳ | §11.11 / §11.12 |

## §8 アセット配置

| Step | 内容 | 状態 | メモ |
| --- | --- | --- | --- |
| 8.1 | VC ロゴ12社をアップロード | ⏳ | `02_work/mockup/assets/vc_logos/` から |
| 8.1.5 | **VC ロゴ各画像の Studio 公開URL 取得** | ⏳ | §9.3 Marquee Embed で必要。Studio Image Library から URL コピー |
| 8.2 | G&N ロゴ SVG (header) | ⏳ | 高さ 30px |
| 8.3 | G&N ロゴ SVG (footer) | ⏳ | 高さ 32px・白 |
| 8.4 | OGP 画像 | ⏳ | 別途用意（公開直前で OK） |
| 8.5 | Favicon | ⏳ | 別途用意（公開直前で OK） |

## §9 リンク・遷移先

| Step | 内容 | 状態 | メモ |
| --- | --- | --- | --- |
| 9.1 | Header Nav `#problem` 等のアンカー設定 | ⏳ | — |
| 9.2 | CTA「無料相談」→ `#cta` | ⏳ | — |
| 9.3 | CTA「資料DL」→ 資料 PDF or LP | ⏳ | URL 確認 |
| 9.4 | フォーム送信先 (メール or Webhook) | ⏳ | クライアント指定 |
| 9.5 | フッター プライバシー → PP ページ | ⏳ | URL 確認 |
| 9.6 | フッター 各ナビ リンク | ⏳ | — |

## §10 法務・最終確認

| Step | 内容 | 状態 | メモ |
| --- | --- | --- | --- |
| 10.1 | 「100%・ゼロ」表記 (line 812) 注釈追加 or 表現変更 | ⏳ | クライアント回答待ち |
| 10.2 | 着手金0円表記の注釈追加 | ⏳ | line 877 / 931 |
| 10.3 | フォーム同意文 → PP リンク追加 | ⏳ | — |
| 10.4 | 認定経営革新等支援機関番号 確認 | ⏳ | — |
| 10.5 | VCロゴ掲載許諾 12社確認 | ⏳ | — |
| 10.6 | 事例3件 採択額根拠・顧客同意 確認 | ⏳ | — |

## §11 公開前 QA

| Step | 内容 | 状態 | メモ |
| --- | --- | --- | --- |
| 11.1 | PC (1920/1440/1280) 表示確認 | ⏳ | — |
| 11.2 | Tablet (1024/820/768) 表示確認 | ⏳ | — |
| 11.3 | Mobile (414/390/375/360) 表示確認 | ⏳ | ★最重要 |
| 11.4 | 実機 iPhone Safari | ⏳ | — |
| 11.5 | 実機 Android Chrome | ⏳ | — |
| 11.6 | フォーム送信テスト | ⏳ | — |
| 11.7 | リンク遷移テスト | ⏳ | — |
| 11.8 | アニメーション動作確認 | ⏳ | — |
| 11.9 | アクセシビリティ（alt、コントラスト等） | ⏳ | — |
| 11.10 | Lighthouse Performance | ⏳ | — |

---

## 詰まり・判断ログ

実装中に詰まった箇所・代替判断した箇所を時系列で記録。

| 日時 | 箇所 | 詰まり内容 / 判断 | 結果 |
| --- | --- | --- | --- |
| — | — | — | — |

---

## 公開後 TODO

| 項目 | 優先度 | メモ |
| --- | --- | --- |
| 法務修正の反映（クライアント回答受領後） | 🔴 | — |
| FAQ 追加（Q10 確定後） | 🟡 | — |
| Analytics タグ設置 | 🟡 | — |
| OGP 画像差し替え | 🟢 | — |

---

最終更新: 2026-05-06（初版・azalea）
