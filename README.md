# Note Quiz

A browser-based music note reading trainer. Shows a note on a treble clef staff, you identify it on the piano keyboard. No timer, no pressure.

![Note Quiz screenshot](https://i.imgur.com/placeholder.png)

## Features

- Treble clef note recognition (C4–A5)
- Interactive piano keyboard with white and black keys
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

Double-click `start.bat` or run from the terminal:

```
python -m http.server 8080
```

Then open your browser to:

```
http://localhost:8080/note-quiz.html
```

Press **Ctrl+C** in the terminal to stop the server.

## Why a local server?

The app loads audio samples via `fetch()`. Browsers block local file requests for security when opening HTML directly from disk (`file://`), so a minimal HTTP server is needed. Python's built-in server is all that's required — no installs.

## Audio

The app uses 8 sampled notes from the Salamander Grand Piano (velocity layer `v8`) and pitch-shifts them via the Web Audio API `playbackRate` to cover the full C4–A5 range. To use a different velocity (1–16), edit this line in `note-quiz.html`:

```js
const SAMPLE_VELOCITY = 'v8';
```

Higher values are louder and brighter. Lower values are softer.

## License

MIT
