// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

/// This widget creates a view for the browser with HTML. A hole is cut in the flutter canvas, so to speak,
/// where the <img></img> is rendered.
Widget webImage({
  required BuildContext context,
  required String imageUrl,
  double? width,
  double? height,
}) {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      imageUrl,
      (int viewId) => ImageElement(
            src: imageUrl,
            width: width?.toInt(),
            height: height?.toInt(),
          ));
  return SizedBox(
    width: width,
    height: height,
    child: HtmlElementView(viewType: imageUrl),
  );
}
