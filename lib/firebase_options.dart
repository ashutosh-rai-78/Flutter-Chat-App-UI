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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAyrQSstZAqmUwYutrHbdYdFasclVTp07o',
    appId: '1:789911718173:web:7a5e2bc622199b28c0f9f4',
    messagingSenderId: '789911718173',
    projectId: 'login-app-update',
    authDomain: 'login-app-update.firebaseapp.com',
    databaseURL: 'https://login-app-update.firebaseio.com',
    storageBucket: 'login-app-update.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7R32_dVCMpgTQP6kNSKF3ubiNgEQNR8U',
    appId: '1:789911718173:android:7354b2a5ab503b8fc0f9f4',
    messagingSenderId: '789911718173',
    projectId: 'login-app-update',
    databaseURL: 'https://login-app-update.firebaseio.com',
    storageBucket: 'login-app-update.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCuJ108LGr19A9QpdXxxaoBft3pB37HB30',
    appId: '1:789911718173:ios:0f6a17c8d1d1c8ecc0f9f4',
    messagingSenderId: '789911718173',
    projectId: 'login-app-update',
    databaseURL: 'https://login-app-update.firebaseio.com',
    storageBucket: 'login-app-update.appspot.com',
    androidClientId: '789911718173-3imjg4rtqhveq5rq0s6ai93fhvm148ig.apps.googleusercontent.com',
    iosClientId: '789911718173-9lrg3o822gm286cmn0o6if8vkm28e783.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterChatAppUi',
  );
}
