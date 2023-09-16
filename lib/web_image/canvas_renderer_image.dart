import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CanvasRendererImage extends StatelessWidget {
  const CanvasRendererImage({
    super.key,
    required this.imageUrl,
    this.bytes,
    this.width,
    this.height,
    this.fit,
    this.onLoaded,
  });

  final String imageUrl;

  final Uint8List? bytes;

  final double? width;

  final double? height;

  final BoxFit? fit;

  final VoidCallback? onLoaded;

  @override
  Widget build(BuildContext context) {
    final bool isSvgImage = imageUrl.endsWith('.svg');

    if (bytes != null) {
      return isSvgImage
          ? SvgPicture.memory(
        bytes!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
      )
          : Image.memory(
        bytes!,
        height: height,
        width: width,
        fit: fit,
      );
    }
    return isSvgImage
        ? SvgPicture.network(
      imageUrl,
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
    )
        : Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, widget, event) {
        if (event != null && event.cumulativeBytesLoaded == event.expectedTotalBytes && onLoaded != null) {
          onLoaded!();
        }
        return widget;
      },
    );
  }
}
