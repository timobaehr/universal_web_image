library universal_web_image;

import 'package:flutter/widgets.dart';

import 'package:universal_web_image/web_image/web_image.dart'
if (dart.library.js) 'package:universal_web_image/web_image/web_image_web.dart';

class UniversalWebImage extends StatelessWidget {
  const UniversalWebImage({
    super.key,
    required this.imageUrl,
    this.width = 100,
    this.height = 100,
  });

  final String imageUrl;

  final double width;

  final double height;

  @override
  Widget build(BuildContext context) {
    // TODO: Show as regular image
    return webImage(
      context: context,
      imageUrl: imageUrl,
      width: width,
      height: height,
    );
  }
}

