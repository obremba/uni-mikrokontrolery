// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyC7YFQpdNBZ5uYmLY5kDHbBf5jIAIfJVFE',
    appId: '1:1031285812482:web:0550a88d1d20ea45ade61b',
    messagingSenderId: '1031285812482',
    projectId: 'mikrokontrolery-2cb28',
    authDomain: 'mikrokontrolery-2cb28.firebaseapp.com',
    storageBucket: 'mikrokontrolery-2cb28.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5PLSq21d_2ZqRyy48aOhYIzAIw2qMfMg',
    appId: '1:1031285812482:android:3cc206f8aafd7695ade61b',
    messagingSenderId: '1031285812482',
    projectId: 'mikrokontrolery-2cb28',
    storageBucket: 'mikrokontrolery-2cb28.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWBUmTO4_HSFthndJ1cSIiPV5i3fadrOY',
    appId: '1:1031285812482:ios:6e28a0577a8728beade61b',
    messagingSenderId: '1031285812482',
    projectId: 'mikrokontrolery-2cb28',
    storageBucket: 'mikrokontrolery-2cb28.appspot.com',
    iosClientId: '1031285812482-vb7guhjv05k2hgg9imid6soj5msb17rr.apps.googleusercontent.com',
    iosBundleId: 'com.example.pushApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAWBUmTO4_HSFthndJ1cSIiPV5i3fadrOY',
    appId: '1:1031285812482:ios:6e28a0577a8728beade61b',
    messagingSenderId: '1031285812482',
    projectId: 'mikrokontrolery-2cb28',
    storageBucket: 'mikrokontrolery-2cb28.appspot.com',
    iosClientId: '1031285812482-vb7guhjv05k2hgg9imid6soj5msb17rr.apps.googleusercontent.com',
    iosBundleId: 'com.example.pushApp',
  );
}
