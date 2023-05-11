import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCa54ahvXirXMcM1Nu4GtaxbaPF1F_89eQ",
            authDomain: "shopping-companion-87d87.firebaseapp.com",
            projectId: "shopping-companion-87d87",
            storageBucket: "shopping-companion-87d87.appspot.com",
            messagingSenderId: "1052161093794",
            appId: "1:1052161093794:web:b77440c1bea5542caa27fb",
            measurementId: "G-6EJSLRLHS9"));
  } else {
    await Firebase.initializeApp();
  }
}
