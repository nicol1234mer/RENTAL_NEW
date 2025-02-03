import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rental_crates1/auth/main_page.dart';
import 'package:rental_crates1/auth/pages/botnav.dart';
import 'package:rental_crates1/botnavicon/cart.dart';
import 'package:rental_crates1/botnavicon/profile.dart';
import 'package:rental_crates1/botnavicon/store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDRXr5aYRjO1nF3aqGZ2PVkh4i0TntCOPg",
            authDomain: "rental-shit.firebaseapp.com",
            projectId: "rental-shit",
            storageBucket: "rental-shit.firebasestorage.app",
            messagingSenderId: "174431162482",
            appId: "1:174431162482:web:f84ba1d096f4b07d1632eb"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RENTAL CRATES',
      home: MainPage(),
    );
  }
}
