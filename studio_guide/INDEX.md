# Studio実装指示書 インデックス

Studio上で手動実装するための詳細指示書の管理ファイル。
デザイン壁打ち（モックアップ）確定後に Agent が作成し、ユーザーがこれを参照して Studio 上に実装する。

最終更新: 2026-05-06（v01 全体版ドラフト作成 + レスポンシブ前提強化）

---

## ディレクトリ構成

```
02_work/studio_guide/
├── INDEX.md                   ← 本ファイル。版履歴・作成状況
├── studio_spec.md             ★ Studio 仕様書（一次資料・指示書の根拠）
├── implementation_progress.md   実装進捗トラッカー
├── drafts/                    指示書のドラフト版（複数世代を保持）
└── final/                     最終確定版の指示書
```

### studio_spec.md の役割

📚 [`studio_spec.md`](studio_spec.md) は Studio.design の仕様（UI 配置・機能・制約・プラン制限・要素挙動）を整理した**一次資料**。指示書（drafts / final）は本ファイルを参照して作成・修正する。詳細運用ルールは [`../AGENT.md` §14](../AGENT.md) 参照。

---

## ファイル命名ルール

### drafts/
- **全体版**: `v{連番}_{YYYYMMDD}_guide_full.md`
  - 例: `v01_20260428_guide_full.md`
- **セクション単独版**: `v{連番}_{YYYYMMDD}_guide_{section}.md`
  - 例: `v01_20260428_guide_fv.md`
  - セクション名は LP のセクション短縮名（fv / problem / solution / service / results / vc / benefit / case / cta）
- **並列案**: 末尾 `_A` / `_B` 付与（例: `v03_20260429_guide_fv_A.md`）

### final/
- **全体版**: `guide_full_final.md`
- **セクション別**: `guide_{section}_final.md`
- 画像・アセット添付がある場合: `assets/` サブディレクトリに格納し、指示書内でパス参照

---

## 指示書の推奨構成テンプレート

各指示書は、以下の粒度で Studio のブロック単位の実装を記述する:

### セクションごとに含める項目

1. **概要**: セクションの役割・このLPにおける位置づけ
2. **参照モックアップ**: 対応する `mockup/final/` のHTMLファイル名
3. **レイアウト指示**:
   - Studio でのブロック構造（ボックスの入れ子関係）
   - PC/タブレット/モバイルごとのサイズ・配置
   - ブレークポイント挙動
4. **テキストコンテンツ**: コピー本文（確定済みコピーを貼付）
5. **デザイン指示**:
   - 使用カラー（HEX）
   - フォントファミリー・サイズ・ウェイト・行間
   - 余白・パディング（px単位）
   - 角丸・影などの装飾
6. **画像・アイコン指示**: ファイル名・配置位置・サイズ・代替テキスト
7. **アニメーション指示**:
   - Studio標準機能の設定（Translate/Rotate/Scale/Skew × トリガー）
   - デュレーション・イージング
8. **リンク・CTA設定**: 遷移先URL・フォーム設定
9. **Studio特有の注意点**: カスタムコード・Embed・Data Connect の使用箇所
10. **テストチェックリスト**: 公開前にユーザーが確認すべき項目

---

## 版履歴

（新規作成時に追記。最新が上）

| 版 | 日付 | 保存先 | 対象 | 概要 | 作成セッション | ステータス |
| --- | --- | --- | --- | --- | --- | --- |
| v01-full | 2026-05-06 | drafts/v01_20260506_guide_full.md | **全体** | v09（lp_full_final.html）を Studio 実装するための初版指示書。Project setup / Design tokens / 全10セクション実装手順 / Animation / Responsive / Asset / QA を網羅。**§0レスポンシブ前提・§7セクション別Mobile実装・§11落とし穴・§10QA Mobile拡張**でレスポンシブ第一の前提を組込み | azalea | ドラフト |

---

## 作成状況

| セクション | 対応モックアップ | ドラフト | 確定版 | 備考 |
| --- | --- | --- | --- | --- |
| ヘッダー | mockup/final/lp_full_final.html | ✅ v01-full §5-1 | — | — |
| FV | mockup/final/lp_full_final.html | ✅ v01-full §5-2 | — | グラデ文字・マーカー・マーキーは Embed 必要 |
| 課題提示 | mockup/final/lp_full_final.html | ✅ v01-full §5-3 | — | — |
| アプローチ | mockup/final/lp_full_final.html | ✅ v01-full §5-4 | — | — |
| サービス詳細 | mockup/final/lp_full_final.html | ✅ v01-full §5-5 | — | — |
| 実績 | mockup/final/lp_full_final.html | ✅ v01-full §5-6 | — | 「100%・ゼロ」表記は法務確認後修正 |
| VC提携 | mockup/final/lp_full_final.html | ✅ v01-full §5-7 | — | ロゴ許諾エビデンス確認待ち |
| 事例 | mockup/final/lp_full_final.html | ✅ v01-full §5-8 | — | 採択額根拠・顧客同意確認待ち |
| CTA | mockup/final/lp_full_final.html | ✅ v01-full §5-9 | — | フォーム同意文の修正待ち |
| フッター | mockup/final/lp_full_final.html | ✅ v01-full §5-10 | — | プライバシー遷移先 URL 確認待ち |
| FAQ | — | ⏳ v09 では未配置 | — | Q10 の回答次第で追加検討 |
| 会社概要 | — | フッターに統合済 | — | 単独セクションとしては不要 |

※ FAQ・VC投資先特典は v09 確定版でフッターまたは Hero/Service の特典バナーに統合済み

---

## 作成の前提条件

指示書を作成するには以下が先に確定している必要がある:

- [ ] デザインの最終版モックアップ（`mockup/final/`）
- [ ] `design_rules.md` の全主要項目（カラー・タイポ・余白・コンポーネント）
- [ ] LP構成の確定（questions.md Q1-Q3）
- [ ] コピー・画像等アセットの確定
- [ ] 法務確認（questions.md Q6）
