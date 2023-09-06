import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show kIsWeb; // Import this for web detection

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      return const FirebaseOptions(
        apiKey: 'AIzaSyChbhl7nwYlYkBmJeLiq_bdtlz9XsnioF0',
        appId: '1:824244449812:android:bf2fc683267cbec587ad01',
        messagingSenderId: '824244449812',
        projectId: 'e-commerce-app-feefe',
      );
    } else if (Platform.isIOS) {
      return const FirebaseOptions(
          appId: '1:824244449812:ios:4a42367d24c9a30787ad01',
          apiKey: 'AIzaSyAbOdIUNQ4AWocDfQdD6L8GrE-4Ai2C3dA',
          messagingSenderId: '824244449812',
          projectId: 'e-commerce-app-feefe',
          iosBundleId: 'com.example.eCommerceApp'
          // iOS options
          );
    } else {
      return const FirebaseOptions(
        apiKey: '1:824244449812:android:bf2fc683267cbec587ad01',
        appId: 'AIzaSyChbhl7nwYlYkBmJeLiq_bdtlz9XsnioF0',
        messagingSenderId: '824244449812',
        projectId: 'e-commerce-app-feefe',
        // Android options
      );
    }
  }
}
