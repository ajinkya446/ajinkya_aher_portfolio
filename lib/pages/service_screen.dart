import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';
import '../widgets/service_card.dart';
import '../widgets/fade_in_slide.dart';

class ServicesSection extends StatelessWidget {
  final dynamic themeValue;

  const ServicesSection({super.key, this.themeValue});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;
    final isDark = themeValue.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: (screenWidth * 0.08).clamp(24.0, 120.0),
        vertical: isMobile ? 80 : 120,
      ),
      color: isDark ? const Color(0xFF080808) : const Color(0xFFF8F9FA),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInSlide(
            child: Row(
              children: [
                Container(width: 32, height: 1, color: Colors.orange),
                const SizedBox(width: 16),
                Text(
                  'SERVICES',
                  style: GoogleFonts.montserrat(
                    fontSize: 11,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          FadeInSlide(
            delay: Duration(milliseconds: 200),
            child: Text(
              'Technical Expertise.',
              style: GoogleFonts.montserrat(
                fontSize: isMobile ? 28 : 40,
                fontWeight: FontWeight.w900,
                color: isDark ? Colors.white : Colors.black,
                letterSpacing: -1,
              ),
            ),
          ),
          const SizedBox(height: 60),
          Center(
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: List.generate(serviceList.length, (index) {
                return FadeInSlide(
                  delay: Duration(milliseconds: 300 + (index * 100)),
                  direction: 0.5,
                  child: ServiceCard(
                    serviceContent: serviceList[index],
                    themeValue: themeValue,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
