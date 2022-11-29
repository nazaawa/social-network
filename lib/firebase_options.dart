// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAxziJx7N3nRyXRtn8PKCwsXQ5husGL_L4',
    appId: '1:13288384072:web:43c724ae810f08af51da7d',
    messagingSenderId: '13288384072',
    projectId: 'exampleappli',
    authDomain: 'exampleappli.firebaseapp.com',
    storageBucket: 'exampleappli.appspot.com',
    measurementId: 'G-L9N9Y65036',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUlBMJEVMQJaoaGWTcOEC3qq9o6yKenPk',
    appId: '1:13288384072:android:f6f9073334ffa19351da7d',
    messagingSenderId: '13288384072',
    projectId: 'exampleappli',
    storageBucket: 'exampleappli.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDT2UMarOU2BCJnGOhLYU_cGUkJ7lluMx8',
    appId: '1:13288384072:ios:5ffc49e82655777351da7d',
    messagingSenderId: '13288384072',
    projectId: 'exampleappli',
    storageBucket: 'exampleappli.appspot.com',
    iosClientId: '13288384072-qoq29prekoh8a7kii3h0v9h0h6ftrjf2.apps.googleusercontent.com',
    iosBundleId: 'se.essika.instagramClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDT2UMarOU2BCJnGOhLYU_cGUkJ7lluMx8',
    appId: '1:13288384072:ios:5ffc49e82655777351da7d',
    messagingSenderId: '13288384072',
    projectId: 'exampleappli',
    storageBucket: 'exampleappli.appspot.com',
    iosClientId: '13288384072-qoq29prekoh8a7kii3h0v9h0h6ftrjf2.apps.googleusercontent.com',
    iosBundleId: 'se.essika.instagramClone',
  );
}