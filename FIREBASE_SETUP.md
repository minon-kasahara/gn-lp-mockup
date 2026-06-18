# Firebase 同期セットアップ（手順書の進捗・担当を2人で自動共有）

手順書 HTML（`studio_guide/v02_guide.html`）のタスク進捗・担当を、**全端末でリアルタイム自動同期**するための設定。
Firebase Realtime Database（無料 Spark プラン）を使う。

**作成**: 2026-06-18 azalea

---

## 仕組み

- 各タスク（チェック / 担当）を `gnGuide/tasks/{章ID}/{番号}` に**タスク単位で保存**。
- 2人が別の章を同時に触っても**上書きせず統合**（マージ）。
- `.on('value')` でリアルタイム受信 → 相手の操作が即画面に反映。
- **設定（window.GN_FIREBASE）が空のうちは無効**＝従来どおり localStorage のみ。
- Firebase の Web 構成（apiKey 等）は**公開前提の値**で、リポジトリに置いても問題ない（セキュリティは Database のルールで担保）。

---

## セットアップ手順（ユーザー操作・約5分）

1. **https://console.firebase.google.com/** に Google アカウントでログイン。
2. **「プロジェクトを追加」** → 任意の名前（例 `gn-guide`）。Google Analytics は不要（オフでよい）。
3. 左メニュー **「構築 > Realtime Database」** → **「データベースを作成」**。
   - ロケーション: 任意（例: `asia-southeast1`）
   - セキュリティルール: **「テストモードで開始」** でOK（後述のルールに差し替え推奨）
4. **ルールを設定**（Realtime Database → ルール タブ）→ 次に差し替えて「公開」:
   ```json
   {
     "rules": {
       ".read": false,
       ".write": false,
       "gnGuide": { ".read": true, ".write": true }
     }
   }
   ```
   → `gnGuide` 配下のみ読み書き可（手順書のデータだけ）。
5. **Web アプリを登録**して構成を取得:
   - プロジェクト概要の **歯車 > プロジェクトの設定** → 下部 **「マイアプリ」** → **`</>`（ウェブ）** を追加。
   - 表示される `const firebaseConfig = { ... }` の中身（apiKey / authDomain / **databaseURL** / projectId）を控える。
   - ⚠️ **databaseURL** が含まれていることを確認（例: `https://gn-guide-default-rtdb.asia-southeast1.firebasedatabase.app`）。無ければ Realtime Database のページ上部の URL をコピー。
6. **この構成を azalea に渡す** → 手順書の `window.GN_FIREBASE` に反映して push します。
   （ご自身で編集する場合は `studio_guide/v02_guide.html` 内の `window.GN_FIREBASE = {...}` を書き換え）

反映後、手順書を開くと右上のバッジが **🟢 同期** になり、2人が同じ URL を開けば進捗・担当がリアルタイム共有されます。

---

## 注意

- ルールを `gnGuide` 限定の read/write 可にしているため、**databaseURL を知る人は誰でもこの部分の読み書きが可能**です（保存するのはタスクのチェック/担当のみで機微情報なし）。より厳格にするなら匿名認証＋ルール強化が可能（要相談）。
- 無料 Spark プランの上限（同時接続100・転送量等）に対し、本用途（2人・小さなJSON）は余裕。
- 設定を空に戻して push すれば、同期を無効化（ローカルのみ）に戻せます。

## トラブル時

| 症状 | 対処 |
| --- | --- |
| バッジが 🔴 エラー | databaseURL が正しいか / ルールで gnGuide が write 可か確認 |
| バッジが ⚪ ローカルのまま | `window.GN_FIREBASE` の apiKey / databaseURL が空でないか確認 |
| 相手の変更が反映されない | 双方が同じ URL・同じ Firebase プロジェクトを使っているか確認 |
