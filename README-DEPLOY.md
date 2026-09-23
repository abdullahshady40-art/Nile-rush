# Deploying NILE RUSH

NILE RUSH is a static site (plain HTML/CSS/JS — no build step, no server-side
code required). Any static host works. Below are exact steps for the most
common ones, plus how to customize the game after deploying.

---

## 1. Run it locally first

```bash
npm start
```

This starts a tiny zero-dependency server (`tools/serve.js`) and prints a URL
like `http://localhost:8080`. Open it in your browser. Because the game is
loaded as ES modules, it must be served over `http://`/`https://` — opening
`index.html` directly as a `file://` URL will not work in most browsers.

Any other local server works too, e.g. `npx serve .` or Python's
`python3 -m http.server 8080`.

---

## 2. Deploy to Netlify

**Option A — drag & drop (fastest):**
1. Go to [app.netlify.com/drop](https://app.netlify.com/drop).
2. Drag the whole project folder onto the page.
3. Netlify gives you a live `https://your-site-name.netlify.app` URL immediately.

**Option B — connect a Git repo:**
1. Push this project to a GitHub/GitLab/Bitbucket repository.
2. In Netlify: **Add new site → Import an existing project**, pick the repo.
3. Build settings: **Build command:** leave empty. **Publish directory:** `.` (project root).
4. Deploy. The included `netlify.toml` already sets correct cache headers for
   `sw.js`, `manifest.json` and the game's `src/`/`assets/`/`icons/` folders —
   no extra configuration needed.

---

## 3. Deploy to Vercel

**Option A — Vercel CLI:**
```bash
npm i -g vercel
vercel
```
Accept the defaults (no build command, output directory = project root).
`vercel.json` in this repo already configures the same headers as Netlify.

**Option B — Git import:**
1. Push the project to a Git repository.
2. In Vercel: **Add New… → Project**, import the repo.
3. Framework preset: **Other**. Build command: empty. Output directory: `.`
4. Deploy.

---

## 4. Deploy to GitHub Pages

1. Push this project to a GitHub repository (the included `.nojekyll` file
   stops GitHub Pages from ignoring folders that start with `_`/underscored
   paths, and is required so the site serves correctly).
2. In the repo: **Settings → Pages**.
3. **Source:** Deploy from a branch. **Branch:** `main` (or your default),
   folder `/ (root)`.
4. Save. GitHub gives you a URL like `https://yourusername.github.io/your-repo/`.
5. Because GitHub Pages serves the project from a sub-path (`/your-repo/`),
   all paths in this project are relative (`./`, `src/…`, `assets/…`), so it
   works out of the box with no path changes needed.

---

## 5. Any other static host

Upload the entire project folder as-is (keep the folder structure). The only
requirements from a host are:
- Serves static files over HTTP/HTTPS.
- Serves `.js` files with a JavaScript/`text/javascript` MIME type (all
  mainstream hosts do this correctly by default).
- Serves `manifest.json` (any host is fine; a `application/manifest+json`
  content type is a nice-to-have, not required for the game to run).

---

## 6. Custom domain

**Netlify:** Site settings → Domain management → Add a domain. Point your
domain's DNS to Netlify (either an `A`/`ALIAS` record to Netlify's load
balancer, or a `CNAME` to your `*.netlify.app` address, as shown in the
Netlify UI) → Netlify auto-provisions HTTPS (see below).

**Vercel:** Project → Settings → Domains → Add. Point your domain's DNS as
instructed in the Vercel UI (`A` record to `76.76.21.21` or a `CNAME` to
`cname.vercel-dns.com`, exact values are shown per-domain in the dashboard).

**GitHub Pages:** Repo → Settings → Pages → Custom domain, enter your domain.
Add a `CNAME` DNS record pointing your domain/subdomain at
`yourusername.github.io`, or `A` records to GitHub's Pages IPs (GitHub shows
the current IPs in its own docs, since they can change).

---

## 7. HTTPS

Netlify, Vercel and GitHub Pages all **provision free HTTPS automatically**
(via Let's Encrypt) as soon as your domain's DNS points at them — there is
nothing to configure in this project. Just make sure, after adding a custom
domain, to enable "Force HTTPS" / "Enforce HTTPS" in that host's settings
(all three have this as a simple toggle once the certificate is issued).

---

## 8. Adding your own 3D models, images and music

See **[`assets/README.md`](assets/README.md)** for the full guide. In short:

1. Drop a `.glb` model into `assets/models/`, an image into `assets/images/`,
   or audio into `assets/audio/`.
2. Point to the filename from `assets/assets.json`.
3. Reload — the game automatically prefers your file and only falls back to
   its built-in procedural art/audio for anything you leave blank.

This also covers models exported from **Meshy** or any other AI/3D tool —
export as GLB, drop it in, register it in `assets.json`.

---

## 9. Adding a new playable character

1. Open `src/characters/CharacterData.js` and add an entry to the
   `CHARACTERS` array — copy an existing one as a template. Set its `id`,
   `name`, `title`, description, stats, `fx` gameplay modifiers, `unlock`
   condition (`free`, `coins`, or `distance`), and `palette` colours.
2. Open `src/characters/CharacterView.js` and add a branch for your
   character's `look` id inside `draw()` if you want a distinct silhouette
   (headwear, hair, accessories) beyond re-coloring the base rig — the base
   rig alone already gives you a fully animated, correctly-proportioned
   character with just a palette.
3. Optional: give it a real 3D model instead of the procedural rig — see
   step 8 above / `assets/README.md`.
4. That's it: the character automatically appears in the Characters screen,
   the Shop, and save/load, because both read from `CHARACTERS`.

---

## 10. Updating the credit / branding text

The "NILE RUSH" title and the "Abdullah Shady — Original Idea Developer"
credit line appear in three places:
- `src/ui/logo.js` — the title-screen/menu logo SVG.
- `src/ui/screens/Panels.js` — the in-game Credits screen.
- `src/ui/UI.js` (`CREDIT_AR` / `CREDIT_EN` constants) — the intro cinematic caption.

Update the text in those files if you ever need to change the credit.
