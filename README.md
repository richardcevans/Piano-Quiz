# Piano Quiz

A browser-based music note reading trainer. Shows a note on a staff, you identify it on the piano keyboard. No timer, no pressure. Runs on a PC or as an installable, offline-capable app on your phone.

## Features

- Treble and bass clef note recognition
- Toggle between Treble, Bass, or Both clefs
- Notes span C4–A5 (treble) and E2–C4 (bass), including middle C and ledger lines
- Sharps & Flats toggle — adds accidentals to the note pool when you're ready
- Interactive piano keyboard — automatically shows the correct range for each clef
- Sets of 20 questions with live progress counter (Q 7 / 20)
- End-of-set summary showing score, accuracy, and notes to review
- Set history table so you can track improvement over time
- Real piano audio via the Salamander Grand Piano sample library
- Auto-play mode — plays the note automatically on each new question
- Help overlay — labels every line and space on the staff with a mnemonic (treble: Every Good Boy Does Fine and F-A-C-E; bass: Grizzly Bears Don't Fear Anything and All Cows Eat Grass)
- Installable phone app (PWA) — works offline after the first load, with a layout that fits phone screens

## Requirements

- Python 3.6+ (only for running locally on a PC; not needed for the hosted/phone version)
- A modern browser (Chrome, Firefox, Edge)
- The 8 Salamander sample files (included in the repo)

## Setup

Only needed to run locally on a PC. The hosted version (Option 1 below) needs no setup.

1. Clone the repo:
   ```
   git clone https://github.com/richardcevans/Piano-Quiz.git
   cd Piano-Quiz
   ```

2. The 8 piano samples the quiz uses (`C4v8.wav`, `D#4v8.wav`, `F#4v8.wav`, `A4v8.wav`, `C5v8.wav`, `D#5v8.wav`, `F#5v8.wav`, `A5v8.wav`) are already in `SalamanderGrandPiano/` and in `docs/SalamanderGrandPiano/`. You do not need the full sample library. If you want other velocity layers, it is available at [freepats.zenvoid.org](https://freepats.zenvoid.org/Piano/acoustic-grand-piano.html).

## Running

**Option 1 - Hosted web app / phone (no install)**

Open **https://richardcevans.github.io/Piano-Quiz/** in any modern browser. On Android, open it in Chrome, tap the menu, and choose **Install app** (or **Add to Home screen**). It launches full screen like a native app and works offline after the first load (the first load downloads about 19 MB of piano samples, so use Wi-Fi). Nothing else is needed: no Python, no server.

The hosted site is served from the `docs/` folder by GitHub Pages. After editing `note-quiz.html`, run `python publish-pages.py` to rebuild `docs/index.html`, bump `CACHE` in `docs/sw.js`, then commit and push.

**Option 2 - Python** (double-click `start.bat` or run from the terminal):
```
python -m http.server 8080
```

**Option 3 - Node.js:**
```
npx serve .
```

**Option 4 - VS Code:** install the Live Server extension, right-click `note-quiz.html`, and choose "Open with Live Server."

Then open your browser to `http://localhost:8080/note-quiz.html` (or the URL your server provides).

## Why a local server?

The app loads audio samples via `fetch()`. Browsers block local file requests for security when opening HTML directly from disk (`file://`), so a minimal HTTP server is needed. If you don't need audio, you can open the file directly in your browser.

## Audio

The app uses 8 sampled notes from the Salamander Grand Piano (velocity layer `v8`) and pitch-shifts them via the Web Audio API `playbackRate` to cover the full range. Bass notes below C4 are pitch-shifted down from the C4 sample. To use a different velocity (1–16), edit this line in `note-quiz.html`:

```js
const SAMPLE_VELOCITY = 'v8';
```

Higher values are louder and brighter. Lower values are softer.

## Project layout

- `note-quiz.html` - the quiz app (single page, edit this one)
- `docs/` - the published GitHub Pages site: `index.html` (generated), `manifest.json`, `sw.js` (offline cache), icons, and the 8 piano samples
- `publish-pages.py` - rebuilds `docs/index.html` from `note-quiz.html`
- `SalamanderGrandPiano/` - the full sample library
- `start.bat`, `start.ps1` - start a local Python web server on Windows
- `LICENSE` - PolyForm Noncommercial 1.0.0
- `export.ps1` - zips the minimum files needed to run the quiz locally

## Credits and license

The app code is licensed under the [PolyForm Noncommercial License 1.0.0](LICENSE). You can use, modify, and share it for personal, educational, and other noncommercial purposes. Commercial use is not permitted.

Piano sounds are from the Salamander Grand Piano (a Yamaha C5 recorded by Alexander Holm), licensed under [Creative Commons Attribution 3.0](https://creativecommons.org/licenses/by/3.0/). Samples were obtained from [freepats.zenvoid.org](https://freepats.zenvoid.org/Piano/acoustic-grand-piano.html).
