import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';
import '../widgets/service_card.dart';

class ServicesSection extends StatelessWidget {
  final dynamic themeValue;

  const ServicesSection({super.key, this.themeValue});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    final isDark = themeValue.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 120, vertical: 120),
      color: isDark ? const Color(0xFF080808) : const Color(0xFFF8F9FA),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 32, height: 1, color: Colors.orange),
              const SizedBox(width: 16),
              Text(
                'SERVICES',
                style: GoogleFonts.montserrat(
                  fontSize: 40,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),

          const SizedBox(height: 80),
          Center(
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: serviceList
                  .map((service) => ServiceCard(
                        serviceContent: service,
                        themeValue: themeValue,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
