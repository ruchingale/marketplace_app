// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'; // Added import for kIsWeb
import 'package:flutter/material.dart';

import 'loginpage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyD242Ccsjl4JQUQG0rIljtv45P8WMSBX9U",
        appId: "1:767156439811:web:bdeb7046c64030d6003736",
        messagingSenderId: "767156439811",
        projectId: "homemade-harvest-c9b3f",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterDemo',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
