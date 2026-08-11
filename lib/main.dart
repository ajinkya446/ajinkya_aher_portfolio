import 'package:ajinkya_aher_portfolio/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ValueNotifier<ThemeData> themeNotifier = ValueNotifier(darkTheme);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFF8F9FA),
  primaryColor: Colors.orange,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.orange,
    brightness: Brightness.light,
  ).copyWith(
    surface: Colors.white,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF080808), 
  primaryColor: Colors.orange,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF080808),
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.orange,
    brightness: Brightness.dark,
  ).copyWith(
    surface: const Color(0xFF121212),
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBKH3GkQA32_VywMyyVoACw9gUcpQos_hU',
          authDomain: 'ajinkya-portfolio-68be0.firebaseapp.com',
          projectId: 'ajinkya-portfolio-68be0',
          storageBucket: 'ajinkya-portfolio-68be0.firebasestorage.app',
          messagingSenderId: '798199344423',
          appId: '1:798199344423:web:53a04201cd890f78584d02'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeData>(
      valueListenable: themeNotifier,
      builder: (_, ThemeData currentTheme, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ajinkya Portfolio',
          theme: currentTheme,
          home: const HomePage(),
        );
      },
    );
  }
}
