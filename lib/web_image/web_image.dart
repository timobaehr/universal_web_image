import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget webImage({
  required BuildContext context,
  required String imageUrl,
  required double width,
  double height = 37.0,
  String messageNoConnection = 'No connection',
}) {
  return (imageUrl.endsWith('.svg'))
      ? SvgPicture.network(
    imageUrl,
    height: height,
    width: width,
  )
      : CachedNetworkImage(
    imageUrl: imageUrl,
    height: height,
    width: width,
    errorWidget: (c, url, error) {
      debugPrint('network image error: $error');
      final errorMessage = error is SocketException
          ? messageNoConnection
          : error.toString();
      return Column(children: [
        Icon(Icons.error,
            color: Theme.of(context).errorColor),
        Text(errorMessage,
            textScaleFactor: 0.8,
            style: TextStyle(
                color: Theme.of(context).errorColor,
                fontStyle: FontStyle.italic))
      ]);
    },
  );
}
