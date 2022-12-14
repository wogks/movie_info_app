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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANqD-p_BCbPOXCUfys_u9Te0EPIr9ntuk',
    appId: '1:760703953577:android:fa9cd491f7d748876717b8',
    messagingSenderId: '760703953577',
    projectId: 'test-912ee',
    storageBucket: 'test-912ee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD28ph2bp5igQcFe9kra9u043xrEL7pYdw',
    appId: '1:760703953577:ios:cc2e285e4bca39fa6717b8',
    messagingSenderId: '760703953577',
    projectId: 'test-912ee',
    storageBucket: 'test-912ee.appspot.com',
    androidClientId: '760703953577-ekom4dhvkv8futu79lqa4pc4qq80cd5p.apps.googleusercontent.com',
    iosClientId: '760703953577-3g2pco1nr1en6foh2f1okv3oovp2filq.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieApp',
  );
}
