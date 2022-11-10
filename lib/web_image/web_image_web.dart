// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

Widget webImage({
  required BuildContext context,
  required String imageUrl,
  required double width,
  Uint8List? bytes,
  double height = 37.0,
  String messageNoConnection = 'No connection',
  Widget Function(BuildContext context)? builder,
}) {
  ui.platformViewRegistry.registerViewFactory(
      imageUrl,
          (int viewId) => ImageElement(
            src: imageUrl,
            width: width.toInt(),
            height: height.toInt(),
          ));
  return SizedBox(
      width: width,
      height: height,
      child: HtmlElementView(viewType: imageUrl));
}