import 'package:ajinkya_aher_portfolio/widgets/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'Ajinkya Portfolio', theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black), home: const HomePage());
  }
}
