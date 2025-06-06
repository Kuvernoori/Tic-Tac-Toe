// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// import 'firebase_options.dart';flutterfire configure
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
    apiKey: 'AIzaSyD61Lg3PsFEUoyHV90nhRmN0otZe1zKXFk',
    appId: '1:356017861010:web:9fce887f8c9d9dffc8914b',
    messagingSenderId: '356017861010',
    projectId: 'tictac-45488',
    authDomain: 'tictac-45488.firebaseapp.com',
    storageBucket: 'tictac-45488.firebasestorage.app',
    measurementId: 'G-BE2W58H95L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTop2gp3r9R468X49NMY8o-bXgQyqsOEE',
    appId: '1:356017861010:android:e667cf23c047edaac8914b',
    messagingSenderId: '356017861010',
    projectId: 'tictac-45488',
    storageBucket: 'tictac-45488.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKkk8s0M8ckOoQVKnz3P1reeR9oWAEBIo',
    appId: '1:356017861010:ios:400e400f7f2a5d21c8914b',
    messagingSenderId: '356017861010',
    projectId: 'tictac-45488',
    storageBucket: 'tictac-45488.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBKkk8s0M8ckOoQVKnz3P1reeR9oWAEBIo',
    appId: '1:356017861010:ios:400e400f7f2a5d21c8914b',
    messagingSenderId: '356017861010',
    projectId: 'tictac-45488',
    storageBucket: 'tictac-45488.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD61Lg3PsFEUoyHV90nhRmN0otZe1zKXFk',
    appId: '1:356017861010:web:7e1cb9b28ea335a5c8914b',
    messagingSenderId: '356017861010',
    projectId: 'tictac-45488',
    authDomain: 'tictac-45488.firebaseapp.com',
    storageBucket: 'tictac-45488.firebasestorage.app',
    measurementId: 'G-B6PEHS0V7F',
  );

}
// await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );