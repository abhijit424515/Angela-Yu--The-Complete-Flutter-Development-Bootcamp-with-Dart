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
    apiKey: 'AIzaSyDcnv0-kqntekkOUHMNigcMcBKUzUm-aks',
    appId: '1:138884733616:web:ec242f2f732a9035473975',
    messagingSenderId: '138884733616',
    projectId: 'todoey-df313',
    authDomain: 'todoey-df313.firebaseapp.com',
    storageBucket: 'todoey-df313.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdul1VM5LKXDnt3BGpGdlW6YC4FyqA8eQ',
    appId: '1:138884733616:android:03ba7afcbdad5bec473975',
    messagingSenderId: '138884733616',
    projectId: 'todoey-df313',
    storageBucket: 'todoey-df313.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQu-jt4c190Z7cA7pyyDOAYoNQ21GlT60',
    appId: '1:138884733616:ios:803453cb29de0258473975',
    messagingSenderId: '138884733616',
    projectId: 'todoey-df313',
    storageBucket: 'todoey-df313.appspot.com',
    iosClientId: '138884733616-nmjtc8moabheikbantpi06kej24ham2r.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoey',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDQu-jt4c190Z7cA7pyyDOAYoNQ21GlT60',
    appId: '1:138884733616:ios:803453cb29de0258473975',
    messagingSenderId: '138884733616',
    projectId: 'todoey-df313',
    storageBucket: 'todoey-df313.appspot.com',
    iosClientId: '138884733616-nmjtc8moabheikbantpi06kej24ham2r.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoey',
  );
}