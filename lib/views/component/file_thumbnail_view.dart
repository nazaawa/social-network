import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/image_upload/models/thumbnail_request.dart';
import 'package:instagram_clone/state/image_upload/providers/thumbnail_provider.dart';
import 'package:instagram_clone/views/component/animations/loading_animation_view.dart';
import 'package:instagram_clone/views/component/animations/smaill_error_animation.dart';

class FileThumbnailView extends ConsumerWidget {
  final ThumbnailRequest thumbnailRequest;
  const FileThumbnailView({
    super.key,
    required this.thumbnailRequest,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnail = ref.watch(thumbnailProvider(thumbnailRequest));
    return thumbnail.when(
        data: (imageWIthAspectRatio) {
          return AspectRatio(
            aspectRatio: imageWIthAspectRatio.aspectRatio,
            child: imageWIthAspectRatio.image,
          );
        },
        loading: () => const LoadingAnimationView(),
        error: (error, stackTrace) => const SmallErrorAnimationView());
  }
}
