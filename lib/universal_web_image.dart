library universal_web_image;

import 'dart:typed_data';

import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;

import 'package:universal_web_image/web_image/web_image.dart'
if (dart.library.js) 'package:universal_web_image/web_image/web_image_web.dart';

class UniversalWebImage extends StatefulWidget {
  const UniversalWebImage({
    super.key,
    required this.imageUrl,
    this.width = 100,
    this.height = 100,
    this.customImageBuilder,
  });

  final String imageUrl;

  final double width;

  final double height;

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
    if (bytes == null && !hasError) {
      _bytes();
      return const Text('loading');
    }
    if (hasError) {
      debugPrint('Image ${widget.imageUrl} cannot be drawn by Flutter canvas renderer.');
    }
    return webImage(
      context: context,
      bytes: hasError ? null : bytes,
      imageUrl: widget.imageUrl,
      width: widget.width,
      height: widget.height,
      builder: hasError ? null : widget.customImageBuilder,
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

