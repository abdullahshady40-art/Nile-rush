# NILE RUSH

An original, Egyptian-themed 3D endless runner for the browser — built from
scratch on a custom engine ("NileForge"), with **zero external game-engine
dependencies** (no Unity, no Unreal, no three.js). Pure HTML5, CSS3,
JavaScript (ES modules), WebGL2 and the Web Audio API.

**عبدالله شادي — مطور الفكرة**
**Abdullah Shady — Original Idea Developer**

---

## What this is

- A 3-lane endless runner in the style of the genre popularised by games like
  Subway Surfers (gameplay feel only — no characters, logos, sounds, maps or
  assets are copied from any other game).
- A full original world along the Nile: Cairo streets, a desert road, a Nile
  bridge, a train station, a sunset promenade, night Cairo, and a dust storm —
  cycling endlessly with a day/sunset/night lighting system.
- 3 original playable characters, 4 "Nile Board" hoverboard-style vehicles,
  skins, cosmetic trail effects, 6 power-ups, coins, an in-game shop, rotating
  missions, 10 achievements, a tutorial, pause menu and full settings.
- A Progressive Web App: installable, works offline after first load, has its
  own icons and splash behaviour.
- Every sound and every music track is synthesized in the browser with the Web
  Audio API — there are no bundled audio files, so nothing is ever silent or
  broken. (You can optionally drop in your own audio/model files — see
  `assets/README.md`.)

## Quick start (local)

No build step, no bundler, no npm install required — the game is plain ES
modules loaded directly by the browser.

```bash
npm start
# or: node tools/serve.js
```

Then open **http://localhost:8080** (the server prints the exact URL/port).
Because the game uses `import`/`export` modules, it **will not run** by
double-clicking `index.html` from disk (`file://`) — it must be served over
`http://` or `https://`. Any static file server works; `npm start` is just a
zero-dependency convenience server included in this repo.

## Deploying

See **[README-DEPLOY.md](README-DEPLOY.md)** for step-by-step instructions to
publish on Netlify, Vercel, GitHub Pages, or any other static host, plus how
to add a custom domain, enable HTTPS, and add your own characters, models,
images and music.

## Controls

| Action | Keyboard | Touch |
|---|---|---|
| Move left / right | ←/A · →/D | Swipe left / right |
| Jump | ↑ / W / Space | Swipe up |
| Slide | ↓ / S | Swipe down |
| Dash (when meter is full) | Shift / E | Double-tap |
| Use Nile Board | B | On-screen board button |
| Pause | Esc / P | Pause button |

An in-game Settings toggle also adds on-screen arrow buttons for players who
prefer them over swipes.

## Project structure

```
index.html             Entry HTML
manifest.json          PWA manifest
sw.js                   Service worker (offline caching)
src/
  main.js               Boots the game
  core/                  Math (mat4), utils/RNG, config, event bus, object pool
  rendering/             WebGL2 renderer, shaders, geometry, camera, glTF/GLB loader
  world/                 Procedural world streaming, environments, obstacles, spawner, collectibles
  player/                Player physics & animation state machine
  characters/            Character/skin/board/trail/power-up data + procedural character rig
  game/                  Game state machine, run/score logic, camera rig
  input/                 Keyboard + touch/swipe input
  audio/                 Web Audio engine, synthesized SFX, generative music
  storage/                localStorage save system
  missions/               Missions + achievements
  ui/                     All screens (menu, HUD, shop, settings, etc.)
assets/                  Optional user-provided models/images/audio (see assets/README.md)
icons/                   PWA icons + favicon
tools/                   Local dev server
```

## Browser support

Any modern browser with **WebGL2** support: Chrome, Edge, Firefox, Safari 15+,
and their Android/iOS equivalents. If WebGL2 is unavailable the game shows a
clear on-screen message instead of a blank page.

## License / credits

This is an original work. See in-game **Credits** (main menu → Credits) for
the full statement. `NILE RUSH`, its world, characters and "NileForge Engine"
name are original to this project.
