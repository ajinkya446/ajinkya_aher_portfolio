import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/project_card.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Projects',
            style: GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              ProjectCard(
                  imagePath: 'assets/satush_logo.png',
                  projectName: 'SatUsh',
                  description: 'A community-driven meal-sharing app to share, request, or pick up surplus food and reduce waste.',
                  appStoreUrl: 'https://apps.apple.com/in/app/satush/id6745502363',
                  playStoreUrl: 'https://play.google.com/store/apps/details?id=com.satiety&hl=en_IN'),
              ProjectCard(
                  imagePath: 'assets/famrut.png',
                  projectName: 'Famrut',
                  description: 'Famrut is a smart farming app connecting farmers with digital tools and services to boost productivity.',
                  appStoreUrl: '',
                  playStoreUrl: 'https://play.google.com/store/apps/details?id=com.esds.famrut&hl=en_IN'),
              ProjectCard(
                  imagePath: 'assets/icar.jpg',
                  projectName: 'ICAR-DOGR',
                  description: 'ICAR-DOGR is an agriculture app offering expert advice and tools for onion and garlic farming.',
                  appStoreUrl: '',
                  playStoreUrl: 'https://play.google.com/store/apps/details?id=in.gov.icar.dogr.oca&hl=en_IN'),
              ProjectCard(
                  imagePath: 'assets/nerace.png',
                  projectName: 'NERACE Buyer',
                  description: 'NERACE is an agri-marketplace app for farmers to sell, auction, and trade produce directly with buyers.',
                  appStoreUrl: 'https://apps.apple.com/in/app/nerace-buyer/id6738162784',
                  playStoreUrl: 'https://play.google.com/store/apps/details?id=com.esds.nedfi_buyer&hl=en_IN'),
              ProjectCard(
                  imagePath: 'assets/nerace.png',
                  projectName: 'Nerace Seller',
                  description: 'NERACE Seller is a platform for farmers to sell and auction their agricultural produce online.',
                  appStoreUrl: 'https://apps.apple.com/in/app/nerace-seller/id6738127031',
                  playStoreUrl: 'https://play.google.com/store/search?q=nerace+seller&c=apps&hl=en_IN'),
              ProjectCard(
                  imagePath: 'assets/fup.png',
                  projectName: 'Krushak Odisha Portal App',
                  description: 'Krushak Odisha is a government app for farmers to access financial aid, schemes, advisories, and market info.',
                  appStoreUrl: '',
                  playStoreUrl: 'https://play.google.com/store/search?q=krushak+odisha+portal+app&c=apps&hl=en_IN'),
              ProjectCard(
                  imagePath: 'assets/mTWO.png',
                  projectName: 'mTWO',
                  description: 'mTWO is a cloud-based construction management app for project planning, costs, and collaboration.',
                  appStoreUrl: 'https://apps.apple.com/in/app/rib-4-0/id1591878448',
                  playStoreUrl: 'https://play.google.com/store/apps/details?id=com.rib.itwo.site&hl=en_IN'),
              // ➜ Add more cards here if needed
            ],
          ),
        ],
      ),
    );
  }
}
