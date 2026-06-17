# Studio最新仕様リファレンス（2026-06検証版）

**目的**: 本プロジェクト Studio 実装手順書（`studio_guide/drafts/v01_*` 等）が参照する Studio.design 仕様の正本。`studio_spec.md`（2026-05-07版）と本ファイルに齟齬がある場合、**本ファイルが正**。
**統合元**: 11観点の調査結果（2026-06検証）を矛盾解消・重複統合したもの。
**confidence 凡例**: `公式確認`=公式ドキュメントで裏取り済 / `一般知識`=第三者記事ベース・公式単一ソース未特定 / `未検証`=公式記述が確認できず推定または要実機確認。

---

## 1. プラン別マトリクス（2026-06時点）

### 1.1 価格・基本制限

| 項目 | Free | Mini | Personal | Business | Business Plus | Enterprise |
| --- | --- | --- | --- | --- | --- | --- |
| 月額（年契約・月換算） | ¥0 | **¥590** | **¥1,190** | ¥3,980 | ¥9,980 | 要問合せ |
| 月額（月契約） | ¥0 | ¥1,290 | ¥1,720 | ¥5,460 | ¥12,900 | 要問合せ |
| **Custom Code (head/body)** | **❌ 不可** | **✅** | ✅ | ✅ | ✅ | ✅ |
| **カスタムドメイン** | **❌**（`*.studio.site` 固定） | **✅** | ✅ | ✅ | ✅ | ✅ |
| Studioバナー非表示 | ❌ 表示（左下固定） | ✅ | ✅ | ✅ | ✅ | ✅ |
| **ページ数上限** | **1〜50（要確認・下記注記）** | **2（+404）** | 150 | 300 | 無制限 | 無制限 |
| 月間Visitor上限 | 2,000 | 2,000 | 20,000 | 400,000 | 1,000,000 | — |
| CMS モデル数 / 公開アイテム | 3 / 100 | 3 / 100 | 5 / 〜2万 | 10 | 30 | 無制限 |
| 外部アプリ連携（Apps） | ❌ | ✅ | ✅ | ✅ | ✅ | ✅ |
| GA/GTM連携 | ❌ | ✅ | ✅ | ✅ | ✅ | ✅ |
| パスワード保護 | ❌ | ❌ | ✅ | ✅ | ✅ | ✅ |
| リダイレクト/詳細権限/Webhook | ❌ | ❌ | ❌ | ✅ | ✅ | ✅ |

`confidence: 公式確認`（価格・Custom Code/ドメイン/バナー・Visitor）/ `一般知識`（CMS公開アイテム数のプラン別差分）
`source`: https://studio.design/ja/pricing （WebFetch 2026-06）; https://help.studio.design/en/articles/7890587 ; https://help.studio.design/en/articles/4066297

### 1.2 重要注記（矛盾解消）

- **Freeのページ上限に2系統の報告あり（要確定）**: 「50ページ」(価格表系の観点)と「1ページ」(公開/SEO観点の最新pricing読み)が両立している。`confidence: 公式確認（ただし観点間で食い違い）`。**発注前に公式pricing機能比較表で本LPに必要なFreeページ数を再確認すること。** 本LPは制作中Freeのため、必要ページ数（LP本体＋サンクス＋プライバシー等）がFree枠に収まるか最優先で確定。
- **Miniは2ページ（+404）制約が最大の落とし穴**: 旧spec（Free=50想定）から移行すると激減。本LPの「納品後Mini切替」方針に直接影響。単一ページLPなら収まるが、サンクス/特商法/プライバシー等で別ページが必要なら **Personal（¥1,190・150ページ）** が必要。
- **Custom CodeはFree不可・Mini以上で可**（旧specと一致・変更なし）。Freeでは既存コードの削除のみ可、編集・再有効化は不可。Freeにダウングレードしてもコードは内部保存される。`confidence: 公式確認`
- 広告流入で月2,000Visitorを超える見込みがあるなら **Personal（2万Visitor）以上を推奨**。MiniもVisitor上限はFree同等の2,000/月。

---

## 2. エディタ操作の正式名称

### 2.1 左ナビゲーション（8アイコン）

`confidence: 公式確認` / `source`: https://help.studio.design/en/articles/12889476-left-panel （2026-05更新）

| # | 正式名称 | 機能 |
| --- | --- | --- |
| 1 | 追加（Add） | ボックス/パーツ/セクション等の要素を追加 |
| 2 | ページ（Pages） | 編集中ページの管理 |
| 3 | レイヤー（Layers） | ページ上の要素（レイヤー）構成の確認 |
| 4 | スタイル（Styles） | カラースタイル/テキストスタイルの設定・管理 |
| 5 | アップロード（Uploads） | 画像/動画/PDFのアップロード |
| 6 | ストック（Stocks） | Studio.Stock と Unsplash の画像 |
| 7 | 接続（Connections） | Studio CMS / API連携 / RSS の設定 |
| 8 | コンポーネント（Components） | コンポーネント登録要素の確認・配置 |

> **旧spec訂正**: 「14アイコン程度」は誤り。コメントモード/バージョン履歴/Undo等の補助UIを左ナビに混同していた。機能パネルとして公式が列挙するのはこの8つ。プロジェクトメニュー（プロジェクト名・全体設定）は別UI。

### 2.2 追加パネルのタブ（基本 / パーツ / セクション + コンポーネント）

`confidence: 公式確認` / `source`: 同上 + https://help.studio.design/en/articles/7220109-sections

- **基本（Basic）**: プリミティブ要素（Box/Text/Image/Icon/RichText/Video等）＋埋め込み＋インタラクション＋フォーム
- **パーツ（Parts）**: 複数ボックスを束ねた既製パーツ（カルーセル等。内部コンテンツは右パネル「コンテンツ」タブで編集）
- **セクション（Sections）**: ヘッダー/特徴紹介/FAQ等のレスポンシブ設定済み既製セクション
- 追加パネル内「コンポーネント」から登録済みコンポーネントをD&D/クリック配置可

> 旧specの基本タブ内訳「28種（基本7/埋め込み8/インタラクション4/フォーム3/フォームパーツ10）」を1ページで列挙する公式単一ソースは未特定。本プロジェクト実測値として信頼性は高いが網羅リスト自体は `confidence: 未検証`。

