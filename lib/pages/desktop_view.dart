import 'package:web/web.dart' as web;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../pages/contact_me_section.dart';
import '../pages/experience_section.dart';
import '../pages/project_section.dart';
import '../pages/service_screen.dart';
import '../widgets/nav_items.dart';
import 'about_me_screen.dart';

final GlobalKey homeKey = GlobalKey();
final GlobalKey servicesKey = GlobalKey();
final GlobalKey experienceKey = GlobalKey();
final GlobalKey projectKey = GlobalKey();
final GlobalKey aboutKey = GlobalKey();
final GlobalKey contactKey = GlobalKey();

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: const Duration(milliseconds: 800), curve: Curves.easeInOutCubic);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double scale = screenWidth / 1440;
    scale = scale.clamp(0.8, 1.1);

    return ValueListenableBuilder(
        valueListenable: themeNotifier,
        builder: (themeCtx, themeValue, child) {
          final isDark = themeValue.brightness == Brightness.dark;
          return Scaffold(
            backgroundColor: themeValue.scaffoldBackgroundColor,
            appBar: AppBar(
              toolbarHeight: 90,
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.05))),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  children: [
                    Text('AA.', style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: -1, color: Colors.orange)),
                    const Spacer(),
                    NavBarItem(title: 'HOME', onTap: () => _scrollToSection(homeKey), themeValue: themeValue),
                    NavBarItem(title: 'EXPERIENCE', onTap: () => _scrollToSection(experienceKey), themeValue: themeValue),
                    NavBarItem(title: 'PROJECTS', onTap: () => _scrollToSection(projectKey), themeValue: themeValue),
                    NavBarItem(title: 'SERVICES', onTap: () => _scrollToSection(servicesKey), themeValue: themeValue),
                    NavBarItem(title: 'ABOUT', onTap: () => _scrollToSection(aboutKey), themeValue: themeValue),
                    const SizedBox(width: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 22),
                        shape: const StadiumBorder(),
                        elevation: 0,
                      ),
                      onPressed: () => _scrollToSection(contactKey),
                      child: Text('LET\'S TALK', style: GoogleFonts.montserrat(fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.orange,
              mini: true,
              shape: const CircleBorder(),
              onPressed: () {
                themeNotifier.value = isDark ? lightTheme : darkTheme;
              },
              child: Icon(isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined, color: Colors.white, size: 18),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // Minimalist Hero
                  SizedBox(
                    key: homeKey,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height - 90,
                    child: Stack(
                      children: [
                        Positioned.fill(child: CustomPaint(painter: GridPainter(isDark: isDark))),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 120),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildModernHeroInfo(scale, isDark),
                            ],
                          ),
                        ),
                        
                        // Refined Visual Element
                        Positioned(
                          right: 120,
                          top: 0,
                          bottom: 0,
                          child: Center(child: _buildModernHeroVisual(isDark)),
                        ),
                      ],
                    ),
                  ),

                  ExperienceSection(themeValue: themeValue, key: experienceKey),
                  ProjectSection(themeValue: themeValue, key: projectKey),
                  ServicesSection(themeValue: themeValue, key: servicesKey),
                  AboutMeSection(themeValue: themeValue, key: aboutKey),
                  ContactPage(themeValue: themeValue, key: contactKey),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildModernHeroInfo(double scale, bool isDark) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('SENIOR FLUTTER DEVELOPER', style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orange, letterSpacing: 4)),
          const SizedBox(height: 32),
          RichText(
            text: TextSpan(
              style: GoogleFonts.montserrat(fontSize: 90 * scale, fontWeight: FontWeight.w900, height: 1.0, color: isDark ? Colors.white : Colors.black, letterSpacing: -4),
              children: [
                const TextSpan(text: 'CRAFTING\n'),
                TextSpan(text: 'DYNAMICS.', style: TextStyle(color: Colors.orange.withValues(alpha: 0.9))),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'AJINKYA AHER — Specialized in engineering high-stability mobile ecosystems with a focus on IoT provisioning and Clean Architecture.',
            style: GoogleFonts.montserrat(fontSize: 16 * scale, color: isDark ? Colors.grey.shade500 : Colors.black54, height: 1.8, fontWeight: FontWeight.w500, letterSpacing: 0.2),
          ),
          const SizedBox(height: 60),
          Row(
            children: [
              _socialIcon(FontAwesomeIcons.linkedinIn, 'https://www.linkedin.com/in/ajinkya-aher-34b012348/', isDark),
              _socialIcon(FontAwesomeIcons.github, 'https://github.com/ajinkya446', isDark),
              _socialIcon(FontAwesomeIcons.instagram, 'https://www.instagram.com/forever__undefeated/', isDark),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildModernHeroVisual(bool isDark) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 380,
          height: 380,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange.withValues(alpha: 0.1), width: 1),
          ),
        ),
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(4),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset('assets/profile.png', fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: -20,
          right: -20,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.orange.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  Widget _socialIcon(FaIconData icon, String url, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: IconButton(
        onPressed: () => web.window.open(url, '_blank'),
        icon: FaIcon(icon, size: 18),
        color: isDark ? Colors.grey.shade700 : Colors.black38,
        hoverColor: Colors.orange,
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  final bool isDark;
  GridPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = (isDark ? Colors.white : Colors.black).withValues(alpha: 0.02)
      ..strokeWidth = 1;

    const step = 60.0;
    for (double i = 0; i < size.width; i += step) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += step) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
