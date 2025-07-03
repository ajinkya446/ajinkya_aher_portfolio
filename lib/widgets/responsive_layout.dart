import 'dart:html' as html;

import 'package:ajinkya_aher_portfolio/widgets/service_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'about_me_screen.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget desktop;
  final Widget mobile;

  const ResponsiveLayout({super.key, required this.desktop, required this.mobile});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return DesktopView();
        } else {
          return MobileView();
        }
      },
    );
  }
}

class DesktopView extends StatelessWidget {
  DesktopView({super.key}); // Removed 'const' because of keys

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double scale = screenWidth / 1400;
    scale = scale.clamp(0.8, 1.2);
    double avatarRadius = (screenWidth / 8).clamp(100, 180);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return Row(
                children: [
                  Text(
                    'AA',
                    style: GoogleFonts.k2d(fontSize: 32, color: const Color(0xffE60026), fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  NavBarItem(
                    title: 'Home',
                    onTap: () => _scrollToSection(homeKey),
                  ),
                  NavBarItem(
                    title: 'Services',
                    onTap: () => _scrollToSection(servicesKey),
                  ),
                  NavBarItem(
                    title: 'About me',
                    onTap: () => _scrollToSection(aboutKey),
                  ),
                  NavBarItem(
                    title: 'Contact me',
                    onTap: () => _scrollToSection(contactKey),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    onPressed: () {},
                    child: Text(
                      'Hire Me',
                      style: GoogleFonts.montserrat(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'AA',
                    style: GoogleFonts.k2d(fontSize: 32, color: const Color(0xffE60026), fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {},
                  )
                ],
              );
            }
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      key: homeKey,
                      padding: const EdgeInsets.all(40),
                      child: LayoutBuilder(
                        builder: (context, innerConstraints) {
                          final isNarrow = innerConstraints.maxWidth < 900;
                          if (isNarrow) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [_buildLeft(scale, isCentered: true), const SizedBox(height: 40), _buildRight(avatarRadius)],
                            );
                          } else {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Expanded(child: _buildLeft(scale)), const SizedBox(width: 40), Expanded(child: _buildRight(avatarRadius))],
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 120),
                    Container(
                      key: servicesKey,
                      child: const ServicesSection(),
                    ),
                    const SizedBox(height: 120),
                    Container(
                      key: aboutKey,
                      child: AboutMeSection(),
                    ),
                    const SizedBox(height: 120),
                    Container(
                      key: contactKey,
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: const Center(
                        child: Text('Contact Me Section', style: TextStyle(fontSize: 24, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  Widget _buildLeft(double scale, {bool isCentered = false}) {
    return Column(
      crossAxisAlignment: isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Hi I am',
          style: GoogleFonts.montserrat(fontSize: 16 * scale, color: Colors.grey.shade400),
        ),
        SizedBox(height: 8 * scale),
        Text(
          'Ajinkya Aher',
          style: GoogleFonts.montserrat(fontSize: 32 * scale, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
        ),
        SizedBox(height: 12 * scale),
        Text(
          'Flutter (Android/iOS) App Developer',
          style: GoogleFonts.montserrat(fontSize: 40 * scale, fontWeight: FontWeight.bold, color: Colors.orange),
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
        ),
        SizedBox(height: 20 * scale),
        Wrap(
          alignment: isCentered ? WrapAlignment.center : WrapAlignment.start,
          spacing: 20,
          runSpacing: 12,
          children: [
            Icon(FontAwesomeIcons.instagram, size: 20, color: Colors.white),
            GestureDetector(
                onTap: () {
                  html.window.open('https://www.linkedin.com/in/ajinkya-aher-34b012348/', '_blank');
                },
                child: Icon(FontAwesomeIcons.linkedin, size: 20, color: Colors.white)),
            GestureDetector(
                onTap: () {
                  html.window.open('https://github.com/ajinkya446', '_blank');
                },
                child: Icon(FontAwesomeIcons.git, size: 20, color: Colors.white)),
            Icon(FontAwesomeIcons.gitlab, size: 20, color: Colors.white),
            Icon(FontAwesomeIcons.medium, size: 20, color: Colors.white),
          ],
        ),
        SizedBox(height: 30 * scale),
        Wrap(
          alignment: isCentered ? WrapAlignment.center : WrapAlignment.start,
          spacing: 16,
          runSpacing: 12,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, padding: EdgeInsets.symmetric(horizontal: 24 * scale, vertical: 12 * scale)),
              onPressed: () {},
              child: Text(
                'Hire Me',
                style: GoogleFonts.montserrat(fontSize: 16 * scale, color: Colors.black, fontWeight: FontWeight.w400),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey.shade400), padding: EdgeInsets.symmetric(horizontal: 24 * scale, vertical: 12 * scale)),
              onPressed: () {},
              child: Text(
                'Download CV',
                style: GoogleFonts.montserrat(fontSize: 16 * scale, color: Colors.white, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        SizedBox(height: 40 * scale),
        Wrap(
          alignment: isCentered ? WrapAlignment.center : WrapAlignment.start,
          spacing: 20,
          runSpacing: 20,
          children: const [InfoCard(label: '5+', description: 'Experiences'), InfoCard(label: '10+', description: 'Project done'), InfoCard(label: '5+', description: 'Happy Clients')],
        ),
      ],
    );
  }

  Widget _buildRight(double avatarRadius) {
    return Align(
      alignment: Alignment.center,
      child: CircleAvatar(
        radius: avatarRadius,
        backgroundColor: Colors.grey.shade900,
        child: ClipOval(
          child: Image.asset('assets/profile.png', fit: BoxFit.contain, width: avatarRadius * 2, height: avatarRadius * 2),
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const NavBarItem({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: GoogleFonts.montserrat(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
      ),
    );
  }
}
class InfoCard extends StatelessWidget {
  final String label;
  final String description;

  const InfoCard({super.key, required this.label, required this.description});

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.of(context).textScaleFactor;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.grey.shade900, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: GoogleFonts.montserrat(fontSize: 24 * scale, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          Text(description, style: GoogleFonts.montserrat(fontSize: 14 * scale, color: Colors.grey.shade300)),
        ],
      ),
    );
  }
}

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  static const double maxContentWidth = 600;

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
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: maxContentWidth),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.grey.shade900,
                    child: ClipOval(
                      child: Image.asset('assets/profile.png', width: 180, height: 180, fit: BoxFit.contain),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Hi I am',
                    style: GoogleFonts.montserrat(fontSize: 16 * scale, color: Colors.grey.shade400),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ajinkya Aher',
                    style: GoogleFonts.montserrat(fontSize: 28 * scale, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Flutter (Android/iOS) App Developer',
                    style: GoogleFonts.montserrat(fontSize: 28 * scale, fontWeight: FontWeight.bold, color: Colors.orange),
                    textAlign: TextAlign.center,
                  ),
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
                          child: Icon(FontAwesomeIcons.instagram, size: 20, color: Colors.white)),
                      GestureDetector(
                          onTap: () {
                            html.window.open('https://www.linkedin.com/in/ajinkya-aher-34b012348/', '_blank');
                          },
                          child: Icon(FontAwesomeIcons.linkedin, size: 20, color: Colors.white)),
                      GestureDetector(
                          onTap: () {
                            html.window.open('https://github.com/ajinkya446', '_blank');
                          },
                          child: const Icon(FontAwesomeIcons.git, size: 20, color: Colors.white)),
                      const Icon(FontAwesomeIcons.gitlab, size: 20, color: Colors.white),
                      const Icon(FontAwesomeIcons.medium, size: 20, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12)),
                        onPressed: () {},
                        child: Text(
                          'Hire Me',
                          style: GoogleFonts.montserrat(fontSize: 16 * scale, color: Colors.black),
                        ),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey.shade400), padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12)),
                        onPressed: () {},
                        child: Text(
                          'Download CV',
                          style: GoogleFonts.montserrat(fontSize: 16 * scale, color: Colors.white),
                        ),
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
                  const ServicesSection(),
                  const SizedBox(height: 120),
                  AboutMeSection()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
