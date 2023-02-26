import 'package:flutter/material.dart';
import 'package:instagram_clone/views/component/post/post_thumbnail_view.dart';

import '../../../state/posts/models/post.dart';

class PostGridView extends StatelessWidget {
  final Iterable<Post> posts;
  const PostGridView({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        final post = posts.elementAt(index);

        return PostThumbnailView(
          post: post,
          onTapped: () {},
        );
      },
    );
  }
}
