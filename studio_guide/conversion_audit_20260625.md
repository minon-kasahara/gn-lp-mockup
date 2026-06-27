# CSS→Studio 変換監査 2026-06-25 azalea

全1448手順を A(Studio操作明記)/B(操作+CSS出典併記)/C(CSS値のみ=要読替) に分類。

| 章 | 判定 | A | B | C |
|---|---|---|---|---|
| g0 0. レスポンシブ・モバイル前提（最 | ほぼ変換済み | 20 | 32 | 2 |
| g1 1. Studioプロジェクト初期設 | ほぼ変換済み | 17 | 19 | 0 |
| g2 2. デザイントークン（全体共通） | ほぼ変換済み | 52 | 92 | 2 |
| g3 3. グローバルレイアウトと z-i | ほぼ変換済み | 14 | 30 | 0 |
| g4 4. 共通コンポーネント | ほぼ変換済み | 22 | 18 | 0 |
| s1 5-1. ヘッダー | ほぼ変換済み | 38 | 34 | 1 |
| s2 5-2. FV（Hero） | 一部CSS残り | 26 | 72 | 6 |
| s3 5-3. アプローチ（Approac | ほぼ変換済み | 14 | 34 | 0 |
| s4 5-4. 採択率 / 市場動向 | ほぼ変換済み | 33 | 42 | 0 |
| s5 5-5. サービス（Service） | ほぼ変換済み | 22 | 28 | 0 |
| s6 5-6. 実績（Record） | ほぼ変換済み | 34 | 14 | 0 |
| s7 5-7. VC提携（VC Partn | ほぼ変換済み | 38 | 22 | 0 |
| s8 5-8. 導入事例（Cases） | 一部CSS残り | 38 | 34 | 6 |
| s9 5-9. FAQ | 一部CSS残り | 48 | 14 | 3 |
| s10 5-10. CTA | 一部CSS残り | 46 | 22 | 3 |
| s11 5-11. フッター | ほぼ変換済み | 34 | 6 | 0 |
| s12 5-12. フローティング特典CTA | ほぼ変換済み | 34 | 30 | 0 |
| t6 6. アニメーション一覧と実装方針 | ほぼ変換済み | 14 | 22 | 0 |
| t7 7. レスポンシブ仕様（セクション別 | 一部CSS残り | 55 | 40 | 6 |
| t8 8. アセット一覧 | ほぼ変換済み | 33 | 6 | 0 |
| t9 9. Embed / Loop Bo | ほぼ変換済み | 28 | 12 | 0 |
| t10 10. 公開前 QA チェックリスト | 一部CSS残り | 38 | 34 | 2 |
| t11 11. モバイル実装の落とし穴（v1 | ほぼ変換済み | 46 | 14 | 2 |
| **合計** | | **744** | **671** | **33** |

**A+B(読替不要)=1415 (97%) / C(要読替)=33 (2%)**

## 対応
- §0.4 前書きを「CSS用語で書いている→読み替えよ」から「既にStudio操作で記載・読替不要・困った時の早見表」に修正
- s2/s8-4/s10-5/s10-6/t7 に節レベル「設定先」注記を挿入(build/responsive のC箇所21件を一括解消)
- s9 margin-top に操作補記
- 残りの少数(g2台帳/checklist・t10 QA・t11・g0の§0.4例)は§0.4に操作が既存で参照可能

