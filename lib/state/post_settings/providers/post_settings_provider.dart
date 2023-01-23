import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/posts/notifiers/posts_settings_notifier.dart';

import '../models/post_settings.dart';

final postSettingProvider =
    StateNotifierProvider<PostSettingNotifier, Map<PostSettings, bool>>(
        (ref) => PostSettingNotifier());
