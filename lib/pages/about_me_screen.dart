import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils.dart';

class AboutMeSection extends StatelessWidget {
  final themeValue;

  const AboutMeSection({super.key, this.themeValue});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: const EdgeInsets.all(16),
      color: themeValue.brightness == Brightness.light ? Colors.white : Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'About Me',
            style: GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.bold, color: themeValue.brightness == Brightness.light ? Colors.black : Colors.white),
          ),
          const SizedBox(height: 40),
          isMobile
              ? Column(
                  children: [buildProfileImage(MediaQuery.of(context).size.width), const SizedBox(height: 16), buildAboutDescription(themeValue)],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Expanded(child: buildProfileImage(MediaQuery.of(context).size.width)), const SizedBox(width: 32), Expanded(child: buildAboutDescription(themeValue))],
                ),
          const SizedBox(height: 100),
          buildSkillsSection(themeValue),
        ],
      ),
    );
  }

  Widget buildProfileImage(final width) {
    double avatarRadius = (width / 8).clamp(100, 180);

    return ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.asset('assets/profile.png', fit: BoxFit.contain, width: avatarRadius * 2, height: avatarRadius * 2));
  }

  Widget buildAboutDescription(final themeValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I am a results-driven Senior Mobile Developer with over 5 years of experience in designing, developing, and maintaining high-quality, cross-platform mobile applications. My core expertise lies in Flutter, with strong proficiency in native Android (Java/Kotlin), iOS (Swift), and Unity (AR) development."
          "\nSpecializing in state management solutions such as BLoC, GetX, and Provider. I have a proven track record in integrating RESTful APIs, automating CI/CD pipelines using GitLab CI/CD and GitHub Actions, and ensuring full compliance with App Store and Play Store guidelines."
          "\nI have successfully contributed to a range of projects, including high-impact government and enterprise applications, while also developing reusable custom Flutter libraries and packages. I am committed to writing clean, maintainable code, driving performance improvements, and collaborating effectively within Agile teams.",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(fontSize: 14, color: themeValue.brightness == Brightness.light ? Colors.black45 : Colors.grey.shade400),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            Utils().downloadPDF();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: themeValue.brightness == Brightness.light ? Colors.black : Colors.white,
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

  Widget buildSkillsSection(final themeValue) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 32,
      runSpacing: 24,
      children: [
        buildSkillItem(FontAwesomeIcons.android, 'Android', '100%', themeValue),
        buildSkillItem(FontAwesomeIcons.java, 'Java', '95%', themeValue),
        buildSkillItem(FontAwesomeIcons.code, 'Kotlin', '90%', themeValue),
        buildSkillItem(FontAwesomeIcons.layerGroup, 'Jetpack', '85%', themeValue),
        buildSkillItem(FontAwesomeIcons.apple, 'iOS', '90%', themeValue),
        buildSkillItem(FontAwesomeIcons.swift, 'Swift', '85%', themeValue),
        buildSkillItem(FontAwesomeIcons.fire, 'Firebase', '100%', themeValue),
        buildSkillItem(FontAwesomeIcons.database, 'SQFlite', '100%', themeValue),
        buildSkillItem(FontAwesomeIcons.mobileAlt, 'Flutter', '100%', themeValue),
        buildSkillItem(FontAwesomeIcons.codeBranch, 'Dart', '100%', themeValue),
        buildSkillItem(FontAwesomeIcons.networkWired, 'REST API', '100%', themeValue),
        buildSkillItem(FontAwesomeIcons.creditCard, 'Payment Gateway', '75%', themeValue),
      ],
    );
  }

  Widget buildSkillItem(IconData icon, String name, String percent, final themeValue) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.orange, width: 4)),
          child: FaIcon(icon, color: themeValue.brightness == Brightness.light ? Colors.black : Colors.white, size: 32),
        ),
        const SizedBox(height: 12),
        Text(name,
            style: GoogleFonts.montserrat(fontSize: 14, color: themeValue.brightness == Brightness.light ? Colors.black : Colors.white, fontWeight: FontWeight.w400), textAlign: TextAlign.center),
        const SizedBox(height: 8),
        Text(
          percent,
          style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }

  Widget buildSkill(String name, double percent, final themeValue) {
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
              style: TextStyle(color: themeValue.brightness == Brightness.light ? Colors.black : Colors.white, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(name, style: TextStyle(color: themeValue.brightness == Brightness.light ? Colors.black : Colors.white)),
      ],
    );
  }
}
