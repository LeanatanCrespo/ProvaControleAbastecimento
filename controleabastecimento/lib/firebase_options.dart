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
    apiKey: 'AIzaSyCw-DRDkypoMec8iP2-AXTY7hiajL9pixs',
    appId: '1:378517268525:web:463aaf996b6d2f4479f0a4',
    messagingSenderId: '378517268525',
    projectId: 'controle-abastecimento-c463f',
    authDomain: 'controle-abastecimento-c463f.firebaseapp.com',
    storageBucket: 'controle-abastecimento-c463f.firebasestorage.app',
    measurementId: 'G-XQT8RL4K89',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfu2cZhbrmDawph04Yx1a_AIDCdeNWr1g',
    appId: '1:378517268525:android:cf877b7f116e4cd079f0a4',
    messagingSenderId: '378517268525',
    projectId: 'controle-abastecimento-c463f',
    storageBucket: 'controle-abastecimento-c463f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQy-_w_9Tg1zDjbDsGAQCEVfGTKLsSpmw',
    appId: '1:378517268525:ios:93db170ed0dabe6579f0a4',
    messagingSenderId: '378517268525',
    projectId: 'controle-abastecimento-c463f',
    storageBucket: 'controle-abastecimento-c463f.firebasestorage.app',
    iosBundleId: 'com.example.controleabastecimento',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBQy-_w_9Tg1zDjbDsGAQCEVfGTKLsSpmw',
    appId: '1:378517268525:ios:93db170ed0dabe6579f0a4',
    messagingSenderId: '378517268525',
    projectId: 'controle-abastecimento-c463f',
    storageBucket: 'controle-abastecimento-c463f.firebasestorage.app',
    iosBundleId: 'com.example.controleabastecimento',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCw-DRDkypoMec8iP2-AXTY7hiajL9pixs',
    appId: '1:378517268525:web:c036fa77eec558dd79f0a4',
    messagingSenderId: '378517268525',
    projectId: 'controle-abastecimento-c463f',
    authDomain: 'controle-abastecimento-c463f.firebaseapp.com',
    storageBucket: 'controle-abastecimento-c463f.firebasestorage.app',
    measurementId: 'G-FN4SZYLRG3',
  );

}