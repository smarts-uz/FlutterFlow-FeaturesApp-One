import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDn-PF6rEn3m0WqIJKExfIjggiahlRUdts",
            authDomain: "flutterflow-featuresapp-73161.firebaseapp.com",
            projectId: "flutterflow-featuresapp-73161",
            storageBucket: "flutterflow-featuresapp-73161.appspot.com",
            messagingSenderId: "755570692737",
            appId: "1:755570692737:web:9158ca064f8f30b6eeb380",
            measurementId: "G-DRHYTH4ZVV"));
  } else {
    await Firebase.initializeApp();
  }
}