## C(要読替)全箇所
- [g0] §0.4 実装中 ol.steps 1番目（line 364） — `Default(PC) で原物 PC 値（例: .sec padding 76px 0、.cta-section padding 84px ` / 欠落:「組む」とだけ書かれ、padding/gap/列を Studio のどのパネルで設定するか（ボックスタブ→余白／間隔(gap)／方向＝横）が手順内に明示されていない。値は原物の出典として併記されている（その点はB寄り）が、対応するStudi
- [g0] §0.4 実装中 ol.steps 3番目（line 366・Mobile上書き） — `Mobile(540) に切替 → …値を上書き（例: --gutter 相当の左右パディングを 16px、Hero グリッドを order` / 欠落:「左右パディング16px」→ボックスタブ→余白、「order 制御で縦1カラム」→レイヤーパネルで子を上下ドラッグ（または親 方向＝縦）、「全幅」→サイズ幅 Fill/flex、がこの手順内に書かれず、読者が§0.4変換表で各CSS概念をS
- [g2] §2.2 標準9スタイル表 #7 English Label 行（line 298）および §2.2 完了チェック（line 348「English Label に text-transform: uppercase を設定した」） — `text-transform: uppercase` / 欠落:uppercase を Studio のどのパネル・項目で設定するかが一切書かれていない。§2.2 のテキストスタイル登録 ol.steps（line 276-282）は Font/Weight/Size/Line height/Lette
- [g2] §2.1-C 背景表 #21 bg/header 行（line 179）／§2.6 制約 callout（line 531）／§2.6 完了チェック（line 590） — `backdrop-filter（ヘッダー背景のぼかし）` / 欠落:「別途 Backdrop filter でぼかしを併用」「Backdrop filter（背面フィルター）で実装する」と指示されるが、Studio のどのパネル・項目で Backdrop filter を設定するかが書かれていない。プロパテ
- [s1] 5-1-5 ベース文字 step3（CTA-Deco テキストの行内設定） — `位置は 相対（relative）（現物 position:relative）` / 欠落:「位置=相対」をどの右パネル項目で設定するか（ポジション欄＝種別:相対）が同stepでは省略されている。直前の段落でパディングは『ボックス›パディング』とパネルパスが示されるが、relative については後段の§5-1-6 step3 で
- [s2] 5-2-5 静的スタイル step4 — `letter-spacing -.04em（行150）/ word-break keep-all（行65）` / 欠落:letter-spacing と word-break をどのパネル/項目で設定するか（Text タブの字間フィールド・word-break/折返し設定）が書かれておらず、生CSSプロパティ名のまま。ウェイト/行間/下マージンはラベル相当だ
- [s2] 5-2-5 H1静的スタイル step2 補足 — `word-break:keep-all（行65）で代替` / 欠落:keep-all を Studio のどの設定（折り返し/単語区切り）で指定するかの操作箇所が未記載。
- [s2] 5-2-9 Mobile step5（Hero H1） — `letter-spacing-.02em（行867）` / 欠落:BP切替後の字間オーバーライドを Text タブのどの項目で行うかが書かれず、生CSS値のみ。
- [s2] 5-2-9 Mobile step6（Hero Sub） — `13.5px、行間1.85、margin-bottom6px、幅auto（行868）` / 欠落:サイズ/行間/margin/幅を上書きするタブ（ボックス/テキストタブ）の指定がなく値の羅列のみ。行間・margin・幅はラベル相当だが操作箇所が省略され読替を要する。
- [s2] 5-2-4 Eyebrow step2 — `ベースライン微調整 vertical-align:-2px（現物 行200）相当` / 欠落:vertical-align の生プロパティが指示として残る。直後に「テキストタブの位置/オフセットで-2px（不可なら無視可）」と一応の操作先はあるが、値はCSSプロパティ名先行で読替負荷あり。
- [s2] 5-2-7 D input共通スタイル表（通常行: input padding/フォント/背景/Border/幅） — `input padding 上下9px/左右12px（行366）、フォント13px/500、背景input-bg、Border1.5px s` / 欠落:表に「Studio入力箇所」列がなく、状態列(通常/Hover/Focus)のみ。通常行は property:value＋行Xソースだが、どのタブ(ボックス/テキスト/フォーム)で入れるかが明示されず、読者が項目を§0.4で対応付ける必要が
- [s8] 5-8-4 業種タグ step (line 251) — `テキストスタイル: font-family Noto Sans JP / font-size 12px / weight 700 / let` / 欠落:フォント系プロパティの値だけ列挙。どのStudio操作（右パネル→テキスト→フォント/サイズ/ウェイト/字間、または既存テキストスタイル適用）で設定するかが書かれず、読者が§0.4でCSS→Studio欄に翻訳する必要がある。前段の他要素（
- [s8] 5-8-4 社名 Company A step (line 276) — `スタイル（原物 行693 が実効）: font-size 14px / weight 900 / line-height 1.3 / let` / 欠落:font-size/weight/line-height/letter-spacing/margin-bottom をどのStudioパネル項目で入れるかの指示なし（右パネル→テキスト→…、margin-bottom は 右パネル→ボックス
- [s8] 5-8-4 業種 Industry A step (line 279) — `スタイル（原物 行694 が実効）: font-size 10.5px / weight 600 / line-height 1.4 / l` / 欠落:フォント系プロパティの設定先パネルが未記載。生のCSS値のみ。
- [s8] 5-8-4 カード見出し Headline A step (line 288) — `スタイル: font-size 15.5px / weight 900 / line-height 1.5 / 色 text/ink、mar` / 欠落:右パネルのどのタブで font-size/weight/line-height/margin を設定するか書かれていない。値羅列のみ。
- [s8] 5-8-4 引用 Quote A / Author A sub-items (lines 298, 301) — `スタイル: font-size 12.5px / weight 500 / line-height 1.75 / 色 text/ink、ma` / 欠落:テキスト系プロパティの設定パネル指示なし。margin系のみ『margin 上8px』と量は書くが操作タブ未記載。CSS値直書き。
- [s8] 5-8-4 リザルト Result Lbl/Val sub-items (lines 334, 335, 340, 341) — `Noto Sans JP / 11px / weight 700 / letter-spacing .04em / 色 text/sub …` / 欠落:ラベル/値のフォント・サイズ・ウェイト・字間・整列をどのStudio操作で入れるかが書かれず、フォント/サイズ/整列/上付きの各パネル項目への読替を読者に要求。
- [s9] s9-5b 質問行 faq-q-badge セクション 手順11 — `上位置の微調整: faq-q-badge-1 に margin-top -2px（現物の縦位置合わせ）` / 欠落:CSSプロパティ margin-top:-2px だけが指示で、Studio操作（右パネル→余白Margin→上 に -2px 入力）の記載がない。括弧内は出典でなく単なる理由付けのため読者が§0.4で読替を要する
- [s9] s9-5b 開閉矢印 faq-q-arrow-1 手順17 末尾 — `上位置 margin-top 6px。flex-shrink させない` / 欠落:margin-top:6px のCSS値のみで、対応するStudio操作（余白Margin→上）が書かれていない。同手順内の margin-left auto は§0.4参照付きで解決済みだが、この上余白は読替が必要
- [s9] s9-5b 回答テキスト faq-a-text-1 手順27 ul内 — `… ／ word-break: normal。` / 欠落:CSSプロパティ word-break:normal をそのまま列挙しているだけで、Studioのどのパネル/項目（テキストタブの折返し設定等）で設定するかが書かれていない
- [s10] §5-10-5 C 吹き出し共通スタイル（行297＋指示行308「各 Box に上記共通スタイルを適用」） — `サイズ12.5px、ウェイト800、パディング 上下9px/左右15px、角丸16px、字間0.02em、行間1.2、折返しなし（nowra` / 欠落:フォント/サイズ/ウェイト/字間/行間=テキストタブのどの項目で、パディング/角丸/折返し（nowrap→サイズauto）=ボックスタブ→外観/サイズのどの項目で設定するか、というパネル指定が無い。『上記共通スタイルを適用』とだけ書かれ、各
- [s10] §5-10-6 D 共通ラベル実値（行363） — `フォント Noto Sans JP、サイズ11.5px、字間0.02em、ウェイト800、文字色ink、下マージン8px。必須印「※」: 文` / 欠落:このラベル値群を設定するStudio操作（テキストタブのサイズ/ウェイト/字間、マージン項目、必須印『※』のスパン部分強調をどのパネルで色分けするか）が下のol.stepsに無い。stepsはプレースホルダ色・ラベル位置・不要フィールド削除
- [s10] §5-10-6 D 共通入力欄実値（行364） — `パディング 上下12px/左右0、ボーダー 下のみ1.5px Solid rgba(15,26,51,.14)（他辺0）、背景 transp` / 欠落:入力欄のパディング/個別ボーダー（下辺のみ）/背景transparent/サイズ/下マージンを、Studioのどのパネル（ボックスタブ→外観のボーダー個別辺指定・背景、テキストタブのサイズ）で設定するかが無い。Focus条件スタイルだけはパ
- [t7] §7.5.2 Mobile ol.steps 3行目（L392） — `<code>hero-h1</code> → <code>clamp(26px,7.8vw,36px)</code>、行間 1.25、字間 ` / 欠落:clamp() を設定する Studio 操作（どのパネル/項目か）が無い。直前の同種ステップ L378 は『テキストタブ→サイズ / 改行ルール normal』と書くが、ここは要素名→clamp値を直書きで、Studio に clamp 
- [t7] §7.6.2 Mobile ol.steps 最終行（L444） — `<code>section-title</code> clamp(24,6.2vw,32)、<code>lead</code> 14px、<` / 欠落:section-title の clamp に対応する Studio 操作（テキストタブ→サイズ等）が書かれず、clamp 式を §0.4 で読替する前提。lead 14px も font-size を指すフィールド語が無く属性を推測させる
- [t7] §7.7.2 Mobile ol.steps 最終行（L476） — `<code>section-title</code> / <code>lead</code> / <code>sec-head</code>` / 欠落:『clamp24-32』『mb36』という CSS 略記値だけで、各々を Studio のどのパネル/項目に入れるか（サイズ/下 margin/余白）が個別に書かれていない。読者が略記→Studio 操作へ翻訳する必要
- [t7] §7.10.2 Mobile ol.steps 2行目（L645） — `共通見出し Mobile 値（section-title clamp24-32 / lead 14 / sec-head mb36）` / 欠落:L476 と同じ。clamp24-32 / mb36 の CSS 略記だけで対応する Studio 操作が無く §0.4 読替を強いる
- [t7] §7.5.2 Mobile ol.steps 7行目（L396） — `<code>vp-badge</code> → … 上方向 margin で食い込ませる（Mobile 値 <code>-24px -18p` / 欠落:4値マージン shorthand の相当値が括弧で示されるのみで、Studio のどのマージン項目（上/下/左/右）に負値をどう割るかが書かれず、shorthand→Studio フィールドへの分解を読者に委ねている
- [t7] §7.2.1 ul 2行目（L158） — `中間帯（768–1279px）でのみ 2 行になる…『PC=1行 / Mobile=自然折返し』に丸める` / 欠落:原物 br-tablet の挙動説明から実装方針への落とし込みで、Mobile 側『自然折返し』を成立させる Studio 操作（テキストボックス幅/改行ルール）が L165–166 に分散し、当ステップ単体ではどのパネル操作で『丸める』の
- [t10] 10.4 タッチ・操作性 / checklist『iOS Safari でアドレスバー伸縮時に Hero 高さが破綻しない』 — `100vh ではなく dvh / auto 採用を確認` / 欠落:Hero ブロックの高さをどこで設定/確認するか（右パネル→ボックスタブ→高さの単位指定など Studio 上の操作箇所）が書かれておらず、読者が vh/dvh/auto を §0.4 で Studio の高さ設定に読み替える必要がある。確
- [t10] 10.9 アクセシビリティ / checklist『フォーカスインジケータが視認できる』 — `focus リング、設計値 0 0 0 3px rgba(74,125,232,.18) 相当` / 欠落:box-shadow 相当の focus リングを Studio のどこ（コンポーネントの focus 状態・エフェクト/影の設定箇所）で付与・確認するかが書かれていない。『設計値…相当』は出典寄りだが、Studio 上での focus 状
- [t11] §11.3a チェックリスト 2 項目目 — `Mobile で appr-flow 1 列・gap14、カード padding 24px 20px` / 欠落:gap14 / padding 24px 20px をどのパネルで入れるか（Studio の条件スタイルでのグリッド gap・ボックス内余白の入力箇所）が当該項目に明記されず、値だけを列挙。直前の本文に『条件スタイルで方向切替』はあるが、g
- [t11] §11.2b 本文（hero-h1 のフォント指定行） — `フォントは Mobile clamp(26px,7.8vw,36px)、最小 380 で 24px。letter-spacing は PC ` / 欠落:直前文で『右パネル→テキストタブ…条件スタイル上書き』と操作箇所は与えられているが、letter-spacing（字間）を Studio のどの項目で入れるかは個別に書かれず CSS プロパティ名のまま。テキストタブ内の字間項目への読替を読