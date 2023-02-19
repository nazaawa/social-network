import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart' as material
    show Image, ImageConfiguration, ImageStreamListener;
import 'package:instagram_clone/state/image_upload/extensions/get_image_aspect_ratio.dart';

extension GetImageAspectRation on Uint8List {
  Future<double> getAspectRatio() {
    final image = material.Image.memory(this);
    return image.getAspectRatio();
  }
}
