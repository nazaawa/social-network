import 'package:flutter/material.dart';

@immutable
class ImageWIthAspectRatio {
  final Image image;
  final double aspectRatio;
  const ImageWIthAspectRatio({
    required this.image,
    required this.aspectRatio,
  });
}
