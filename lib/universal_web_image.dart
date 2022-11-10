library universal_web_image;

import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;
import 'package:universal_web_image/web_image/canvas_renderer_image.dart';

import 'package:universal_web_image/web_image/web_image.dart'
if (dart.library.js) 'package:universal_web_image/web_image/web_image_web.dart';

class UniversalWebImage extends StatefulWidget {
  const UniversalWebImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.customImageBuilder,
  });

  final String imageUrl;

  final BoxFit? fit;

  final double? width;

  final double? height;

  /// If you use [customImageBuilder], you break the auto distinguish feature.
  /// Hence, you have to handle drawing svg images vs. other images yourself.
  final Widget Function(BuildContext context)? customImageBuilder;

  @override
  State<UniversalWebImage> createState() => _UniversalWebImageState();
}

class _UniversalWebImageState extends State<UniversalWebImage> {

  Uint8List? bytes;

  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb && bytes == null && !hasError) {
      _bytes();
      return const Text('loading');
    }
    if (!hasError && widget.customImageBuilder == null) {
      final width = widget.fit == null ? widget.width : null;
      final height = widget.fit == null ? widget.height : null;
      return CanvasRendererImage(
        imageUrl: widget.imageUrl,
        width: width,
        height: height,
        fit: widget.fit,
      );
    }
    if (!hasError && widget.customImageBuilder != null) {
      return widget.customImageBuilder!(context);
    }

    // Image ${widget.imageUrl} cannot be drawn by Flutter canvas renderer.
    return webImage(
      context: context,
      imageUrl: widget.imageUrl,
      // TODO: How can be get pixels of the image?
      width: widget.width ?? 100,
      height: widget.height ?? 100,
    );
  }

  Future<bool> _bytes() async {
    try {
      final response = await http.get(Uri.parse(widget.imageUrl));
      setState(() {
        bytes = response.bodyBytes;
      });
      return true;
    } catch (e) {
      if (e is http.ClientException && e.message == 'XMLHttpRequest error.') {
        setState(() {
          hasError = true;
        });
        return false;
      } else {
        debugPrint(e.toString());
      }
    }
    return true;
  }
}

