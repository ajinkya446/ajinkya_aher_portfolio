import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCard extends StatelessWidget {
  final String label;
  final String description;
  final ThemeData themeValue;

  const InfoCard({super.key, required this.label, required this.description, required this.themeValue});

  @override
  Widget build(BuildContext context) {
    final isDark = themeValue.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F0F0F) : Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.05)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.orange, letterSpacing: -1),
          ),
          const SizedBox(height: 8),
          Text(
            description.toUpperCase(), 
            style: GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.bold, color: isDark ? Colors.grey.shade600 : Colors.black38, letterSpacing: 1),
          ),
        ],
      ),
    );
  }
}
