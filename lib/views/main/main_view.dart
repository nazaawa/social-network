import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/auth/providers/auth_state_provider.dart';
import 'package:instagram_clone/views/component/dialogs/logout_dialog.dart';
import 'package:instagram_clone/views/component/dialogs/alert_dialog_model.dart';
import 'package:instagram_clone/views/create_new_post/create_new_post_view.dart';
import 'package:instagram_clone/views/tabs/users_pots/user_posts_view.dart';

import '../../state/image_upload/helpers/image_picker_helper.dart';
import '../../state/image_upload/models/file_type.dart';
import '../../state/post_settings/providers/post_settings_provider.dart';
import '../constants/strings.dart';

class MainView extends StatefulHookConsumerWidget {
  const MainView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            Strings.appName,
          ),
          actions: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.film),
              onPressed: () async {
                final videoFile =
                    await ImagePickerHelper.pickVideoFromGallery();
                if (videoFile == null) {
                  return;
                }
                ref.refresh(postSettingProvider);
                // go to the screen to create a new post
                if (!mounted) {
                  return;
                }
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CreateNewPostView(
                      fileType: FileType.video,
                      fileToPost: videoFile,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.add_photo_alternate_outlined,
              ),
              onPressed: () async {
                final imageFile =
                    await ImagePickerHelper.pickImageFromGallery();
                if (imageFile == null) {
                  return;
                }
                ref.refresh(postSettingProvider);
                // go to the screen to create a new post
                if (!mounted) {
                  return;
                }
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CreateNewPostView(
                      fileType: FileType.image,
                      fileToPost: imageFile,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.logout,
              ),
              onPressed: () async {
                final shouldLogOut = await const LogoutDialog()
                    .present(context)
                    .then((value) => value ?? false);
                if (shouldLogOut) {
                  await ref.read(authStateProvider.notifier).logOut();
                }
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.person),
              ),
              Tab(
                icon: Icon(Icons.search),
              ),
              Tab(
                icon: Icon(Icons.home),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UserPostsView(),
            UserPostsView(),
            UserPostsView(),
          ],
        ),
      ),
    );
  }
}