### 2.3 右パネルのタブ構成

`confidence: 公式確認` / `source`: https://help.studio.design/en/articles/12889360-right-panel （2026-05更新）

**共通タブ（全要素）**:
- **ボックス（Box）**: レイアウト/外観/ポジション
- **変形（Transform）**: 変形・アニメーション制御
- **設定（Settings）**: リンク設定/タグ設定等

**要素固有タブ**:
| 要素 | 固有タブ |
| --- | --- |
| テキスト | テキスト（Text） |
| 画像 | 画像（Image） |
| アイコン | アイコン（Icon） |
| 動画 | 動画（Video） |
| カルーセル/リッチテキスト | **コンテンツ（Contents）** |
| リスト/動的ページ/モーダル等の動的要素 | **データ（Data）** |

> **旧spec訂正**: インタラクション系（Carousel/Toggle/Loop Box）を一律「インタラクション」タブと呼んでいた箇所は、公式呼称ではカルーセル/リッチテキスト=「コンテンツ」、動的リスト/CMS連携=「データ」タブに整理される。手順書はこの公式呼称で記述すること。

### 2.4 レイヤーパネル

`confidence: 公式確認` / `source`: https://help.studio.design/en/articles/5838449

- 階層ツリーで選択/並べ替え（D&Dで重ね順変更）/リネーム（名前は公開サイトに出ない）/コピペ（⌘C/V）/削除。`[>]` で階層展開。
- **AI「レイヤー名最適化（Layer Rename）」機能**（新機能）
- **条件スタイル（ホバー効果・アニメーション）= ダイヤ型アイコン**でレイヤー上から確認
- **レスポンシブ設定 = 重なった四角アイコン**でブレークポイント別の条件スタイルを一覧確認
- 2026年1-2月アップデートで**右クリックコンテキストメニュー**追加
- Baseレイヤー・要素のロック/非表示はこの記事では言及なし（本プロジェクト実測として保持可）

---

## 3. ボックスモデル各項目

`source`: Box関連公式記事群（下記各項に明記） / `confidence: 公式確認`（特記なき限り）

### 3.1 サイズ単位（7種）

px / % / auto / flex / vw / vh / dvh
`source`: https://help.studio.design/en/articles/2639205

- **Fill / Hug という呼称は Studio に存在しない（Figma用語）**。読み替え: **Hug相当 = auto**、**Fill相当 = flex（または % 100%）**。手順書は必ず Studio 用語で記述。
- **px は固定値ではなく「最大幅」挙動**: 画面幅が狭くなるとボックスは自動縮小して収まる。旧spec「px=固定値」は要注記。
- **auto** = 内容に合わせる / **%** = 親基準の相対 / **flex** = 横並び兄弟間の幅比率（1:1:1で等分等） / **vw/vh/dvh** = ビューポート基準（vwはスクロールバー非依存、dvhはスマホURLバー出没で高さ自動調整）
- **親auto + 子% は機能しない**（基準幅が確定しないため）。配置「均等」も親auto幅では視覚的に効かない。解決は親を固定値（px/%）に。
- **親ボックスの高さは px ではなく auto を推奨**（`source`: https://help.studio.design/en/articles/5168438）。内容/グループ構造はBP共通のため、折返し差をautoで吸収する設計が前提。

### 3.2 Flex方向・配置

`source`: https://help.studio.design/en/articles/4062166

