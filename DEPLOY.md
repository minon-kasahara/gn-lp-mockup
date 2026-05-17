# GitHub 公開・運用ガイド（gn-lp-mockup）

**目的**: G&N LP モックアップ（v09）を GitHub Pages で外部レビュー用に公開する。
**作成**: 2026-05-18 azalea

---

## リポジトリ

- **GitHub**: `AzaleaK2/gn-lp-mockup`（**Public**）
- **ローカルクローン推奨パス**: `~/gn-lp-mockup/`（Google Drive 外）
- **公開 URL**: `https://azaleak2.github.io/gn-lp-mockup/`（Pages 有効化後）

---

## ⚠️ 重要: ソース管理方針の変更（2026-05-18）

- 本リポジトリ（git）が **モックアップソースの正**
- **Google Drive 側でのソースコード管理は中止**
- azalea / kasahara 両セッションが本リポジトリを clone し、編集 → commit → push
- push すると GitHub Actions が自動でビルド・Pages デプロイ

---

## 公開の仕組み

`.github/workflows/deploy.yml` が `main` への push 時に自動実行:

1. `mockup/drafts/v09_20260424_full_castme-hubblecolor.html` を `index.html` 化
2. HTML 内 `../assets/` → `assets/` にパス書換
3. `<head>` に `noindex,nofollow` メタを注入（未公開クライアント LP のため）
4. `mockup/drafts/privacy.html` を `privacy.html` として配信
5. `mockup/assets/`（`generated/` 除く）を `assets/` として配信
6. `robots.txt`（全クローラ拒否）を配置
7. GitHub Pages にデプロイ

> 🔒 **noindex について**: 未公開・法務未確認の LP のため、検索エンジンにインデックスされないよう noindex + robots.txt を付与しています。外部レビューは**直リンク共有**で実施してください。本番公開時に外す運用です。不要なら azalea に削除を依頼してください。

---

## 2セッション git 運用ルール

### 作業開始時（必須）

```bash
cd ~/gn-lp-mockup
git pull origin main          # 他セッションの最新を取り込む
```

### 作業終了時（必須）

```bash
git add -A
git commit -m "{セッション識別子}: {変更要約}"
git push origin main          # → GitHub Actions が自動デプロイ
```

### コンフリクト回避

- **作業前に必ず `git pull`**
- 細かく commit / push する（大きな差分を溜めない）
- `activity_log.md` の `[INTENT]` / `[DONE]` 記録は git 運用でも継続（git log と二重で履歴を担保）
- 同一ファイルの同時編集が予想される場合は activity_log で調整

### コミットメッセージ規約

```
{識別子}: {対象} {変更内容}
例) kasahara: Record 月桂樹サイズ調整
例) azalea: 指示書 §5-6 を月桂樹版に同期
```

---

## 公開 URL の更新タイミング

- kasahara / azalea のどちらかが push するたびに **GitHub Actions が自動で再ビルド・再デプロイ**
- 反映まで 1〜3 分程度
- デプロイ状況: GitHub リポジトリの「Actions」タブで確認

---

## トラブル時

| 症状 | 対処 |
| --- | --- |
| push が拒否される | `git pull --rebase origin main` してから再 push |
| Pages が更新されない | Actions タブでワークフロー失敗を確認。失敗ログを azalea に共有 |
| アセットが 404 | v09 の参照パスが `../assets/` 形式か確認（ビルドで `assets/` に書換される）|
| 公開を一時停止したい | リポジトリ Settings → Pages を Disable、または Actions を無効化 |

---

最終更新: 2026-05-18 azalea
