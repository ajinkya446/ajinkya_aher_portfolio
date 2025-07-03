import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget desktop;
  final Widget mobile;

  const ResponsiveLayout({super.key, required this.desktop, required this.mobile});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 600) {
          return desktop;
        } else {
          return mobile;
        }
      },
    );
  }
}

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive font scaling factor
    double scale = screenWidth / 1400;
    scale = scale.clamp(0.8, 1.2); // reasonable scaling limits

    // Responsive avatar radius
    double avatarRadius = (screenWidth / 8).clamp(100, 180);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              // Desktop view
              return Row(
                children: [
                  Text(
                    'AA',
                    style: GoogleFonts.k2d(fontSize: 32, color: const Color(0xffE60026), fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  NavBarItem(title: 'Home'),
                  NavBarItem(title: 'Services'),
                  NavBarItem(title: 'About me'),
                  NavBarItem(title: 'Portfolio'),
                  NavBarItem(title: 'Contact me'),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    onPressed: () {},
                    child: Text(
                      'Hire Me',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              // Mobile view
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'AA',
                    style: GoogleFonts.k2d(fontSize: 32, color: const Color(0xffE60026), fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      // You can show Drawer or BottomSheet for nav
                    },
                  )
                ],
              );
            }
          },
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1400),
          padding: const EdgeInsets.all(40),
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isNarrow = constraints.maxWidth < 900;
                if (isNarrow) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [_buildLeft(scale, isCentered: true), const SizedBox(height: 40), _buildRight(avatarRadius)],
                    ),
                  );
                } else {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Expanded(child: _buildLeft(scale)), const SizedBox(width: 40), Expanded(child: _buildRight(avatarRadius))],
                  );
                }
              },
            ),
          ),
        ),
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
          children: const [
            Icon(FontAwesomeIcons.instagram, size: 20, color: Colors.white),
            Icon(FontAwesomeIcons.linkedin, size: 20, color: Colors.white),
            Icon(FontAwesomeIcons.git, size: 20, color: Colors.white),
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
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade400),
                padding: EdgeInsets.symmetric(horizontal: 24 * scale, vertical: 12 * scale),
              ),
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
          children: const [
            InfoCard(label: '5+', description: 'Experiences'),
            InfoCard(label: '20+', description: 'Project done'),
            InfoCard(label: '80+', description: 'Happy Clients'),
          ],
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
          child: Image.asset('assets/profile.png', fit: BoxFit.cover, width: avatarRadius * 2, height: avatarRadius * 2),
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String title;

  const NavBarItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: TextButton(
        onPressed: () {},
        child: Text(title, style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white)),
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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.grey.shade900, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Text(
            label,
            style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 4),
          Text(description, style: GoogleFonts.montserrat(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400))
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
        title: Text(
          'AA',
          style: GoogleFonts.k2d(
            fontSize: 32 * scale,
            color: const Color(0xffE60026),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: maxContentWidth),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.grey.shade900,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/profile.png',
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Intro text
                  Text('Hi I am', style: GoogleFonts.montserrat(fontSize: 16 * scale, color: Colors.grey.shade400), textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  Text('Ajinkya Aher', style: GoogleFonts.montserrat(fontSize: 28 * scale, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
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
                    children: const [
                      Icon(FontAwesomeIcons.instagram, size: 20, color: Colors.white),
                      Icon(FontAwesomeIcons.linkedin, size: 20, color: Colors.white),
                      Icon(FontAwesomeIcons.dribbble, size: 20, color: Colors.white),
                      Icon(FontAwesomeIcons.behance, size: 20, color: Colors.white),
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
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey.shade400),
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                        ),
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
                    children: const [InfoCard(label: '5+', description: 'Experiences'), InfoCard(label: '20+', description: 'Project done'), InfoCard(label: '80+', description: 'Happy Clients')],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