- **方向（Direction）**: 横並び（Horizontal）/ 縦並び（Vertical）/ 折返し（Wrap）。実UIにはrow-reverse/column-reverse相当の逆方向も存在。
- **配置プルダウンは direction で選択肢が変わる**（旧spec「垂直=上/中央/下の3択」は不正確）:
  - 横並び/折返し時: 水平=左/中央/右/**均等(space-between)**/**均等＋余白(space-around)**、垂直=上/中央/下/**ストレッチ(stretch)**
  - 縦並び時: 主軸（垂直）に space系、交差軸（水平）に stretch が出る（入れ替わり）
- **正式名称の対応**: space-between=「均等」、space-around=「均等＋余白」、stretch=「ストレッチ」。Studioに「両端揃え」表記はなく space-between は「均等」を選ぶ。

### 3.3 gap / padding / margin

`source`: https://help.studio.design/en/articles/4062166

- **gap（間隔/ギャップ）**: 子要素間の余白を px 指定
- **padding（パディング）/ margin（マージン）**: 一括または上下左右個別（個別設定アイコンで切替）で px 指定
- margin auto を片側に使うと片寄せ分散が可能

### 3.4 角丸（Border Radius）

`source`: https://help.studio.design/en/articles/1892943

- 全コーナー一括 / 各コーナー個別を値欄右のアイコンで切替。**50%で正円**。px・% 対応。
- ドラッグハンドルで視覚調整。**Shift+drag=10刻み**、**Option/Alt+drag=一括/個別切替トグル**。

### 3.5 Border（枠線）

`source`: https://help.studio.design/en/articles/1949370

- **スタイル4種**: Solid / Dashed / Dotted / Double（旧spec「solid/dotted程度」は不足）
- 太さは四辺一括または**上下左右個別**指定可。色は RGBA/HEX。
- **グラデーション不可**。削除は Width を 0 に。

### 3.6 Shadow（影）

`source`: https://help.studio.design/en/articles/1949371

- パラメータ: X / Y / Blur（ぼかし）/ Spread（拡散）/ Color（RGBA/HEX・アルファでopacity表現）
- **Inset（内側影）/ Outset（外側影=drop shadow）の方向切替**。**内側影と外側影の同時適用は不可**。
- プリセット影は公式記事本文では未確認（検索結果に「4種プリセット＋カスタム」あり・`confidence: 未検証`）

### 3.7 Filter / Backdrop filter / Blend mode

`source`: https://help.studio.design/en/articles/5289922

- **Filter**: 選択ボックス＋その全子要素にかかる。効果6種: Brightness/Contrast/Saturation/Grayscale/Sepia/Blur
- **Backdrop filter（背面フィルター）**: ボックス背面にかかる。**fill透明時に最も効果的**。効果6種は同じ。**Firefox 非対応**。
- **重要訂正**: Header背景ぼかしは Filter ではなく **Backdrop filter** で実装すべき（Firefox非対応のためフォールバック設計が必要）。
- **Blend mode（描画モード）16種**（Normal/Multiply/Screen/Overlay/Darken/Lighten/Color Dodge/Color Burn/Hard Light/Soft Light/Difference/Exclusion/Hue/Saturation/Color/Luminosity）。**直近の親にのみ適用可**。

---

## 4. Color / Text スタイル運用

### 4.1 カラースタイル

`source`: https://help.studio.design/(en|ja)/articles/10755400 ; https://studio.design/ja/whats-new/color-styles

- **【最重要・旧spec訂正】変更はプロジェクト全体に自動反映される**: 旧spec「サイト全体一括変更 ❌ 不可（ページ単位のみ）」は**誤り**。公式は「適用中のすべての箇所に変更が反映」「全ページ・全要素に伝播、ページ単位の設定は不要」と明記。1色を直すと全ページ該当箇所が一括更新。`confidence: 公式確認`
- **登録2経路**: (A) 要素から=右パネルのカラー設定→「スタイル」タブ→[カラースタイルを登録]、(B) スタイルパネルから=左ナビ「スタイル」→カラータブ→[+追加する]。（旧spec英語表記「Save as Color Style +」より現行UIに即した日本語が正）
- **命名規則**: 全角半角問わず**最大50文字**、半角スラッシュ「/」で**最大3階層**（例 `text/primary/hover`）。階層移動はラベル直接編集（D&D不可）。用途ベース命名推奨。`confidence: 公式確認`
- **不透明度（アルファ）込みで保存可**: 公式「hex codes and opacity values」。観測の8桁HEX（末尾ff=アルファ）と整合。旧spec「公式記述なし⚠️」→`公式確認`に格上げ。
- **削除挙動**: スタイル管理は外れるが**要素の色値は残る**（以後一括管理されないだけ）。
- **適用不可対象**: CMS color properties / List color properties（公式が今後対応予定の制限）。本LPはCMS/動的リスト不使用のため実害なし。
- **2026年1-2月追加**: HEX入力正規化（省略形・全角対応）、カラーモード（システム設定追従）。
- **My Color機能は廃止済み**（2025年4月までにカラースタイルへ移行完了）。

### 4.2 テキストスタイル

`source`: https://studio.design/ja/whats-new/text-styles

- テキスト要素のフォント/サイズ/行高/色等を設定→スタイルバーの「スタイル」項目から名称付きで登録。変更は**全インスタンスに自動伝播**。
- **1スタイル内でレスポンシブ管理**: PC/Tablet/Mobileのタイポを1つのスタイル定義に内包できる→レスポンシブ指示書を簡潔化可。
- スタイルパネルのメニューは「フォント」→「**テキスト**」へ改称済み。**ホバーで使用箇所をハイライト**表示（一括変更前の影響範囲確認に有用）。
- 2024-12-05リリース。旧spec §8 は現行と一致。

### 4.3 グローバルトークン運用の実態

- Figmaの Variables / Tokens に相当する**独立した変数機能は2026-06時点で確認できない**。プロジェクト全体に伝播する **Color Styles + Text Styles が事実上のグローバルトークン層**として機能（命名のスラッシュ階層でセマンティック化）。`confidence: 未検証`（Variables専用ドキュメントが存在しないことによる消去法的推定）
- **エイリアス（スタイルが別スタイルを参照）・複数モード（mode切替）は公式に見当たらず未確認**。これらを前提とした運用設計は避けること。

---

## 5. フォント

`source`: フォント関連公式記事群（各項に明記）/ `confidence: 公式確認`（特記なき限り）

### 5.1 追加手順とサービス

- 手順: テキスト選択→[テキスト]タブ→[Typography]の[Font]欄→一覧最下部[Add Font]→サービス選択→選択で即 Font List 追加＆適用。`source`: https://help.studio.design/en/articles/1949383
- **利用可能サービス（5種）**: Google Fonts / TypeSquare（モリサワ・500書体超）/ System Fonts / Web Fonts / Custom Fonts。全プラン追加課金なし。`source`: https://help.studio.design/en/articles/10510423
- **Adobe Fonts は公式記事で確認できず** → 旧spec「Adobe Fonts」言及は `confidence: 未検証` に格下げ。
- **FONTPLUS（旧 web font サービス）は2026年4月7日で終了済み**（既存フォントは system font へ自動置換）。本LPは未使用のため実害なし。

### 5.2 カスタムフォントアップロード（旧spec訂正）

- **【変更点】アップロード可能**: 旧spec「非対応」は誤り。対応形式 **.ttf / .otf / .woff / .woff2**、上限 **1ファイル50MB**。手順: [Add font]→[Custom Fonts]→[Upload font]。
- プラン別可否（Free可否）・ライセンスは公式に明記なし。本番運用前に検証推奨。`confidence: 公式確認（プラン可否は未検証）`
- `source`: https://help.studio.design/en/articles/3190900

### 5.3 ウェイト・日本語・副フォント

- **ウェイトはフォント依存**: 選んだ書体が持つバリエーションのみ選択可。見出し用の太さ（例 Noto Sans JP Bold/Black）が選択肢にあるか追加時点で確認。
- **副フォント（Sub Font）**: 言語別合成（かな＋英字＋日本語）/ OS別システムフォント登録で表示崩れ防止。**制約2点**: ①アカウント言語が英語だと追加不可（日本語に切替必須）、②**副フォント追加後はファミリー内の全フォントが同一ウェイト表示になる**。見出しと本文で太さを変えたい場合は用途別に別ファミリー（別Font Listエントリ＋ラベル）に分ける。`source`: https://help.studio.design/en/articles/10509895

### 5.4 Font List 優先順位・置換・削除・フォールバック

- **Font List最上部＝デフォルトフォント**（新規テキストに自動適用）。新規プロジェクト初期デフォルトは Lato。
- ファミリーにラベル（Heading 1 / Body 等）、Usage で使用ページ確認可。
- **Replace**: [Font]欄→アイコン→[Replace Font]→[Usage]確認→公開で反映（全箇所で置換）。**Delete**: [Font Settings]右上三点→使用中なら[Replace and Delete Font]。
- **フォールバック**: System Font は端末非インストール時に自動置換され環境差が出る。Web Font（Google Fonts/TypeSquare）はクラウド配信で全環境同一（読込コスト増）。崩れ防止は Sub Font または Web Font 推奨。

---

## 6. Embed（埋め込み）

`source`: https://help.studio.design/en/articles/4064934

- **全プラン利用可（Free含む）**。`confidence: 公式確認`
- **iframe / sandbox は自動判定（ユーザー選択不可）**:
  - **iframe type** = コードが `<iframe>` タグのみで構成される場合、および formrun・HubSpot Form の埋め込みコード
  - **sandbox type** = 上記以外の全コード。本来iframe認識のコードでも **CMSプロパティを使うと sandbox に切替**（例: HubSpotフォームIDをCMSプロパティで挿入）
  - G&NロゴSVG（SVG/HTML/CSS/JS含む）は sandbox でよい。
- **文字数上限は公式に明記なし** → 旧spec「per Embed 30,000文字」は **Custom Code側の制限（30,000文字/ブロック）との混同**の疑い。`confidence: 未検証`。重い素材はImageアップロードやLottie/Loop Box等の標準機能へ寄せるのが安全。
- **エディタ内プレビュー可能（旧spec訂正）**: コードエディタ右ペインにプレビュー（自動/手動更新）あり。旧spec「エディタ内で動作確認不可・Publish必須」は不正確。**ただし sandbox type は `DOMContentLoaded` が発火しない等の制約あり**→最終確認は公開URL推奨。`confidence: 公式確認`

---

## 7. Custom Code（Head / Body）

`source`: https://help.studio.design/en/articles/7890587

- **有料プラン（Mini以上）必須・Free不可**。Freeでは既存コードの削除のみ可、編集・再有効化は不可。Freeにダウングレードしてもコードは内部保存。`confidence: 公式確認`
- **文字数上限（旧spec訂正）**: **1ブロック最大30,000文字**（旧spec「1フィールド3,000文字」は誤り・桁違い）。`</head>` と `</body>` の各直前に**それぞれ最大10ブロック**、1ページ合計最大20ブロック。`confidence: 公式確認`
- **head に書けるタグは5種のみ**: `<link>` / `<meta>` / `<style>` / `<script>` / `<noscript>`。それ以外は適用されない。body側はこのタグ制限の記載なし（より自由）。JSON-LDは `<script type="application/ld+json">` で head に置ける。
- **スコープ2種**: サイト全体（site）/ 個別ページ（page）。各 head末尾・body末尾へ追加。アクセス: エディタ画面外グレー余白クリック→ページ設定→ページ/サイトタブ→head/body各欄。

---

## 8. ブレークポイント

`source`: https://help.studio.design/en/articles/4954050 ; https://help.studio.design/en/articles/4062516

### 8.1 デフォルト5段階・初期有効3段階

| 名称 | 基準幅 | 初期有効 | 可動レンジ例 |
| --- | --- | --- | --- |
| Default（PC） | 1280px | ✅ | （削除不可） |
| Small | 1140px | 任意追加 | 1280–991px |
| Tablet | 840px | ✅ | — |
| Mobile | 540px | ✅ | 690–361px |
| Mini | 320px | 任意追加 | — |

- 新規プロジェクトは Default/Tablet/Mobile の3つが初期有効。Small/Miniは必要に応じて追加。
- 値はツールバー数値入力 / ブレークポイントバー（画面外縦線）のドラッグで変更可。**設定はプロジェクト全体（ページ別不可）**。**Default以外は削除可・Defaultは削除不可**。旧spec「PC>840」等の範囲表記は方向性は正しいが Default基準1280px と Small/Mini が未記載だった。

### 8.2 条件スタイルのカスケード

- **Default(PC)を基底に下方カスケード**: レスポンシブ設定しなければ同内容がTablet/Mobileに自動継承。
- 上書きは下部ツールバーで対象デバイス幅に切替→Box選択→プロパティ変更。**上書き中のプロパティ枠は色分け**（**Tablet=黄緑/yellow-green、Mobile=オレンジ/orange**）。プロパティ横の「**Reset override（上書きリセット）**」矢印で個別解除。
- **BP別に変更できないもの（重要制約）**: 画像の中身（src）/ テキスト内容 / 要素のグループ化（DOM階層）。**PCとモバイルで文言・画像を差し替える、階層構造を変える、は条件スタイルでは不可**。出し分けは要素を複数用意してBP別に表示/非表示（レイヤーパネルの目アイコン）で対応。
- 推奨手順: **PC完成→Tablet→Mobile** の順。
- **AI「Auto Responsive」機能あり**（自動でTablet/Mobile生成）。適用範囲・品質は `confidence: 未検証`。本番LPは手動調整で品質担保が無難。
- **最終確認はLive Preview / 公開URL必須**（vw/dvh等は実機差あり）。「スマホ実機でエディタ操作」機能は公式確認できず（エディタはデスクトップ前提）。
- 画像のフィット指定UI（object-fit相当）・srcset相当の最適化配信の有無は `confidence: 未検証`（実機確認推奨）。

---

## 9. ポジション / z-index

`source`: https://help.studio.design/en/articles/4062242 ; https://help.studio.design/en/articles/4062251

### 9.1 4種のポジション

| 種別 | 基準点 | 用途 |
| --- | --- | --- |
| 相対（relative） | 通常フロー/親 | 既定値。画面幅変化で自動調整。本文系はこのまま |
| 絶対（absolute） | 最も近い親ボックス | バッジ/オーバーレイ等の装飾（レスポンシブで動かしたくない要素） |
| 固定（fixed） | 画面（ビューポート） | ヘッダー/サイドバー/問い合わせボタン |
| スティッキー（sticky） | スクロール中にfixed化する親 | ヘッダー/メニュー |

- 距離（top/right/bottom/left）は相対以外で px 指定。基準点は fixed=画面端 / absolute=最近接親端 / sticky=親端。

### 9.2 重要な依存条件（旧spec未記載）

- **固定（fixed）は Base ボックス直下に置く必要がある**。ネストが深いと期待通り固定されない。→ **Header Box は Base 直下に配置**と手順書に明記。
- **スティッキー（sticky）は親の overflow が Visible/Scroll でないと無効**。`Hidden` だと sticky が完全に無効化される。→ 追従要素の祖先で `overflow:hidden` を使わない設計に。
- **スティッキーはエディタ内プレビュー不可**→公開URLで実機スクロール確認必須。

### 9.3 z-index（重ね順）

- **値域 -9999〜9999、既定0**。数値が大きいほど前面。Header z=100 は妥当。
- **同一z-index時はレイヤーパネルで下にある要素が前面**（タイブレーカー）。z-index明示なしの重なり制御はレイヤーパネルのD&D並べ替えで可。
- 設定UI: 対象選択→右パネル「ボックス」タブ→下スクロール→「ポジション」→重ね順フィールド。

---

## 10. アニメ / Hover / Loop Box / Toggle / Carousel

`source`: 各項に明記 / `confidence: 公式確認`（特記なき限り）

### 10.1 Loop Box（無限マーキー）

`source`: https://help.studio.design/en/articles/13713839

- 追加→**基本タブ→インタラクション→LoopBox** で配置。子要素（テキスト/画像/アイコン）最低1つ必要、複製要素が自動生成され無限ループ。
- **速度**: 単位 px/s、**デフォルト60px/s**、入力欄orスライダ、**0で停止**。
- **方向**: 子の flexDirection 依存（row系=左右、column系=上下）。BPごと変更可。
- **Pause on hover** チェックボックスでホバー中停止。
- **overflow は自動で hidden 固定**（scroll/visible 不可）。両端フェードマスクが必要なら親box側で重ねる。
- **アクセシビリティ**: `prefers-reduced-motion` を自動尊重（設定時アニメ自動停止）、複製要素に `aria-hidden="true"` 自動付与。Loopタブでエディタプレビュー可。
- **Freeでも利用可**（公式確認済）。

### 10.2 Toggle（FAQ開閉）

`source`: https://help.studio.design/en/articles/8056180

- 追加→基本タブ→インタラクション→Toggle。**button（トリガー）+ content（開閉領域）の2部構成**。ダブルクリックor選択+Enterで内部編集。
- トリガー: 右パネルToggleタブで **Click / Hover** 選択（タッチ端末誤動作回避にClick推奨）。
- オプション: **Show by default**（初期開）/ **Close when clicking outside**（外側クリックで閉じる）。
- 既定アニメ: Closed条件スタイルが自動適用→アイコンbox 180度回転、content高さ auto↔0 で開閉。速度調整は content選択→変形タブ→アニメーション→時間。閉じる速度だけ変えるなら Close条件スタイルを編集。
- 開閉方向は親boxの配置依存（Top=下方向、Center=両方向）。Cmd+Jでコンポーネント化可。

### 10.3 Carousel（autoplay）

`source`: https://help.studio.design/en/articles/6902846

- 右パネルCarouselタブで **Autoplay** チェック→ **Interval**（切替待機時間）/ **Transition Time**（遷移速度）/ **Pause on hover**（ホバー・キーボードフォーカスで一時停止）。
- 旧版（GTM設定）は GTM設定を外して Convert で移行可だが**移行後は再生/停止ボタンなし**（必要なら新規作成推奨・移行前に複製推奨）。
- デフォルト数値・インジケータ（ドット）有無は公式未明記。CMS/Listデータからの生成手段は別記事。

### 10.4 Hover / 条件スタイル全体系

`source`: https://help.studio.design/en/articles/2639206

- **Hover**（カーソルホバー時）: プリセット Scale Up / Color Change / Tilt / Add Shadow ＋カスタム。**タッチ端末はhover非対応でタップ後スタイルが残る点に注意**。
- **in Hover**: ホバーした親の中の子要素を変化
- **Focus**: フォーム入力/選択がアクティブな間
- **Pressed**: **buttonタグのみ**押下中（**aタグ不可**）
- **On Appear**: 読込/スクロールで画面に現れる直前。プリセット Fade In from Bottom/Right/Left、Blur Fade In
- **Closed**: toggle box専用
- 他: Current Page / First Item / Partial Match / Custom（CMS boolean）
- **条件スタイルは Base レイヤーには適用不可**。
- 色分け表示: Hoverテンプレ=青、On Appear=ピンク。

### 10.5 変形 / アニメーション設定

`source`: https://help.studio.design/en/articles/4055409

- **アニメーション（CSS transition相当）**: イージング=上部に11種プリセットカーブ＋ハンドル/座標値でカスタム（cubic-bezier）。**時間（Duration）**=秒・小数可（大きいほど遅い）。**遅延（Delay）**=条件トリガー発火→transition開始までの間隔・小数可。
- **変形（transform）**: Move(X/Y) / Rotate / Scale / Skew、transform-origin指定。
- アニメは default と条件スタイルの差分から生成（default側にアニメ値を設定すると条件解除→default復帰時の動きになる）。

### 10.6 Scroll Effect（新機能・旧spec大幅訂正）

`source`: https://help.studio.design/en/articles/14494654

- 旧spec「複雑なkeyframesは直接サポートなし→Embedで実装」は**現状不正確**。スクロール連動アニメ専用UIが存在: box選択→**Boxタブ→条件スタイル→Scroll**。
- **View timeline**=要素が画面に入って出るまでに連動（個別要素向け、トリガー Entry/Exit/Contain/Cover）/ **Scroll timeline**=最近接親のスクロール位置0-100%に連動（ページ全体進捗向け）。
- キーフレーム: 通常0%と100%の2点、[+]で中間追加。アニメ可能5カテゴリ: Move(X/Y) / Rotate / Scale / Opacity / Filter。
- レスポンシブ: タイムライン種別・キーフレーム数・位置は全BP共有、スタイル値のみ各BP調整。完全な効果除去は不可（モバイル無効化は値を0に）。
- **注意: Scroll Effect は新公開インフラ（beta）では未対応**（対応待ち）。マーキー・パララックス・出現アニメの大半はネイティブ（LoopBox/On Appear/Scroll Effect）で実現可能になり、Embed/Custom Codeへ逃がす必要は大幅減少。

### 10.7 各機能の Free 可否

- LoopBox は Free 可（公式確認済）。**Scroll Effect / On Appear / Hover / Toggle / Carousel の Free 可否は公式ヘルプに明示ゲートなし** → `confidence: 未検証`。pricing機能比較表で個別確認が必要。可否未確定の機能に依存する設計は避け、Mini切替後有効化前提で手順書に明記すると安全。

---

## 11. フォーム

`source`: https://help.studio.design/en/articles/2281017 ほか各項に明記

### 11.1 追加・構成

- 追加パネル「基本」タブ→「フォーム」セクションに既製テンプレート（**Form1/2/3 はフィールド構成・レイアウトの差で機能差ではない**）。1ページのフォーム数に上限なし。
- フォーム名: 右パネル「フォーム」タブ。**% # ? / は使用不可**。リネームすると以後の回答は新名義で集計（過去回答は旧名義のまま）。

### 11.2 フィールド設定

`source`: https://help.studio.design/en/articles/2281017 ; https://docs.better.care/studio/form-builder/parts/input-fields/

- フィールド一覧で各項目クリック→フィールド名 / **必須（Required）** / **タイプ（text・email・phone number等）** / プレースホルダ / タイポグラフィを設定。
- ステータス: required / hidden / readonly。hiddenフィールドはUTM等の送信に使える。
- フィールド追加: [+]→「基本」タブ→「フォームパーツ」（Input/Textarea/Select/Radio/Checkbox/Submit/File等）。
- ラベル位置: Layoutセクションで「上 / 左 / 非表示」。

### 11.3 送信先（2系統）

- **メール通知**: フォームダッシュボード→「設定」。**全体設定**（プロジェクト共通・デフォルト=作成者）＋**個別設定**（フォーム別）の2系統。**1フォーム最大2宛先・1日500通上限**。**送信元は `noreply@studio.site` 固定**（変更不可）。デフォルト件名「You have a new response in [Form name] of [Project name]」。非メンバー宛先は確認メール認証要。`source`: https://help.studio.design/en/articles/2281082
- **Google Sheets連携**（標準の外部書き出し一次手段）: 外部連携アイコン→Google許可で専用シート（命名 `[Project]_[Form]`）自動生成・自動更新。再接続時は新シート生成。`source`: https://help.studio.design/en/articles/10911810
- **Webhook**: Studio内部での直接設定は公式で確認できず → 旧spec「Webhook等」は `confidence: 未検証`。Business以上の機能としてのWebhookは別系統。

### 11.4 送信後挙動・確認画面・自動返信

- **送信後遷移**: **別ページを作成して post-submission destination に指定**する方式（リダイレクトURL直接入力欄ではない）。未指定時はデフォルト「Form submitted successfully」。
- **確認画面（Confirm）**: 公式で独立した確認画面ステップの明示記述は確認できず → 旧spec §3.2 のConfirmパーツは `confidence: 未検証`（実機再確認要）。
- **自動返信（サンクスメール）はネイティブ非対応** → Google Sheets + Zapier + Gmail の組み合わせが必要。`source`: https://help.studio.design/en/articles/4617647

### 11.5 スパム対策

- **reCAPTCHA v3 のみ対応**（v2不可）。プロジェクトダッシュボードのAppsメニューで Site Key / Secret Key / Threshold 設定。**プロジェクト単位適用**（フォーム個別不可）。`source`: https://help.studio.design/en/articles/5752722
- 送信失敗の主因は reCAPTCHA v3 設定ミスか Google Sheets 連携不具合。

### 11.6 外部フォーム埋め込み

- Studio標準を使わない場合は Embed。`<iframe>` のみなら iframe type、それ以外は sandbox（HubSpot Forms を CMSプロパティ経由で埋め込むと自動 sandbox 化）。Embedは全プラン可・エディタ内プレビューは sandbox制約あり→公開URL確認必須。

---

## 12. 公開 / SEO

`source`: 各項に明記 / `confidence: 公式確認`（特記なき限り）

### 12.1 公開基盤の刷新（最重要・旧spec §20全面訂正）

`source`: https://help.studio.design/ja/articles/15444819 ; https://help.studio.design/en/articles/13526256

- **2026-06-11にSPA→MPA・CSR→SSRへ刷新**: サーバー側で完成HTMLを返し（主要ページは公開/更新時に事前生成＋CDNキャッシュ）、本文＋メタをHTMLに含めるためSEO/AEO/初回表示に有利。検証用にソースへ `generator=Studio.Design.HRC` が出る。
- **旧spec §20 の Nuxt/GCS/JSON/SPA 記述は古い**。
- **2026-06-11以前作成のプロジェクトは旧基盤（Nuxt系SPA）のまま** → Project設定→公開サイト基盤の切替→新基盤選択→保存（約5分）で**手動切替が必要**。**本プロジェクトは2026-06-11以前作成のため旧基盤の可能性が高く、納品/公開前に新基盤へ切替推奨。**
- 切替時は Embed（G&NロゴSVG）/Custom Code/外部タグ（広告/CV）/Loop Box を事前実機検証。**カスタムドメインのAレコードを `35.194.122.208`→`34.111.141.225` へ更新**。旧基盤切戻しは2027年1月末頃まで。
- **新基盤はサイトタイトル/OGP未設定だと空欄出力** → Free段階でも title/description/OGP/favicon を必ず明示設定。

### 12.2 公開フロー・URL

`source`: https://help.studio.design/en/articles/2642690 ; https://help.studio.design/en/articles/4066297

- エディタ右上「公開」ボタンで数秒〜十数秒でライブURLに反映。OGP/favicon/メタ変更は公開しないと反映されず、SNS/検索側キャッシュで即時反映されない。
- Free は `XXXX.studio.site` で公開。カスタムドメインは Mini以上。

### 12.3 SEO設定（サイト/ページ単位・ページ優先）

| 項目 | 設定箇所 | 推奨値 | source |
| --- | --- | --- | --- |
| タイトル | [サイト]/[ページ]タブ | 全角30字目安・重要KW前方 | articles/4064972 |
| ディスクリプション | 同上 | 全角70〜120字・先頭にKW（補助金/申請支援） | 同上 |
| OGP | サイト/ページ両方 | **1200×630px**・5MB未満（モーダル不可） | articles/4066111 |
| favicon | サイト/ページ両方 | 48×48px以上（96/144等）・SVG含む全形式（モーダル不可） | articles/4066089 |
| noindex | ページ設定パネルのスイッチ | ページ単位のみ。**AIクローラーは止めない** | articles/4258184 |

- いずれもページ設定がサイト設定に優先（未設定時はサイト継承）。プラン制限の記載なし（Freeでも設定可）。
- **sitemap.xml**: ダッシュボード（Home）のサイトマップスイッチONで自動生成・`/sitemap.xml` 配信。**modal・noindexページは自動除外**。GSC連携可。`source`: articles/4581345
- **robots.txt を直接編集する標準機能は公式に明記なし**（noindex/sitemapで制御する設計）。
- **構造化データ（JSON-LD）のエディタ標準UIは未確認** → JSON-LDは Custom Code（有料・Mini以上）の head に `<script type="application/ld+json">` で実装が現実的。`confidence: 未検証（標準UI）/ 公式確認（Custom Code経路）`
- **noindexはAIクローラーを止めない** → 完全非公開はBASIC認証等が別途必要（補助金LPは露出増狙いで通常問題なし）。
- GSC連携sitemapの「Starterプラン以上」記述は現行プラン名にStarterがなく旧名残存の疑い → `confidence: 未検証`。

### 12.4 AI / インポート補助機能

- **SEO Writing Assist**（新機能）: サイト/ページ内テキストを読み取り title と meta description をAI自動生成。各セクションコピーからメタ初稿生成に活用可。`source`: articles/4064972
- **Figma to Studio**（公式プラグイン）: Figmaのフレーム/レイヤーをStudioへ直接インポート、自動でBoxレイアウトに変換（Auto Layout済だと高精度）。Page Mode（Beta）で複数ページ一括インポート（フレーム名先頭 `/` でページ認識）。画像レイヤーは Figma側でレイヤー名先頭に `img`、動画は手動アップロード。`source`: articles/8277073

---

## 付録A. Free vs Mini 実装方針マトリクス（本LP向け）

| 観点 | Free（制作中） | Mini切替後（¥590/月・年契約） | 実装方針 |
| --- | --- | --- | --- |
| **Custom Code (head/body)** | ❌ 不可 | ✅ 解禁（30,000字×10ブロック×2位置） | 制作中はEmbed/スタイルで代替。Mini切替後にGA4/GTM計測タグ・JSON-LD構造化データ・全体OGPをhead/bodyへ集約 |
| **カスタムドメイン** | ❌（`*.studio.site`） | ✅ | 納品後Mini化で独自ドメイン接続。Aレコードは新基盤値 `34.111.141.225` |
| **Studioバナー** | 表示（左下） | 非表示 | Mini化で除去 |
| **ページ数** | 1〜50（要確認） | **2（+404）** | **最大の制約**。LP本体＋サンクス＋プライバシー/特商法が2ページに収まるか法務確認で確定。超える場合は Personal（¥1,190・150ページ）へ |
| **月間Visitor** | 2,000 | 2,000 | 広告流入で超過リスク。月2,000超見込みなら Personal（2万）以上 |
| **フォント** | Studio Fontピッカーで完結（Custom Code不要） | 同左 | Noto Sans JP を Web Font として Font List 最上部（デフォルト）に。和欧混植は Sub Font（要日本語アカウント・全ファミリー同一ウェイト注意） |
| **Embed** | ✅ 全プラン可 | ✅ | G&NロゴSVG（sandbox自動判定）は問題なし |
| **Loop Box / Toggle / On Appear / Hover / Scroll Effect** | LoopBoxはFree可。他は可否未検証 | 全て可（前提） | 可否未確定機能はMini切替後有効化前提で設計。マーキー＝LoopBox（aria-hidden/reduced-motion自動対応）推奨 |
| **フォーム / Sheets / メール通知 / reCAPTCHA** | Apps連携はFree不可の可能性 → 要確認 | ✅ | 標準フォーム（Form1〜3土台）で実装。送信先2系統＋Sheets、サンクスは別ページ指定、reCAPTCHA v3、自動返信は外部連携 |
| **アプリ連携（GA/GTM）** | ❌ | ✅ | リード計測が重要な補助金LPはMini切替後のタグ設置を前提に設計 |

**結論**: 本LPが単一ページ（+サンクス/プライバシー）で2ページ枠に収まり、月2,000Visitor以内ならMini（¥590）で要件充足。**ページ数と広告流入見込みの2点が Mini/Personal の分岐**であり、法務確認で必須ページ数を早急に確定する必要がある。

---

## 付録B. 2026-05-07 spec からの変更点まとめ

| # | spec 該当 | 旧記述 | 2026-06正 | 区分 | confidence |
| --- | --- | --- | --- | --- | --- |
| 1 | §1 価格 | Mini ¥980 / Personal ¥1,980（年契約のみ） | Mini ¥590・Personal ¥1,190（年契約）/ 月契約・Business以降も追加。月契約価格を欠いていた | 訂正 | 公式確認 |
| 2 | §1 ページ数 | Free=50のみ記載 | Mini=2（+404）が未記載だった重大事実。Freeも1〜50で観点間に食い違い（要確認） | 追記/要確認 | 公式確認/未検証 |
| 3 | §1 Visitor/CMS | Free=2,000 / CMS 3 model のみ | プラン別差分（Personal=2万/5model、Business=40万/10model等）、Free CMS公開100件上限 | 追記 | 公式確認/一般知識 |
| 4 | §11 Custom Code文字数 | 1フィールド3,000文字 | **1ブロック30,000文字**・各位置最大10ブロック | 訂正 | 公式確認 |
| 5 | §10 Embed文字数 | per Embed 30,000文字 | 公式記載なし（Custom Codeとの混同疑い） | 格下げ→未検証 | 未検証 |
| 6 | §10 Embedプレビュー | エディタ内確認不可・Publish必須 | エディタ内プレビュー可（sandbox制約あり） | 訂正 | 公式確認 |
| 7 | §2 左ナビ | 14アイコン程度 | 機能パネルは8アイコン（Add/Pages/Layers/Styles/Uploads/Stocks/Connections/Components） | 訂正 | 公式確認 |
| 8 | §3.1 右パネルタブ | インタラクション系を「インタラクション」タブ | カルーセル/RichText=「コンテンツ」、動的=「データ」 | 訂正 | 公式確認 |
| 9 | §12 レイヤーパネル | （AI機能未記載） | AI「レイヤー名最適化」、条件スタイル=ダイヤ型、レスポンシブ=重なった四角アイコン、右クリックメニュー | 追記 | 公式確認 |
| 10 | §7 カラースタイル | サイト全体一括変更 ❌（ページ単位のみ） | **プロジェクト全体に自動伝播（最重要訂正）** | 訂正 | 公式確認 |
| 11 | §7 アルファ | 公式記述なし⚠️ | hex codes and opacity values で不透明度込み保存可 | 格上げ | 公式確認 |
| 12 | §6/§13 px挙動 | px=固定値 | 最大幅として機能し画面が狭まると自動縮小 | 訂正 | 公式確認 |
| 13 | §6 単位 | Fill/Hug表記 | Studioに Fill/Hug は存在しない（Hug=auto、Fill=flex/%100%） | 訂正 | 公式確認 |
| 14 | §4.2 shadow | X/Y/ぼかし/拡散/色 | Inset/Outset切替・内外影同時不可 | 追記 | 公式確認 |
| 15 | §4.2 filter | 区別は要再調査 | Filter（全子要素）/ Backdrop filter（背面・Firefox非対応）を区別。Header背景ぼかしはBackdrop filter | 解決/訂正 | 公式確認 |
| 16 | §4.2 border | スタイル種別未列挙 | Solid/Dashed/Dotted/Double・辺別可・グラデ不可 | 追記 | 公式確認 |
| 17 | §4.2 blend mode | （未記載） | 16種・直近の親のみ適用可 | 追記 | 公式確認 |
| 18 | §5 配置 | 垂直=3択（上/中央/下） | direction依存で stretch/space-between/space-around が出る | 訂正 | 公式確認 |
| 19 | §9 フォントアップロード | 非対応 | **可能**（.ttf/.otf/.woff/.woff2・50MB/ファイル） | 訂正 | 公式確認 |
| 20 | §9 Adobe Fonts | Adobe Fonts等を列挙 | 公式記事に記載なし | 格下げ→未検証 | 未検証 |
| 21 | §9 FONTPLUS | （未記載） | 2026-04-07終了済み（system fontへ自動置換） | 追記 | 公式確認 |
| 22 | §9 副フォント | 英語アカウント不可のみ | 追加後ファミリー全フォントが同一ウェイト表示になる挙動 | 追記 | 公式確認 |
| 23 | §13 ブレークポイント | PC/Tablet/Mobile 3段 | 5段（Default1280/Small1140/Tablet840/Mobile540/Mini320）・初期3段・プロジェクト全体・Default削除不可 | 訂正/追記 | 公式確認 |
| 24 | §13 条件スタイル | PC→Tablet→Mobile階層上書き | 色分け（Tablet黄緑/Mobileオレンジ）・Reset override・画像/文言/DOM構造はBP別変更不可 | 追記 | 公式確認 |
| 25 | §14 Hover | 要再調査・限定的 | Hover/in Hover/Focus/Pressed(button限定)/On Appear/Closed等の全体系・Baseに適用不可 | 解決/追記 | 公式確認 |
| 26 | §15 アニメ | 複雑keyframesはEmbedで実装 | Scroll Effect（View/Scroll timeline・多段KF）・On Appear・LoopBoxで大半ネイティブ実現（Scroll Effectはbeta基盤未対応） | 訂正/追記 | 公式確認 |
| 27 | §17 ポジション | 4種対応表（誤りなし） | fixed=Base直下要件・sticky=親overflow依存＋エディタプレビュー不可・z-index値域-9999〜9999・同値タイブレーカー | 追記 | 公式確認 |
| 28 | §19 フォーム | 観測（限定的）・Webhook等 | 送信先2系統・Sheets一次手段・サンクスは別ページ指定・reCAPTCHA v3（プロジェクト単位）・自動返信非対応・Confirm未検証・Webhook未検証 | 全面更新 | 公式確認/未検証 |
| 29 | §20 公開基盤 | Nuxt/GCS/JSON/SPA | 2026-06-11にMPA/SSR刷新・06-11以前は手動切替要・Aレコード34.111.141.225 | 全面訂正 | 公式確認 |
| 30 | §SEO | （手薄） | title/description/OGP(1200×630)/favicon/noindex/sitemap確立・SEO Writing Assist・Figma to Studio新規 | 追記 | 公式確認 |

---

## 付録C. 残課題（要実機/公式比較表で確認）

- `confidence: 未検証` — Freeの正確なページ上限（1か50か）、Embed文字数上限、Adobe Fonts対応、Custom Fontsのプラン別可否、Scroll Effect/On Appear/Hover/Toggle/Carousel/フォーム機能のFree可否、Confirm（確認画面）パーツ、JSON-LD標準UI、画像のフィット指定UI・srcset相当の最適化配信、AI Auto Responsiveの品質、CMS公開アイテム数のプラン別差分、GSC連携sitemapの「Starter」プラン条件。
- これらは公式pricing機能比較表および実機エディタでの確認が必要。本番発注前に確定すること。

---
*本リファレンスは読み取り調査の統合物であり、`studio_spec.md` 本体は未編集。spec更新時は activity_log.md へ `[INTENT]`/`[DONE]` 記録のうえ実施すること。*

---

統合した「Studio最新仕様リファレンス（2026-06検証版）」は上記Markdownの全文です（プロジェクト指示に従い .md ファイルとしては書き出していません）。11観点の重複（プラン価格は7観点で重複→§1に一本化、Custom Code文字数は3観点で重複→§7に統合、px最大幅挙動は3観点で重複→§3.1に統合）を解消し、矛盾点（Freeページ数1 vs 50、Embed文字数、カラースタイル全体反映の可否）は注記付きで明示しました。各記述に `confidence`/`source` を併記し、末尾に「Free vs Mini 実装方針マトリクス」（付録A）と「2026-05-07 spec からの変更点まとめ」（付録B・30項目）を付しています。