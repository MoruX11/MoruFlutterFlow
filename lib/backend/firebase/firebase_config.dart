import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAxyi2ADxuh7Goq9p_dy5nJ56jl9AzpDAg",
            authDomain: "mooru-e7uk4u.firebaseapp.com",
            projectId: "mooru-e7uk4u",
            storageBucket: "mooru-e7uk4u.appspot.com",
            messagingSenderId: "507991633027",
            appId: "1:507991633027:web:b039097154a238ac187fb6",
            measurementId: "G-CPEZLBTJR0"));
  } else {
    await Firebase.initializeApp();
  }
}
