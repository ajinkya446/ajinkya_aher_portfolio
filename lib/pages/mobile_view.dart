import 'package:ajinkya_aher_portfolio/pages/project_section.dart';

import '../browser_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../pages/service_screen.dart';
import '../pages/experience_section.dart';
import '../utils.dart';
import '../widgets/fade_in_slide.dart';
import 'about_me_screen.dart';
import 'contact_me_section.dart';
import 'desktop_view.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> with SingleTickerProviderStateMixin {
  late AnimationController _drawerController;
  late Animation<Offset> _drawerAnimation;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _drawerController = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _drawerAnimation = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(CurvedAnimation(parent: _drawerController, curve: Curves.easeOutQuart));
    _drawerController.addListener(() {
      setState(() {});
    });
  }

  void toggleDrawer() {
    if (_drawerController.isDismissed) {
      _drawerController.forward();
    } else {
      _drawerController.reverse();
    }
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
    toggleDrawer();
  }

  @override
  void dispose() {
    _drawerController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
        valueListenable: themeNotifier,
        builder: (themeCtx, themeValue, child) {
          final isDark = themeValue.brightness == Brightness.dark;
          return Scaffold(
            backgroundColor: themeValue.scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: isDark ? Colors.black.withValues(alpha: 0.8) : Colors.white.withValues(alpha: 0.8),
              elevation: 0,
              centerTitle: false,
              title: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text('AA.', style: GoogleFonts.montserrat(fontSize: 20, color: Colors.orange, fontWeight: FontWeight.w900, letterSpacing: -1)),
              ),
              actions: [
                IconButton(
                  onPressed: toggleDrawer,
                  icon: FaIcon(FontAwesomeIcons.barsStaggered, color: isDark ? Colors.white : Colors.black, size: 18),
                ),
                const SizedBox(width: 8),
              ],
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      // Hero Section
                      Container(
                        key: homeKey,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInSlide(
                              direction: -1.0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withValues(alpha: 0.1),
                                  border: Border.all(color: Colors.orange.withValues(alpha: 0.2)),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text('AVAILABLE FOR HIRE', style: GoogleFonts.montserrat(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.orange, letterSpacing: 1)),
                              ),
                            ),
                            const SizedBox(height: 40),
                            FadeInSlide(
                              delay: const Duration(milliseconds: 200),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.montserrat(fontSize: 48, fontWeight: FontWeight.w900, height: 1.1, color: isDark ? Colors.white : Colors.black, letterSpacing: -2),
                                    children: [
                                      const TextSpan(text: 'ENGINEERING\n'),
                                      const TextSpan(text: 'DIGITAL ', style: TextStyle(color: Colors.orange)),
                                      const TextSpan(text: 'EXPERIENCES'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            FadeInSlide(
                              delay: const Duration(milliseconds: 400),
                              child: Text(
                                'Senior Flutter Developer specialized in architecting scalable, cross-platform mobile ecosystems.',
                                style: GoogleFonts.montserrat(fontSize: 15, color: isDark ? Colors.grey.shade400 : Colors.black54, height: 1.6, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(height: 48),
                            FadeInSlide(
                              delay: const Duration(milliseconds: 600),
                              direction: 0.0,
                              child: Center(
                                child: Container(
                                  width: 180,
                                  height: 180,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1A1A1A),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.orange.withValues(alpha: 0.2)),
                                  ),
                                  child: ClipOval(child: Image.asset('assets/profile.png', fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 60),
                            FadeInSlide(
                              delay: const Duration(milliseconds: 800),
                              child: Wrap(
                                spacing: 24,
                                runSpacing: 24,
                                children: [
                                  _mobileStat('05+', 'YEARS EXP'),
                                  _mobileStat('20+', 'PROJECTS'),
                                  _mobileStat('10K+', 'REPUTATION'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 48),
                            FadeInSlide(
                              delay: const Duration(milliseconds: 1000),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                                  shape: const StadiumBorder(),
                                  elevation: 0,
                                  minimumSize: const Size(double.infinity, 60),
                                ),
                                onPressed: () => Utils().launchEmail(),
                                child: Text('LET\'S TALK', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, letterSpacing: 1)),
                              ),
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

                // Modern Sidebar Drawer (Smaller and Staggered)
                if (_drawerController.value > 0)
                  GestureDetector(
                    onTap: toggleDrawer,
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.4),
                    ),
                  ),
                SlideTransition(
                  position: _drawerAnimation,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: screenWidth * 0.8 > 280 ? 280 : screenWidth * 0.8, 
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF0A0A0A) : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 40,
                            offset: const Offset(-20, 0),
                          ),
                        ],
                      ),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(24),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('AA.', style: GoogleFonts.montserrat(fontSize: 18, color: Colors.orange, fontWeight: FontWeight.w900, letterSpacing: -1)),
                                  IconButton(
                                    onPressed: toggleDrawer,
                                    icon: FaIcon(FontAwesomeIcons.xmark, color: isDark ? Colors.white38 : Colors.black38, size: 18),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _drawerItem('HOME', () => scrollToSection(homeKey), isDark, 0),
                                    _drawerItem('EXPERIENCE', () => scrollToSection(experienceKey), isDark, 1),
                                    _drawerItem('PROJECTS', () => scrollToSection(projectKey), isDark, 2),
                                    _drawerItem('SERVICES', () => scrollToSection(servicesKey), isDark, 3),
                                    _drawerItem('ABOUT', () => scrollToSection(aboutKey), isDark, 4),
                                    _drawerItem('CONTACT', () => scrollToSection(contactKey), isDark, 5),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(32),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      _socialIcon(FontAwesomeIcons.linkedinIn, 'https://www.linkedin.com/in/ajinkya-aher-34b012348/', isDark),
                                      _socialIcon(FontAwesomeIcons.github, 'https://github.com/ajinkya446', isDark),
                                      _socialIcon(FontAwesomeIcons.instagram, 'https://www.instagram.com/forever__undefeated/', isDark),
                                    ],
                                  ),
                                  const SizedBox(height: 24),
                                  Text('© 2026 AJINKYA AHER', style: GoogleFonts.montserrat(fontSize: 8, color: Colors.grey.shade600, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _mobileStat(String val, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(val, style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.orange)),
        Text(label, style: GoogleFonts.montserrat(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
      ],
    );
  }

  Widget _drawerItem(String title, VoidCallback onTap, bool isDark, int index) {
    return FadeInSlide(
      delay: Duration(milliseconds: 100 + (index * 50)),
      direction: 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Container(width: 6, height: 1, color: Colors.orange.withValues(alpha: 0.5)),
              const SizedBox(width: 12),
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: isDark ? Colors.white : Colors.black,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialIcon(FaIconData icon, String url, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () => openExternalLink(url),
        child: FaIcon(icon, size: 14, color: isDark ? Colors.white38 : Colors.black38),
      ),
    );
  }
}
