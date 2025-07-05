import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCard extends StatelessWidget {
  final String label;
  final String description;
  final themeValue;

  const InfoCard({super.key, required this.label, required this.description, this.themeValue});

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.of(context).textScaleFactor;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: themeValue.brightness == Brightness.light ? Colors.black12 : Colors.grey.shade900, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: GoogleFonts.montserrat(fontSize: 24 * scale, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          Text(description, style: GoogleFonts.montserrat(fontSize: 14 * scale, color: themeValue.brightness == Brightness.light ? Colors.black45 : Colors.grey.shade300)),
        ],
      ),
    );
  }
}
