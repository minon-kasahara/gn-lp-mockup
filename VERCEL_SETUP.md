# Vercel 公開セットアップ（Studio実装手順書・パスワード保護つき）

手順書 HTML（[`studio_guide/v02_guide.html`](studio_guide/v02_guide.html)）を、Vercel でパスワード保護つきで Web 公開するための手順。

**作成**: 2026-06-18 azalea

---

## 仕組み

- リポジトリ `minon-kasahara/gn-lp-mockup` を Vercel に連携 → push で自動デプロイ。
- ルート `/` は [`vercel.json`](vercel.json) の rewrite で手順書 HTML を表示。
- 全ルートを [`middleware.js`](middleware.js)（Edge Middleware）が**ベーシック認証**で保護。
- **パスワードはリポジトリに置かず**、Vercel の Environment Variables（`SITE_USER` / `SITE_PASS`）に設定する。
- Vercel 公式の Password Protection は Pro（有料）だが、本方式は **Hobby（無料）プランで動作**する。

> ⚠️ **注意**: タスクの進捗・担当データは各ブラウザの localStorage 保存です。URL を共有しても**端末をまたいだ自動同期はしません**（共有はダッシュボードの JSON エクスポート/インポートで）。

---

## セットアップ手順（ユーザー操作）

1. **Vercel アカウント**: https://vercel.com にアクセスし、**GitHub アカウントでログイン**（`minon-kasahara` もしくはリポジトリにアクセスできるアカウント）。
2. **Add New… → Project** → `minon-kasahara/gn-lp-mockup` を **Import**。
   - リポジトリが表示されない場合は「Adjust GitHub App Permissions」で当該リポジトリへのアクセスを許可。
3. 設定画面:
   - **Framework Preset**: `Other`
   - **Root Directory**: `./`（変更不要）
   - **Build Command / Output**: 空のまま（静的配信）
4. **Environment Variables** を追加（Deploy 前に設定）:
   | Name | Value |
   | --- | --- |
   | `SITE_USER` | 任意のユーザー名（例: `gn`） |
   | `SITE_PASS` | **共有パスワード**（皐大・海音に共有する文字列） |
5. **Deploy** を押す。
6. 完了後の URL（例 `https://gn-lp-mockup.vercel.app/`）を開くと**ベーシック認証ダイアログ**が出る → 上記 user / pass を入力すると手順書が表示される。

以降は **main に push するたびに自動で再デプロイ**される。

---

## パスワードの変更

Vercel の Project → **Settings → Environment Variables** で `SITE_PASS` を編集 → **Redeploy**。

## 認証を一時的に外す

`SITE_PASS` を空にして Redeploy すると素通し（公開）になる。

## カスタムドメイン

Project → **Settings → Domains** で独自ドメインを割り当て可能（無料）。

---

## トラブル時

| 症状 | 対処 |
| --- | --- |
| 認証ダイアログが出ない（誰でも見れる） | `SITE_PASS` が未設定 or 空。設定して Redeploy |
| 画像が出ない | デプロイにリポジトリ全体が含まれているか確認（`mockup/assets/` が必要）|
| 401 が解除できない | user/pass が環境変数と一致しているか確認。ブラウザのキャッシュ認証は閉じれば消える |
| middleware が効かない | Vercel のビルドログで Edge Middleware が認識されているか確認。`middleware.js` がリポジトリ直下にあること |
