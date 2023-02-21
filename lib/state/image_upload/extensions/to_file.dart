import 'dart:io';

import 'package:image_picker/image_picker.dart';


// conversing the future of xFile to a future of a file

extension ToFile on Future<XFile?> {
  Future<File?> toFile() => then((xFile) => xFile!.path).then(
        // ignore: unnecessary_null_comparison
        (filepath) => filepath != null ? File(filepath) : null,
      );
}
