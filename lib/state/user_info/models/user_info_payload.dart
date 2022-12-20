import 'dart:collection';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../../constants/firebase_field_name.dart';
import '../../posts/typedefs/user_id.dart';

@immutable
class UserInfoPayload extends MapView<String, String> {
  UserInfoPayload({
    required UserId userId,
    required String? displayName,
    required String? email,
  }) : super({
          FirebaseFieldName.userId: userId,
          FirebaseFieldName.displayName: displayName ?? '',
          FirebaseFieldName.email: email ?? '',
        });
}