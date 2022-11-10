import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_web_image/web_image/canvas_renderer_image.dart';

Widget webImage({
  required BuildContext context,
  required String imageUrl,
  required double width,
  Uint8List? bytes,
  double height = 37.0,
  String messageNoConnection = 'No connection',
  Widget Function(BuildContext context)? builder,
}) {
  if (builder != null) {
    return builder(context);
  }

  return CanvasRendererImage(
    bytes: bytes,
    imageUrl: imageUrl,
    width: width,
    height: height,
  );
}
