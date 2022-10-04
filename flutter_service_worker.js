'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.png": "61b7845a349ad796b08ee7b1ca1ad701",
"main.dart.js": "21f77af14575df9be4fa7ecb70b913f4",
"index.html": "c57968af1cce1bfc66953ce90924fb3a",
"/": "c57968af1cce1bfc66953ce90924fb3a",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"manifest.json": "66f929fb80f343778e17511ff2f2244e",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"assets/AssetManifest.json": "1da605e2eb67bc26672916bc89b2df1f",
"assets/shaders/ink_sparkle.frag": "6b16a147d705beed121dfeee567d9ef4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/assets/images/sintel.jpg": "5b4a20ec9a07e03add61dbfff0def608",
"assets/assets/images/tiger_king.jpg": "09f31639810f01424f9e13d47cfd7075",
"assets/assets/images/loading.gif": "c1b309f91a7875d46da517b3425b41aa",
"assets/assets/images/stranger_things.jpg": "45da3c11ae3d50a599d5a91663664d82",
"assets/assets/images/umbrella_academy_title.png": "0fc8a66b919dbffb8cb464dc30939b22",
"assets/assets/images/netflix_logo1.png": "451f1d563a05a249b69772cfbcc456e7",
"assets/assets/images/htsdof.jpg": "c0f043e4ae001920e0f1bd10042d8549",
"assets/assets/images/carole_and_tuesday_title.png": "1f8f81cf47fccb05606f3df26b7695eb",
"assets/assets/images/atla.jpg": "5b65b1115886e026df8745ce0fa17a2b",
"assets/assets/images/explained.jpg": "431292d11962afefbfe2991fd3d01a67",
"assets/assets/images/breaking_bad.jpeg": "7821e297df27197cdda67e13e82188b8",
"assets/assets/images/netflix_logo0.png": "90753a23d851213f214e1faccc4947cb",
"assets/assets/images/na.jpg": "8e60d6a650d5453655c5d6caa8c7734d",
"assets/assets/images/umbrella_academy.jpg": "694538108dad1b7bbf145065d438f0d3",
"assets/assets/images/netflix_icon.png": "dec428d6c77041f80d616d132c8ecef4",
"assets/assets/images/violet_evergarden.jpg": "2d3095573a37672e6155447e371d6ea6",
"assets/assets/images/deluxa_logo_sq.png": "05ad1706f2f9487ca85d9b9814504930",
"assets/assets/images/deluxa.png": "edab3cb3d843798dc32f648af931a42f",
"assets/assets/images/deluxa_logo.png": "662936ec99480fbc9a22803e1c1e6a23",
"assets/assets/images/carole_and_tuesday.jpg": "e787073ccc9428249afe92313d00c6bc",
"assets/assets/images/deluxa_skl.png": "24110bd109b9ba18b90584e9a3d2f81b",
"assets/assets/images/sintel_title.png": "213547e6e216ec48180c091ff8c8f13d",
"assets/assets/images/teotfw.jpg": "b1ad8119028caab99a82ae253eb2a8e5",
"assets/assets/images/witcher.jpg": "36d8eee67f80feedbf05534e642247ae",
"assets/assets/images/icon.png": "a34cbf77158913951d8efdda7c249c85",
"assets/assets/images/kakegurui.jpg": "e53e90e841c33926c45deb4dae78442d",
"assets/assets/images/black_mirror.jpg": "bbf94b8f7e8cbdbf2c4e9a5b92ea0790",
"assets/assets/images/deluxa_skl2.png": "ec5eb707ff6242924d98efda74b5e8a8",
"assets/assets/images/dogs.jpg": "2b8484bf41be42ce95d42c193cec6a8a",
"assets/assets/images/crown.jpg": "47eaa139afb5abaf6dca5407f64080f7",
"assets/assets/images/thirteen_reasons_why.jpg": "f3c6ba25dc548121333e15a5401b5bd2",
"assets/assets/images/crown_title.png": "02fa5258c38d51bbf902520255352dc2",
"assets/assets/images/atla_title.png": "6155f51047594677982d4b6aa0c614d2",
"assets/assets/images/black_mirror_title.png": "f6ec0b792069f472d2e36634e35baa69",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "a6357f82e3de574c7130df7c4cf68c4c",
"version.json": "ff986a3ada1638a8359312e097f9351b",
"icons/Icon-512.png": "1369e2bf517e4e06eccf0749d3c7fea0",
"icons/Icon-192.png": "0e1721a3c81ef5907144046c8620b94d",
"icons/Icon-maskable-192.png": "0e1721a3c81ef5907144046c8620b94d",
"icons/Icon-maskable-512.png": "1369e2bf517e4e06eccf0749d3c7fea0"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
