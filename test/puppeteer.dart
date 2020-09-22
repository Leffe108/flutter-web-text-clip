import 'dart:io';

import 'package:puppeteer/puppeteer.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_static/shelf_static.dart';

void main() async {
  // Serve the web build
  var server = await io.serve(createStaticHandler('build/web'), 'localhost', 0);

  // Open in chrome
  var browser = await puppeteer.launch(
    headless: false,
    defaultViewport: DeviceViewport(
      width: 200,
      height: 200,
    ),
  );
  var page = await browser.newPage();
  await page.goto('http://localhost:${server.port}/index.html',
      wait: Until.domContentLoaded);

  // Is there a better way to wait for MyHomePage to render?
  await Future.delayed(Duration(seconds: 1));

  // Save screenshot
  var screenshot = await page.screenshot();
  await File('chrome.png').writeAsBytes(screenshot);
  await browser.close();
}
