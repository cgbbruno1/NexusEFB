import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform, kIsWeb;

/// Temporary Firebase baseline for CI validation only.
///
/// This file mirrors the FlutterFire CLI shape so `flutter analyze` and build
/// validation can run without production Firebase credentials. Replace these
/// placeholder values with real project configuration in a dedicated setup
/// sprint.
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
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'temporary-web-api-key',
    appId: '1:1234567890:web:temporarybaseline',
    messagingSenderId: '1234567890',
    projectId: 'nexusefb-ci-baseline',
    authDomain: 'nexusefb-ci-baseline.firebaseapp.com',
    storageBucket: 'nexusefb-ci-baseline.firebasestorage.app',
    measurementId: 'G-TEMPBASELINE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'temporary-android-api-key',
    appId: '1:1234567890:android:temporarybaseline',
    messagingSenderId: '1234567890',
    projectId: 'nexusefb-ci-baseline',
    storageBucket: 'nexusefb-ci-baseline.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'temporary-ios-api-key',
    appId: '1:1234567890:ios:temporarybaseline',
    messagingSenderId: '1234567890',
    projectId: 'nexusefb-ci-baseline',
    storageBucket: 'nexusefb-ci-baseline.firebasestorage.app',
    iosBundleId: 'com.apps4av.avarex',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'temporary-macos-api-key',
    appId: '1:1234567890:macos:temporarybaseline',
    messagingSenderId: '1234567890',
    projectId: 'nexusefb-ci-baseline',
    storageBucket: 'nexusefb-ci-baseline.firebasestorage.app',
    iosBundleId: 'com.apps4av.avarex',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'temporary-windows-api-key',
    appId: '1:1234567890:windows:temporarybaseline',
    messagingSenderId: '1234567890',
    projectId: 'nexusefb-ci-baseline',
    storageBucket: 'nexusefb-ci-baseline.firebasestorage.app',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'temporary-linux-api-key',
    appId: '1:1234567890:linux:temporarybaseline',
    messagingSenderId: '1234567890',
    projectId: 'nexusefb-ci-baseline',
    storageBucket: 'nexusefb-ci-baseline.firebasestorage.app',
  );
}
