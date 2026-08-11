import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final ThemeData themeValue;

  const NavBarItem({super.key, required this.title, this.onTap, required this.themeValue});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: GoogleFonts.montserrat(fontSize: 16, color: themeValue.brightness == Brightness.light ? Colors.black : Colors.white, fontWeight: FontWeight.w400),
      ),
    );
  }
}
