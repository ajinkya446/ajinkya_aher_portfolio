import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils.dart';
import '../widgets/fade_in_slide.dart';

class AboutMeSection extends StatelessWidget {
  final dynamic themeValue;

  const AboutMeSection({super.key, this.themeValue});

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
      color: isDark ? const Color(0xFF080808) : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInSlide(
            child: Row(
              children: [
                Container(width: 32, height: 1, color: Colors.orange),
                const SizedBox(width: 16),
                Text(
                  'WHO I AM',
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
          isMobile
              ? Column(
                  children: [
                    FadeInSlide(delay: Duration(milliseconds: 200), child: _buildDescription(isDark, isMobile)),
                    const SizedBox(height: 80),
                    FadeInSlide(delay: Duration(milliseconds: 400), direction: 0.0, child: _buildProfileVisual(isDark, screenWidth * 0.8)),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: FadeInSlide(delay: Duration(milliseconds: 200), child: _buildDescription(isDark, isMobile))),
                    const SizedBox(width: 80),
                    Expanded(flex: 2, child: FadeInSlide(delay: Duration(milliseconds: 400), direction: 0.0, child: _buildProfileVisual(isDark, screenWidth * 0.3))),
                  ],
                ),
          const SizedBox(height: 100),
          _buildSkillsGrid(isDark, screenWidth),
        ],
      ),
    );
  }

  Widget _buildDescription(bool isDark, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Engineering Scalable Mobile Ecosystems with Precision.',
          style: GoogleFonts.montserrat(
            fontSize: isMobile ? 28 : 36,
            fontWeight: FontWeight.w900,
            height: 1.1,
            color: isDark ? Colors.white : Colors.black,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          "I am a Senior Mobile Developer with over 5 years of specialized experience in building high-performance, cross-platform ecosystems. My expertise lies at the intersection of Flutter's flexibility and Native performance (Kotlin/Swift).",
          style: GoogleFonts.montserrat(
            fontSize: 15,
            height: 1.8,
            color: isDark ? Colors.grey.shade400 : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "From leading engineering teams at Winjit to delivering mission-critical modules at TATA ELXSI and ESDS, I focus on 'Clean Architecture' that isn't just a buzzword—it's a standard. I bridge the gap between Figma designs and technical reality.",
          style: GoogleFonts.montserrat(
            fontSize: 15,
            height: 1.8,
            color: isDark ? Colors.grey.shade400 : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 48),
        OutlinedButton(
          onPressed: () => Utils().downloadPDF(),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.orange, width: 1.5),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
            shape: const StadiumBorder(),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const FaIcon(FontAwesomeIcons.filePdf, size: 14, color: Colors.orange),
              const SizedBox(width: 12),
              Text(
                'CURRICULUM VITAE',
                style: GoogleFonts.montserrat(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileVisual(bool isDark, double size) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: size, maxHeight: size),
        decoration: BoxDecoration(
          color: const Color(0xFF121212),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/profile.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildSkillsGrid(bool isDark, double screenWidth) {
    final skills = [
      {"name": "FLUTTER / DART", "icon": FontAwesomeIcons.mobileScreenButton},
      {"name": "NATIVE KOTLIN", "icon": FontAwesomeIcons.code},
      {"name": "NATIVE SWIFT", "icon": FontAwesomeIcons.apple},
      {"name": "IOT / BLE / WI-FI", "icon": FontAwesomeIcons.wifi},
      {"name": "CLEAN ARCHITECTURE", "icon": FontAwesomeIcons.layerGroup},
      {"name": "FIREBASE / CLOUD", "icon": FontAwesomeIcons.fire},
      {"name": "REST API SYSTEMS", "icon": FontAwesomeIcons.networkWired},
      {"name": "TEAM LEADERSHIP", "icon": FontAwesomeIcons.usersGear},
    ];

    return Center(
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.center,
        children: List.generate(skills.length, (index) {
          return FadeInSlide(
            delay: Duration(milliseconds: 100 + (index * 50)),
            direction: 0.3,
            child: _buildSkillCard(skills[index], isDark, screenWidth),
          );
        }),
      ),
    );
  }

  Widget _buildSkillCard(Map<String, dynamic> skill, bool isDark, double screenWidth) {
    double cardWidth = (screenWidth < 600) 
        ? (screenWidth - 68) / 2
        : 160.0;

    return Container(
      width: cardWidth,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F0F0F) : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.05)),
      ),
      child: Column(
        children: [
          FaIcon(skill['icon'] as FaIconData, color: Colors.orange, size: 20),
          const SizedBox(height: 16),
          Text(
            skill['name'],
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
