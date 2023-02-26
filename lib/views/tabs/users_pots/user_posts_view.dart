import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/posts/providers/user_posts_provider.dart';
import 'package:instagram_clone/views/component/animations/loading_animation_view.dart';
import 'package:instagram_clone/views/component/post/post_grid_view.dart';

import '../../component/animations/empty_contents_with_text_animation_view.dart';
import '../../component/animations/error_animation_view.dart';
import '../../constants/strings.dart';

class UserPostsView extends ConsumerWidget {
  const UserPostsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(userPostsProvider);
    return RefreshIndicator(
      onRefresh: () {
        ref.refresh(userPostsProvider);
        return Future.delayed(const Duration(seconds: 1));
      },
      child: posts.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const EmptyContentsWithTextAnimationView(
              text: Strings.youHaveNoPosts,
            );
          } else {
            return PostGridView(
              posts: posts,
            );
          }
        },
        error: (error, stackTack) {
          print(stackTack);
          return const ErrorAnimationView();
        },
        loading: () {
          return const LoadingAnimationView();
        },
      ),
    );
  }
}
