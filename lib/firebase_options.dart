// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBwRTQLBwHoYG22lcFJpSk_4dQLNRBaTak',
    appId: '1:7529257453:web:a258eb1e6116ceadff6fe4',
    messagingSenderId: '7529257453',
    projectId: 'hrm-project-f4310',
    authDomain: 'hrm-project-f4310.firebaseapp.com',
    storageBucket: 'hrm-project-f4310.appspot.com',
    measurementId: 'G-45YVV4NWG8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiCSIOBhE_Wn6ZrK1eLa7nX8OoHdZzYaY',
    appId: '1:7529257453:android:e470c97645e5468fff6fe4',
    messagingSenderId: '7529257453',
    projectId: 'hrm-project-f4310',
    storageBucket: 'hrm-project-f4310.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4Ea8868zPGPJ7cgshXOg8LMKb6Qg3cRE',
    appId: '1:7529257453:ios:74026007922d18b4ff6fe4',
    messagingSenderId: '7529257453',
    projectId: 'hrm-project-f4310',
    storageBucket: 'hrm-project-f4310.appspot.com',
    iosBundleId: 'com.example.hrmProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC4Ea8868zPGPJ7cgshXOg8LMKb6Qg3cRE',
    appId: '1:7529257453:ios:74026007922d18b4ff6fe4',
    messagingSenderId: '7529257453',
    projectId: 'hrm-project-f4310',
    storageBucket: 'hrm-project-f4310.appspot.com',
    iosBundleId: 'com.example.hrmProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBwRTQLBwHoYG22lcFJpSk_4dQLNRBaTak',
    appId: '1:7529257453:web:59de3f77dc84efd1ff6fe4',
    messagingSenderId: '7529257453',
    projectId: 'hrm-project-f4310',
    authDomain: 'hrm-project-f4310.firebaseapp.com',
    storageBucket: 'hrm-project-f4310.appspot.com',
    measurementId: 'G-SKK50YHWHQ',
  );
}
