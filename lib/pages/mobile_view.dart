import 'dart:html' as html;

import 'package:ajinkya_aher_portfolio/pages/project_section.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../pages/service_screen.dart';
import '../utils.dart';
import '../widgets/info_card.dart';
import 'about_me_screen.dart';
import 'contact_me_section.dart';
import 'desktop_view.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  static const double maxContentWidth = 600;

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
    final scale = MediaQuery.of(context).textScaleFactor;

    return ValueListenableBuilder(
        valueListenable: themeNotifier,
        builder: (themeCtx, themeValue, child) {
          return Scaffold(
            backgroundColor: themeValue.brightness == Brightness.light ? Colors.white : Colors.black,
            appBar: AppBar(
              centerTitle: false,
              title: Text('AA', style: GoogleFonts.k2d(fontSize: 32, color: themeValue.brightness == Brightness.light ? Colors.black : Colors.white, fontWeight: FontWeight.bold)),
              backgroundColor: themeValue.brightness == Brightness.light ? Colors.white : Colors.black,
              actions: [
                IconButton(onPressed: toggleDrawer, icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _drawerController, color: Colors.orange)),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.orange,
              onPressed: () {
                themeNotifier.value = themeNotifier.value.brightness == Brightness.light ? darkTheme : lightTheme;
              },
              child: Icon(
                themeNotifier.value.brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode,
                color: Colors.white,
              ),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: MobileView.maxContentWidth),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(key: homeKey),
                            CircleAvatar(
                              radius: 100,
                              backgroundColor: themeValue.brightness == Brightness.light ? Colors.black12 :Colors.grey.shade900,
                              child: ClipOval(
                                child: Image.asset('assets/profile.png', width: 180, height: 180, fit: BoxFit.contain),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text('Hi I am',
                                style: GoogleFonts.montserrat(fontSize: 16 * scale, color: themeValue.brightness == Brightness.light ? Colors.black45 : Colors.grey.shade400),
                                textAlign: TextAlign.center),
                            const SizedBox(height: 8),
                            Text(
                              'Ajinkya Aher',
                              style: GoogleFonts.montserrat(fontSize: 28 * scale, fontWeight: FontWeight.bold, color: themeValue.brightness == Brightness.light ? Colors.black : Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            Text('Flutter (Android/iOS) App Developer',
                                style: GoogleFonts.montserrat(fontSize: 28 * scale, fontWeight: FontWeight.bold, color: Colors.orange), textAlign: TextAlign.center),
                            const SizedBox(height: 24),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 20,
                              runSpacing: 12,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    html.window.open('https://www.instagram.com/forever__undefeated/', '_blank');
                                  },
                                  child: Icon(FontAwesomeIcons.instagram, size: 20, color: themeValue.brightness == Brightness.light ? Colors.black : Colors.white),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    html.window.open('https://www.linkedin.com/in/ajinkya-aher-34b012348/', '_blank');
                                  },
                                  child: Icon(FontAwesomeIcons.linkedin, size: 20, color: themeValue.brightness == Brightness.light ? Colors.black : Colors.white),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    html.window.open('https://github.com/ajinkya446', '_blank');
                                  },
                                  child: Icon(FontAwesomeIcons.git, size: 20, color: themeValue.brightness == Brightness.light ? Colors.black : Colors.white),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      html.window.open('https://gitlab.com/ajinkya446', '_blank');
                                    },
                                    child: Icon(FontAwesomeIcons.gitlab, size: 20, color: themeValue.brightness == Brightness.light ? Colors.black : Colors.white)),
                                GestureDetector(
                                    onTap: () {
                                      html.window.open('https://medium.com/@ajinkya446', '_blank');
                                    },
                                    child: Icon(FontAwesomeIcons.medium, size: 20, color: themeValue.brightness == Brightness.light ? Colors.black : Colors.white)),
                              ],
                            ),
                            const SizedBox(height: 32),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12)),
                                  onPressed: () {
                                    Utils().launchEmail();
                                  },
                                  child: Text('Hire Me', style: GoogleFonts.montserrat(fontSize: 16 * scale, color: themeValue.brightness == Brightness.light ? Colors.black : Colors.white)),
                                ),
                                const SizedBox(width: 16),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey.shade400), padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12)),
                                  onPressed: () {
                                    Utils().downloadPDF();
                                  },
                                  child: Text('Download CV', style: GoogleFonts.montserrat(fontSize: 16 * scale, color: themeValue.brightness == Brightness.light ? Colors.black : Colors.white)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              alignment: WrapAlignment.center,
                              children: [
                                InfoCard(label: '5+', description: 'Experience', themeValue: themeValue),
                                InfoCard(label: '10+', description: 'Project done', themeValue: themeValue),
                                InfoCard(label: '5+', description: 'Happy Clients', themeValue: themeValue)
                              ],
                            ),
                            const SizedBox(height: 120),
                            Container(key: servicesKey, child: ServicesSection(themeValue: themeValue)),
                            const SizedBox(height: 120),
                            Container(key: projectKey, child: ProjectSection(themeValue: themeValue)),
                            const SizedBox(height: 120),
                            Container(key: aboutKey, child: AboutMeSection(themeValue: themeValue)),
                            const SizedBox(height: 120),
                            Container(key: contactKey, padding: const EdgeInsets.symmetric(vertical: 40), child: ContactPage(themeValue: themeValue)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Animated Drawer
                SlideTransition(
                  position: _drawerAnimation,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 250,
                      height: double.infinity,
                      color: themeValue.brightness == Brightness.light ? Colors.white :const Color(0xFF121212),
                      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          drawerItem(FontAwesomeIcons.house, 'Home', scale, () => scrollToSection(homeKey), themeValue),
                          drawerItem(FontAwesomeIcons.user, 'About me', scale, () => scrollToSection(aboutKey), themeValue),
                          drawerItem(FontAwesomeIcons.gears, 'Services', scale, () => scrollToSection(servicesKey), themeValue),
                          drawerItem(FontAwesomeIcons.folderOpen, 'Projects', scale, () => scrollToSection(projectKey), themeValue),
                          drawerItem(FontAwesomeIcons.phone, 'Contact me', scale, () => scrollToSection(contactKey), themeValue),
                          const Spacer(),
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

  Widget drawerItem(IconData icon, String label, double scale, VoidCallback onTap, final themeValue) {
    return ListTile(
      leading: FaIcon(icon, color: Colors.orange),
      title: Text(label, style: GoogleFonts.montserrat(fontSize: 16 * scale, color: themeValue.brightness == Brightness.light ? Colors.black : Colors.white)),
      onTap: onTap,
    );
  }
}
