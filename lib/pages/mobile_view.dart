import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/service_screen.dart';
import '../widgets/info_card.dart';
import 'about_me_screen.dart';

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

  // Section Keys
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

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
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
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

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'AA',
          style: GoogleFonts.k2d(fontSize: 32 * scale, color: const Color(0xffE60026), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: toggleDrawer,
            icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _drawerController, color: Colors.orange),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Main Content
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
                      Container(key: _homeKey),
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.grey.shade900,
                        child: ClipOval(
                          child: Image.asset('assets/profile.png', width: 180, height: 180, fit: BoxFit.contain),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text('Hi I am', style: GoogleFonts.montserrat(fontSize: 16 * scale, color: Colors.grey.shade400), textAlign: TextAlign.center),
                      const SizedBox(height: 8),
                      Text(
                        'Ajinkya Aher',
                        style: GoogleFonts.montserrat(fontSize: 28 * scale, fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text('Flutter (Android/iOS) App Developer', style: GoogleFonts.montserrat(fontSize: 28 * scale, fontWeight: FontWeight.bold, color: Colors.orange), textAlign: TextAlign.center),
                      const SizedBox(height: 24),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 20,
                        runSpacing: 12,
                        children: [
                          GestureDetector(
                            onTap: () {
                              html.window.open('https://www.linkedin.com/in/ajinkya-aher-34b012348/', '_blank');
                            },
                            child: const Icon(FontAwesomeIcons.instagram, size: 20, color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              html.window.open('https://www.linkedin.com/in/ajinkya-aher-34b012348/', '_blank');
                            },
                            child: const Icon(FontAwesomeIcons.linkedin, size: 20, color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              html.window.open('https://github.com/ajinkya446', '_blank');
                            },
                            child: const Icon(FontAwesomeIcons.git, size: 20, color: Colors.white),
                          ),
                          GestureDetector(
                              onTap: () {
                                html.window.open('https://gitlab.com/ajinkya446', '_blank');
                              },
                              child: const Icon(FontAwesomeIcons.gitlab, size: 20, color: Colors.white)),
                          GestureDetector(
                              onTap: () {
                                html.window.open('https://medium.com/@ajinkya446', '_blank');
                              },
                              child: Icon(FontAwesomeIcons.medium, size: 20, color: Colors.white)),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12)),
                            onPressed: () {
                              html.window.open('mailto:ajinkya446@gmail.com?subject=Hire%20Request&body=Hello%20Ajinkya,', '_self');
                            },
                            child: Text('Hire Me', style: GoogleFonts.montserrat(fontSize: 16 * scale, color: Colors.white)),
                          ),
                          const SizedBox(width: 16),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey.shade400), padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12)),
                            onPressed: () {
                              html.AnchorElement(href: 'assets/ajinkya_resume.pdf')
                                ..setAttribute('download', 'Ajinkya_Aher_CV.pdf')
                                ..click();
                            },
                            child: Text('Download CV', style: GoogleFonts.montserrat(fontSize: 16 * scale, color: Colors.white)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: const [InfoCard(label: '5+', description: 'Experiences'), InfoCard(label: '10+', description: 'Project done'), InfoCard(label: '5+', description: 'Happy Clients')],
                      ),
                      const SizedBox(height: 120),
                      Container(key: _servicesKey, child: const ServicesSection()),
                      const SizedBox(height: 120),
                      Container(key: _aboutKey, child: const AboutMeSection()),
                      const SizedBox(height: 120),
                      Container(key: _projectsKey, child: Text("Projects Section", style: TextStyle(color: Colors.white))),
                      const SizedBox(height: 120),
                      Container(key: _contactKey, child: Text("Contact Section", style: TextStyle(color: Colors.white))),
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
                color: const Color(0xFF121212),
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    drawerItem(FontAwesomeIcons.house, 'Home', scale, () => scrollToSection(_homeKey)),
                    drawerItem(FontAwesomeIcons.user, 'About', scale, () => scrollToSection(_aboutKey)),
                    drawerItem(FontAwesomeIcons.gears, 'Services', scale, () => scrollToSection(_servicesKey)),
                    drawerItem(FontAwesomeIcons.folderOpen, 'Projects', scale, () => scrollToSection(_projectsKey)),
                    drawerItem(FontAwesomeIcons.phone, 'Contact', scale, () => scrollToSection(_contactKey)),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerItem(IconData icon, String label, double scale, VoidCallback onTap) {
    return ListTile(
      leading: FaIcon(icon, color: Colors.orange),
      title: Text(label, style: GoogleFonts.montserrat(fontSize: 16 * scale, color: Colors.white)),
      onTap: onTap,
    );
  }
}
