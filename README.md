<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Universal Web Image for Flutter Web apps with external hosted images.

## Features

* Show an image as html image, if necessary.
* Distinguish between svg images and others automatically

## Motivation

If you try to load an image without valid XHR status 200, an error is thrown and the image does not
become visible on web.

```
Failed to load network image.
Image URL: https://example.com/invalidConfiguredServerImage.jpg
Trying to load an image from another domain? Find answers at:
https://flutter.dev/docs/development/platform-integration/web-images
```

This package solves the issue by using a Web Image as fallback.

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:universal_web_image/universal_web_image.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  // 424x283
  static const validImageUrl = 'https://www.kesselheld.de/content/uploads/2018/09/durchschnittliche-heizkosten.jpg';

  // 640x300
  static const invalidImageUrl = 'https://img.utopia.de/cH68CrxH2UEqUr8eVAWC-BCgXoU=/640x300/https://utopia.de/app/uploads/2019/02/richtig-heizen-wpb-ivan-kruk-ri-190820-1280x720.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Web Image with valid XHR 200 status',
            ),
            const UniversalWebImage(
              imageUrl: validImageUrl,
              width: 424,
              height: 283,
            ),
            const Text(
              'Web Image with invalid XHR 0 status',
            ),
            const UniversalWebImage(
              imageUrl: invalidImageUrl,
              width: 640,
              height: 300,
            ),
            const Text(
              'Regular image with invalid XHR 0 status',
            ),
            Image.network(
              invalidImageUrl,
              width: 640,
              height: 300,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
```
