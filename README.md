# webtextclip

This project tries to reproduce https://github.com/flutter/flutter/issues/61614 with CI/CD.

Currently the github action do not show the rendering issues shown when I run `flutter test test/puppeteer.dart` on my Windows 10 desktop.

Go to Actions tab in github and you can download an artifact containing chrome.png which was rendered in Chrome on Windows using github action.

## Main code
* lib/main.dart
* test/puppeteer.dart
* .github/workflows/windows.yml
