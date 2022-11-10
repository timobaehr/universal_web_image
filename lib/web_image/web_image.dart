import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget webImage({
  required BuildContext context,
  required String imageUrl,
  required double width,
  double height = 37.0,
  String messageNoConnection = 'No connection',
  Widget Function(BuildContext context)? builder,
}) {
  if (builder != null) {
    return builder(context);
  }

  return (imageUrl.endsWith('.svg'))
      ? SvgPicture.network(
          imageUrl,
          height: height,
          width: width,
        )
      : Image.network(
          imageUrl,
          width: width,
          height: height,
        );
}
