import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/contact_me_section.dart';
import '../pages/project_section.dart';
import '../pages/service_screen.dart';
import '../utils.dart';
import '../widgets/info_card.dart';
import '../widgets/nav_items.dart';
import 'about_me_screen.dart';

final GlobalKey homeKey = GlobalKey();
final GlobalKey servicesKey = GlobalKey();
final GlobalKey projectKey = GlobalKey();
final GlobalKey aboutKey = GlobalKey();
final GlobalKey contactKey = GlobalKey();

class DesktopView extends StatelessWidget {
  DesktopView({super.key});

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
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
        title: Row(
          children: [
            Text(
              'AA',
              style: GoogleFonts.k2d(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            NavBarItem(title: 'Home', onTap: () => _scrollToSection(homeKey)),
            NavBarItem(title: 'Services', onTap: () => _scrollToSection(servicesKey)),
            NavBarItem(title: 'Projects', onTap: () => _scrollToSection(projectKey)),
            NavBarItem(title: 'About me', onTap: () => _scrollToSection(aboutKey)),
            NavBarItem(title: 'Contact me', onTap: () => _scrollToSection(contactKey)),
            const SizedBox(width: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                Utils().launchEmail();
              },
              child: Text('Hire Me', style: GoogleFonts.montserrat(fontSize: 16, color: Colors.white)),
            ),
          ],
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
                              children: [
                                _buildLeft(scale, isCentered: true),
                                const SizedBox(height: 40),
                                _buildRight(avatarRadius),
                              ],
                            );
                          } else {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: _buildLeft(scale)),
                                const SizedBox(width: 40),
                                Expanded(child: _buildRight(avatarRadius)),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 120),
                    Container(key: servicesKey, child: const ServicesSection()),
                    const SizedBox(height: 120),
                    Container(key: projectKey, child: const ProjectSection()),
                    const SizedBox(height: 120),
                    Container(key: aboutKey, child: const AboutMeSection()),
                    const SizedBox(height: 120),
                    Container(
                      key: contactKey,
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: const ContactPage(),
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
          style: GoogleFonts.montserrat(
            fontSize: 16 * scale,
            color: Colors.grey.shade400,
          ),
        ),
        SizedBox(height: 8 * scale),
        Text(
          'Ajinkya Aher',
          style: GoogleFonts.montserrat(
            fontSize: 32 * scale,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 12 * scale),
        Text(
          'Flutter (Android/iOS) App Developer',
          style: GoogleFonts.montserrat(
            fontSize: 40 * scale,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        SizedBox(height: 20 * scale),
        Wrap(
          spacing: 20,
          runSpacing: 12,
          children: [
            Icon(FontAwesomeIcons.instagram, size: 20, color: Colors.white),
            GestureDetector(
              onTap: () => html.window.open('https://www.linkedin.com/in/ajinkya-aher-34b012348/', '_blank'),
              child: Icon(FontAwesomeIcons.linkedin, size: 20, color: Colors.white),
            ),
            GestureDetector(
              onTap: () => html.window.open('https://github.com/ajinkya446', '_blank'),
              child: Icon(FontAwesomeIcons.github, size: 20, color: Colors.white),
            ),
            GestureDetector(
              onTap: () => html.window.open('https://gitlab.com/ajinkya446', '_blank'),
              child: Icon(FontAwesomeIcons.gitlab, size: 20, color: Colors.white),
            ),
            GestureDetector(
              onTap: () => html.window.open('https://medium.com/@ajinkya446', '_blank'),
              child: Icon(FontAwesomeIcons.medium, size: 20, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 24 * scale, vertical: 12 * scale),
              ),
              onPressed: () {
                Utils().launchEmail();
              },
              child: Text(
                'Hire Me',
                style: GoogleFonts.montserrat(
                  fontSize: 16 * scale,
                  color: Colors.black,
                ),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade400),
                padding: EdgeInsets.symmetric(horizontal: 24 * scale, vertical: 12 * scale),
              ),
              onPressed: () {
                Utils().downloadPDF();
              },
              child: Text(
                'Download CV',
                style: GoogleFonts.montserrat(
                  fontSize: 16 * scale,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        Wrap(
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
      child: Image.asset('assets/profile.png', width: avatarRadius * 2, height: avatarRadius * 2, fit: BoxFit.contain),
    );
  }
}
