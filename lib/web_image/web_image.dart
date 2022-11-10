import 'package:flutter/material.dart';
import 'package:universal_web_image/web_image/canvas_renderer_image.dart';

Widget webImage({
  required BuildContext context,
  required String imageUrl,
  required double width,
  required double height,
}) {
  return CanvasRendererImage(
    imageUrl: imageUrl,
    width: width,
    height: height,
  );
}
