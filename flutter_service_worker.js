'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "69d4fe2fd27d4e00761237c3a2995bde",
"/": "69d4fe2fd27d4e00761237c3a2995bde",
"main.dart.js": "58d8a3ac087f114595c07119f9735a8e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "279d3cdab855e0ac7d53ba0058db38b1",
"icons/Icon-512.png": "77af8e01da314c7edfe11b5c18f76e4c",
"manifest.json": "3d652a42153c6e22cbb6b91bf521e4c0",
"assets/LICENSE": "e002b57d7caa737ac4c7e37f8532a9ff",
"assets/AssetManifest.json": "74d325c0206341388af7d56b56a4756a",
"assets/FontManifest.json": "580ff1a5d08679ded8fcf5c6848cece7",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/assets/material.png": "6daf304356cc010c1d23585c44041143",
"assets/assets/audios/start.mp3": "a5ca4c3bbeeb2d74b90ec1554a55cb1b",
"assets/assets/audios/explosion.mp3": "2c8b5dd3f51298bbeb019ce1316aa6b9",
"assets/assets/audios/drop.mp3": "154540aeac037695ec1d80adfdff8936",
"assets/assets/audios/clean.mp3": "ac70daf98741de473dec0eacdac333e8",
"assets/assets/audios/rotate.mp3": "23789f16afc6b9cd22711ffde1baa57f",
"assets/assets/audios/move.mp3": "389fd99cd348d712668fa34fd9738753",
"assets/assets/gpay.jpg": "80ac2ef0046713e165d32d3da24e7c7a",
"assets/assets/paytm.jpg": "10a9b9d0fb78e7b4f2bd00bf572f350d"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
