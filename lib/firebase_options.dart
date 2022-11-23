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
    apiKey: 'AIzaSyBSR9_USNtqFzram89LI4kz5g4Rk8ZsHFA',
    appId: '1:653999955179:web:fb7bb1eff731a7237372ae',
    messagingSenderId: '653999955179',
    projectId: 'coin-fdd2e',
    authDomain: 'coin-fdd2e.firebaseapp.com',
    storageBucket: 'coin-fdd2e.appspot.com',
    measurementId: 'G-VTRNL59P5K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbi_RU3OlcZZ-d0tWz5_ErKP9IL535ddA',
    appId: '1:653999955179:android:67c825a8006640087372ae',
    messagingSenderId: '653999955179',
    projectId: 'coin-fdd2e',
    storageBucket: 'coin-fdd2e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB3NkiP3SeiB6fQKkpHLkmMJdBovNbzpkw',
    appId: '1:653999955179:ios:e1397dc30b4cce837372ae',
    messagingSenderId: '653999955179',
    projectId: 'coin-fdd2e',
    storageBucket: 'coin-fdd2e.appspot.com',
    iosClientId: '653999955179-9atmdomhomc7u6tncqgrlufkhtsqpptj.apps.googleusercontent.com',
    iosBundleId: 'com.example.ninecoin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB3NkiP3SeiB6fQKkpHLkmMJdBovNbzpkw',
    appId: '1:653999955179:ios:e1397dc30b4cce837372ae',
    messagingSenderId: '653999955179',
    projectId: 'coin-fdd2e',
    storageBucket: 'coin-fdd2e.appspot.com',
    iosClientId: '653999955179-9atmdomhomc7u6tncqgrlufkhtsqpptj.apps.googleusercontent.com',
    iosBundleId: 'com.example.ninecoin',
  );
}