import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/project_card.dart';

class ProjectSection extends StatelessWidget {
  final dynamic themeValue;

  const ProjectSection({super.key, this.themeValue});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    final isDark = themeValue.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 120, vertical: 120),
      color: isDark ? const Color(0xFF080808) : const Color(0xFFF8F9FA),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 32, height: 1, color: Colors.orange),
              const SizedBox(width: 16),
              Text(
                'PROJECTS',
                style: GoogleFonts.montserrat(
                  fontSize: 40,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 80),
          Center(
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: [
                ProjectCard(
                    themeValue: themeValue,
                    imagePath: 'assets/satush_logo.png',
                    projectName: 'SatUsh',
                    description: 'A community-driven meal-sharing ecosystem designed to eliminate food waste through real-time surplus redistribution.',
                    appStoreUrl: 'https://apps.apple.com/in/app/satush/id6745502363',
                    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.satiety&hl=en_IN'),
                ProjectCard(
                    themeValue: themeValue,
                    imagePath: 'assets/famrut.png',
                    projectName: 'Famrut',
                    description: 'Enterprise-grade smart farming platform providing digital advisories and automated tool integration.',
                    appStoreUrl: '',
                    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.esds.famrut&hl=en_IN'),
                ProjectCard(
                    themeValue: themeValue,
                    imagePath: 'assets/icar.jpg',
                    projectName: 'ICAR-DOGR',
                    description: 'High-precision agricultural advisory platform developed for the OCAC ICAR, optimizing cultivation cycles.',
                    appStoreUrl: '',
                    playStoreUrl: 'https://play.google.com/store/apps/details?id=in.gov.icar.dogr.oca&hl=en_IN'),
                ProjectCard(
                    themeValue: themeValue,
                    imagePath: 'assets/nerace.png',
                    projectName: 'NERACE Buyer',
                    description: 'Agri-marketplace facilitating complex auction and trade cycles directly between farmers and entities.',
                    appStoreUrl: 'https://apps.apple.com/in/app/nerace-buyer/id6738162784',
                    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.esds.nedfi_buyer&hl=en_IN'),
                ProjectCard(
                    themeValue: themeValue,
                    imagePath: 'assets/nerace.png',
                    projectName: 'Nerace Seller',
                    description: 'A robust seller-side platform for real-time agricultural auction management and inventory distribution.',
                    appStoreUrl: 'https://apps.apple.com/in/app/nerace-seller/id6738127031',
                    playStoreUrl: 'https://play.google.com/store/search?q=nerace+seller&c=apps&hl=en_IN'),
                ProjectCard(
                    themeValue: themeValue,
                    imagePath: 'assets/fup.png',
                    projectName: 'Krushak Odisha',
                    description: 'Mission-critical government portal delivering financial schemes and real-time market advisories.',
                    appStoreUrl: '',
                    playStoreUrl: 'https://play.google.com/store/search?q=krushak+odisha+portal+app&c=apps&hl=en_IN'),
                ProjectCard(
                    themeValue: themeValue,
                    imagePath: 'assets/mTWO.png',
                    projectName: 'mTWO',
                    description: 'Scalable construction management system for precision planning, cost controls, and collaboration.',
                    appStoreUrl: 'https://apps.apple.com/in/app/rib-4-0/id1591878448',
                    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.rib.itwo.site&hl=en_IN'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
