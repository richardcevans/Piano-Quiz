"""Builds docs/index.html from note-quiz.html for GitHub Pages (PWA).
Run after editing note-quiz.html:  python publish-pages.py
Then commit and push. Bump CACHE in docs/sw.js so phones pick up the update."""
import re
src = open('note-quiz.html', encoding='utf-8').read()
head = ('<link rel="manifest" href="manifest.json">\n'
        '<meta name="theme-color" content="#5b21b6">\n'
        '<link rel="icon" href="icon-192.png">\n'
        '<link rel="apple-touch-icon" href="icon-192.png">\n')
reg = ("<script>\nif ('serviceWorker' in navigator) {\n"
       "  window.addEventListener('load', () => navigator.serviceWorker.register('sw.js'));\n}\n</script>\n")
out = src.replace('</head>', head + '</head>', 1).replace('</body>', reg + '</body>', 1)
open('docs/index.html', 'w', encoding='utf-8').write(out)
print('wrote docs/index.html')
