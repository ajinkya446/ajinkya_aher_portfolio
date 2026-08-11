import 'package:ajinkya_aher_portfolio/pages/project_section.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../pages/service_screen.dart';
import '../pages/experience_section.dart';
import '../utils.dart';
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
    _drawerController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _drawerAnimation = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(CurvedAnimation(parent: _drawerController, curve: Curves.easeInOut));
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
    return ValueListenableBuilder(
        valueListenable: themeNotifier,
        builder: (themeCtx, themeValue, child) {
          final isDark = themeValue.brightness == Brightness.dark;
          return Scaffold(
            backgroundColor: themeValue.scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: isDark ? Colors.black : Colors.white,
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
                      // Modern Hero Section
                      Container(
                        key: homeKey,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.orange.withValues(alpha: 0.1),
                                border: Border.all(color: Colors.orange.withValues(alpha: 0.2)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text('AVAILABLE FOR HIRE', style: GoogleFonts.montserrat(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.orange, letterSpacing: 1)),
                            ),
                            const SizedBox(height: 40),
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.montserrat(fontSize: 48, fontWeight: FontWeight.w900, height: 1.1, color: isDark ? Colors.white : Colors.black, letterSpacing: -2),
                                children: [
                                  const TextSpan(text: 'ENGINEERING\n'),
                                  TextSpan(text: 'DIGITAL ', style: TextStyle(color: Colors.orange)),
                                  const TextSpan(text: 'EXPERIENCES'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 32),
                            Text(
                              'Senior Flutter Developer specialized in architecting scalable, cross-platform mobile ecosystems.',
                              style: GoogleFonts.montserrat(fontSize: 16, color: isDark ? Colors.grey.shade400 : Colors.black54, height: 1.6, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 48),
                            Center(
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1A1A1A),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.orange.withValues(alpha: 0.2)),
                                ),
                                child: ClipOval(child: Image.asset('assets/profile.png', fit: BoxFit.cover)),
                              ),
                            ),
                            const SizedBox(height: 60),
                            Wrap(
                              spacing: 32,
                              runSpacing: 24,
                              children: [
                                _mobileStat('05+', 'YEARS EXP'),
                                _mobileStat('20+', 'PROJECTS'),
                                _mobileStat('10K+', 'REPUTATION'),
                              ],
                            ),
                            const SizedBox(height: 48),
                            ElevatedButton(
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

                // MOBILE DRAWER
                SlideTransition(
                  position: _drawerAnimation,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      color: isDark ? const Color(0xFF0A0A0A) : Colors.white,
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          _drawerItem('HOME', () => scrollToSection(homeKey), isDark),
                          _drawerItem('EXPERIENCE', () => scrollToSection(experienceKey), isDark),
                          _drawerItem('PROJECTS', () => scrollToSection(projectKey), isDark),
                          _drawerItem('SERVICES', () => scrollToSection(servicesKey), isDark),
                          _drawerItem('ABOUT', () => scrollToSection(aboutKey), isDark),
                          _drawerItem('CONTACT', () => scrollToSection(contactKey), isDark),
                          const Spacer(),
                          Text('© 2026 AJINKYA AHER', style: GoogleFonts.montserrat(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1)),
                        ],
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
        Text(val, style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.orange)),
        Text(label, style: GoogleFonts.montserrat(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
      ],
    );
  }

  Widget _drawerItem(String title, VoidCallback onTap, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w900, color: isDark ? Colors.white : Colors.black, letterSpacing: -1),
        ),
      ),
    );
  }
}
