// Piano Quiz service worker: caches everything so the app works offline.
// Bump CACHE when you change the app so phones pick up the new version.
const CACHE = 'piano-quiz-v2';
const SAMPLES = ['C4v8','D%234v8','F%234v8','A4v8','C5v8','D%235v8','F%235v8','A5v8']
  .map(n => 'SalamanderGrandPiano/' + n + '.wav');
const ASSETS = ['./', 'index.html', 'manifest.json', 'icon-192.png', 'icon-512.png', ...SAMPLES];

self.addEventListener('install', e => {
  e.waitUntil(caches.open(CACHE).then(c => c.addAll(ASSETS)).then(() => self.skipWaiting()));
});

self.addEventListener('activate', e => {
  e.waitUntil(
    caches.keys()
      .then(keys => Promise.all(keys.filter(k => k !== CACHE).map(k => caches.delete(k))))
      .then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', e => {
  if (e.request.method !== 'GET') return;
  const isPage = e.request.mode === 'navigate';
  if (isPage) {
    // Network first so updates show up, fall back to cache when offline.
    e.respondWith(
      fetch(e.request).then(r => {
        const copy = r.clone();
        caches.open(CACHE).then(c => c.put('index.html', copy));
        return r;
      }).catch(() => caches.match('index.html'))
    );
    return;
  }
  e.respondWith(caches.match(e.request).then(hit => hit || fetch(e.request)));
});
