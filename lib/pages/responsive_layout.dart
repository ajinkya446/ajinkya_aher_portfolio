import 'dart:html' as html;

import 'package:ajinkya_aher_portfolio/pages/service_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/info_card.dart';
import 'about_me_screen.dart';
import 'desktop_view.dart';

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
