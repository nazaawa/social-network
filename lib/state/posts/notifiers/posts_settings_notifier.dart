import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/post_settings/models/post_settings.dart';

class PostSettingNotifier extends StateNotifier<Map<PostSettings, bool>> {
  PostSettingNotifier()
      : super(
          UnmodifiableMapView(
            {
              for (final setting in PostSettings.values) setting: true,
            },
          ),
        );

  void setSettings(PostSettings settings, bool value) {
    final existingValue = state[settings];

    if (existingValue == value || existingValue == value) {
      return;
    }
    state = Map.unmodifiable(
      Map.from(state)..[settings] = value,
    );
  }
}
