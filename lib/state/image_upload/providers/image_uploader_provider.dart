import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/image_upload/typedefs/is_loading.dart';

import '../notifiers/image_upload_notifier.dart';

final imageUploadProvider =
    StateNotifierProvider<ImageUploadNotifier, IsLoading>(
  (ref) => ImageUploadNotifier(),
);
 