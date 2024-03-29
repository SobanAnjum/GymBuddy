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
    apiKey: 'AIzaSyAC_MCwQMj1Y7SFJWuv7IxqgEl_QOeYgOU',
    appId: '1:838242850038:web:b4b0aa0689fbc6a57c48d7',
    messagingSenderId: '838242850038',
    projectId: 'gymbuddy-4baca',
    authDomain: 'gymbuddy-4baca.firebaseapp.com',
    storageBucket: 'gymbuddy-4baca.appspot.com',
    measurementId: 'G-RJDD1WC4LB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfxqp6uAQ_L6dCP9r1QxtuXzfppsxqc5o',
    appId: '1:838242850038:android:7242f8c4a20212d47c48d7',
    messagingSenderId: '838242850038',
    projectId: 'gymbuddy-4baca',
    storageBucket: 'gymbuddy-4baca.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCnzT-DsQwld9PvAYic_O8VVJAgOsWxDV8',
    appId: '1:838242850038:ios:7506ef1bf6b503f47c48d7',
    messagingSenderId: '838242850038',
    projectId: 'gymbuddy-4baca',
    storageBucket: 'gymbuddy-4baca.appspot.com',
    iosBundleId: 'com.example.myTrainer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCnzT-DsQwld9PvAYic_O8VVJAgOsWxDV8',
    appId: '1:838242850038:ios:096a4a048044c3577c48d7',
    messagingSenderId: '838242850038',
    projectId: 'gymbuddy-4baca',
    storageBucket: 'gymbuddy-4baca.appspot.com',
    iosBundleId: 'com.example.myTrainer.RunnerTests',
  );
}
