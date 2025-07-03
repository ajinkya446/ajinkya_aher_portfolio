import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'About Me',
            style: GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 40),
          isMobile
              ? Column(
                  children: [buildProfileImage(MediaQuery.of(context).size.width), const SizedBox(height: 16), buildAboutDescription()],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: buildProfileImage(MediaQuery.of(context).size.width)),
                    const SizedBox(width: 32),
                    Expanded(child: buildAboutDescription()),
                  ],
                ),
          const SizedBox(height: 100),
          buildSkillsSection(),
        ],
      ),
    );
  }

  Widget buildProfileImage(final width) {
    double avatarRadius = (width / 8).clamp(100, 180);

    return ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.asset('assets/profile.png', fit: BoxFit.contain, width: avatarRadius * 2, height: avatarRadius * 2));
  }

  Widget buildAboutDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I am a results-driven Senior Mobile Developer with over 5 years of experience in designing, developing, and maintaining high-quality, cross-platform mobile applications. My core expertise lies in Flutter, with strong proficiency in native Android (Java/Kotlin), iOS (Swift), and Unity (AR) development."
          "\nSpecializing in state management solutions such as BLoC, GetX, and Provider. I have a proven track record in integrating RESTful APIs, automating CI/CD pipelines using GitLab CI/CD and GitHub Actions, and ensuring full compliance with App Store and Play Store guidelines."
          "\nI have successfully contributed to a range of projects, including high-impact government and enterprise applications, while also developing reusable custom Flutter libraries and packages. I am committed to writing clean, maintainable code, driving performance improvements, and collaborating effectively within Agile teams.",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(fontSize: 16, color: Colors.grey.shade400),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              elevation: 3),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(FontAwesomeIcons.download, size: 20, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'Download CV',
                style: GoogleFonts.montserrat(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSkillsSection() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 32,
      runSpacing: 24,
      children: [
        buildSkillItem(FontAwesomeIcons.android, 'Android', '100%'),
        buildSkillItem(FontAwesomeIcons.java, 'Java', '95%'),
        buildSkillItem(FontAwesomeIcons.code, 'Kotlin', '90%'),
        buildSkillItem(FontAwesomeIcons.layerGroup, 'Jetpack', '85%'),
        buildSkillItem(FontAwesomeIcons.apple, 'iOS', '90%'),
        buildSkillItem(FontAwesomeIcons.swift, 'Swift', '85%'),
        buildSkillItem(FontAwesomeIcons.fire, 'Firebase', '100%'),
        buildSkillItem(FontAwesomeIcons.database, 'SQFlite', '100%'),
        buildSkillItem(FontAwesomeIcons.mobileAlt, 'Flutter', '100%'),
        buildSkillItem(FontAwesomeIcons.codeBranch, 'Dart', '100%'),
        buildSkillItem(FontAwesomeIcons.networkWired, 'REST API', '100%'),
        buildSkillItem(FontAwesomeIcons.creditCard, 'Payment Gateway', '75%'),
      ],
    );
  }

  Widget buildSkillItem(IconData icon, String name, String percent) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.orange, width: 4)),
          child: FaIcon(icon, color: Colors.white, size: 32),
        ),
        const SizedBox(height: 12),
        Text(name, style: GoogleFonts.montserrat(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400), textAlign: TextAlign.center),
        const SizedBox(height: 8),
        Text(
          percent,
          style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }

  Widget buildSkill(String name, double percent) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(value: percent, strokeWidth: 6, backgroundColor: Colors.grey.shade800, color: Colors.orange),
            ),
            Text(
              '${(percent * 100).toInt()}%',
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
