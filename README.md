# Note Quiz

A browser-based music note reading trainer. Shows a note on a staff, you identify it on the piano keyboard. No timer, no pressure.

## Features

- Treble and bass clef note recognition
- Toggle between Treble, Bass, or Both clefs
- Notes span C4–A5 (treble) and E2–C4 (bass), including middle C and ledger lines
- Interactive piano keyboard — automatically shows the correct range for each clef
- Real piano audio via the Salamander Grand Piano sample library
- Score tracking with accuracy percentage and progress bar
- Recent answers log
- Auto-play mode — plays the note automatically on each new question

## Requirements

- Python 3.6+ (for the local HTTP server)
- A modern browser (Chrome, Firefox, Edge)
- Salamander Grand Piano samples in the `SalamanderGrandPiano/` folder

## Setup

1. Clone the repo:
   ```
   git clone https://github.com/your-username/Note-Quiz.git
   cd Note-Quiz
   ```

2. Download the Salamander Grand Piano samples and place the 8 required `.wav` files in `SalamanderGrandPiano/`:
   - `C4v8.wav`, `D#4v8.wav`, `F#4v8.wav`, `A4v8.wav`
   - `C5v8.wav`, `D#5v8.wav`, `F#5v8.wav`, `A5v8.wav`

   The full library is available at [freepats.zenvoid.org](https://freepats.zenvoid.org/Piano/acoustic-grand-piano.html).

## Running

**Option 1 — Python** (double-click `start.bat` or run from the terminal):
```
python -m http.server 8080
```

**Option 2 — Node.js:**
```
npx serve .
```

**Option 3 — VS Code:** install the Live Server extension, right-click `note-quiz.html`, and choose "Open with Live Server."

Then open your browser to `http://localhost:8080/note-quiz.html` (or the URL your server provides).

## Why a local server?

The app loads audio samples via `fetch()`. Browsers block local file requests for security when opening HTML directly from disk (`file://`), so a minimal HTTP server is needed. If you don't need audio, you can open the file directly in your browser.

## Audio

The app uses 8 sampled notes from the Salamander Grand Piano (velocity layer `v8`) and pitch-shifts them via the Web Audio API `playbackRate` to cover the full range. Bass notes below C4 are pitch-shifted down from the C4 sample. To use a different velocity (1–16), edit this line in `note-quiz.html`:

```js
const SAMPLE_VELOCITY = 'v8';
```

Higher values are louder and brighter. Lower values are softer.

## License

MIT
