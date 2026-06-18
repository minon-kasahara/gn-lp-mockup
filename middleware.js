// Vercel Edge Middleware — 全ルートにベーシック認証（社内向け手順書の簡易パスワード保護）
// パスワードは Vercel の Environment Variables (SITE_USER / SITE_PASS) に設定する。
// リポジトリにはパスワードを置かない。SITE_PASS 未設定時は素通し（公開）になる。
export const config = { matcher: '/:path*' };

export default function middleware(request) {
  const PASS = process.env.SITE_PASS || '';
  const USER = process.env.SITE_USER || 'gn';

  // SITE_PASS が未設定なら認証をかけない（設定し忘れ時に締め出さないため）
  if (!PASS) return;

  const header = request.headers.get('authorization') || '';
  if (header.startsWith('Basic ')) {
    try {
      const decoded = atob(header.slice(6));
      const i = decoded.indexOf(':');
      const u = decoded.slice(0, i);
      const p = decoded.slice(i + 1);
      if (u === USER && p === PASS) return; // 認証OK → 通過
    } catch (e) { /* ignore malformed header */ }
  }

  return new Response('認証が必要です（G&N Studio 実装手順書・社内向け）', {
    status: 401,
    headers: { 'WWW-Authenticate': 'Basic realm="G&N Studio Guide"' }
  });
}
