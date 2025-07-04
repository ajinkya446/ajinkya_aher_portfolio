import 'package:ajinkya_aher_portfolio/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyBKH3GkQA32_VywMyyVoACw9gUcpQos_hU',
        authDomain: 'ajinkya-portfolio-68be0.firebaseapp.com',
        projectId: 'ajinkya-portfolio-68be0',
        storageBucket: 'ajinkya-portfolio-68be0.firebasestorage.app',
        messagingSenderId: '798199344423',
        appId: '1:798199344423:web:53a04201cd890f78584d02'),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'Ajinkya Portfolio', theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black), home: const HomePage());
  }
}
