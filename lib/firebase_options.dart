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
    apiKey: 'AIzaSyCA_6NX35OJVwcLtZoIcW4TJQRYx84A08g',
    appId: '1:648563727732:web:2eace41cb2c6892da02021',
    messagingSenderId: '648563727732',
    projectId: 'drembaufresh-1101b',
    authDomain: 'drembaufresh-1101b.firebaseapp.com',
    storageBucket: 'drembaufresh-1101b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLzZORz0Z-PSZtCOydkYQl1cnOQxei_AA',
    appId: '1:648563727732:android:2f3fb555c78931dea02021',
    messagingSenderId: '648563727732',
    projectId: 'drembaufresh-1101b',
    storageBucket: 'drembaufresh-1101b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCAcGTkfhmo3oJn3YuxZsuZwJW072twpz8',
    appId: '1:648563727732:ios:c1bd00474c0186a7a02021',
    messagingSenderId: '648563727732',
    projectId: 'drembaufresh-1101b',
    storageBucket: 'drembaufresh-1101b.appspot.com',
    iosClientId: '648563727732-dctved65cn2qc5c12sk6mck2d0ggd3nt.apps.googleusercontent.com',
    iosBundleId: 'com.drembaufresh.drembaufresh',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCAcGTkfhmo3oJn3YuxZsuZwJW072twpz8',
    appId: '1:648563727732:ios:c1bd00474c0186a7a02021',
    messagingSenderId: '648563727732',
    projectId: 'drembaufresh-1101b',
    storageBucket: 'drembaufresh-1101b.appspot.com',
    iosClientId: '648563727732-dctved65cn2qc5c12sk6mck2d0ggd3nt.apps.googleusercontent.com',
    iosBundleId: 'com.drembaufresh.drembaufresh',
  );
}
