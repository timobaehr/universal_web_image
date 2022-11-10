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

Universal Web Image for Flutter Web apps

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

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```
