import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/fade_in_slide.dart';

class ExperienceSection extends StatelessWidget {
  final dynamic themeValue;
  const ExperienceSection({super.key, required this.themeValue});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;
    final isDark = themeValue.brightness == Brightness.dark;

    final experiences = [
      {
        "role": "Senior Engineer",
        "company": "TATA ELXSI, Bangalore",
        "period": "Oct 2025 - Present",
        "description": [
          "Architected mobile ecosystems for mission-critical IoT provisioning (BLE/Wi-Fi) across thermostats and video security systems.",
          "Engineered unified frameworks supporting multiple smart product lines under a single codebase.",
          "Optimized hardware-software communication layers ensuring high-stability performance for connected devices."
        ]
      },
      {
        "role": "Specialist",
        "company": "ESDS Software Solutions Ltd",
        "period": "Jan 2023 - Oct 2025",
        "description": [
          "Developed high-impact government platforms (NERACE, FAMRUT) serving large-scale state agricultural sectors.",
          "Implemented state-of-the-art video conferencing modules for real-time advisory services.",
          "Standardized Clean Architecture across the mobile division, reducing technical debt by 30%."
        ]
      },
      {
        "role": "Software Engineer",
        "company": "Winjit Technologies Pvt Ltd",
        "period": "Nov 2020 - Dec 2022",
        "description": [
          "Led development of core reusable Flutter libraries used across 10+ enterprise projects.",
          "Integrated voice-first interfaces (Google Assistant) into mainstream consumer applications.",
          "Mentored junior engineers and steered technical code reviews to maintain high-quality engineering standards."
        ]
      },
      {
        "role": "Software Developer",
        "company": "Arisikey Technologies Pvt Ltd",
        "period": "Nov 2020 - Dec 2022",
        "description": [
          "Built data-intensive mobile solutions with a heavy focus on offline-first capabilities.",
          "Collaborated on cross-functional teams to deliver stable, scalable data synchronization layers."
        ]
      }
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: (screenWidth * 0.08).clamp(24.0, 120.0),
        vertical: isMobile ? 80 : 120,
      ),
      color: isDark ? const Color(0xFF080808) : const Color(0xFFF8F9FA),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInSlide(
            child: Row(
              children: [
                Container(width: 32, height: 1, color: Colors.orange),
                const SizedBox(width: 16),
                Text(
                  'EXPERIENCE',
                  style: GoogleFonts.montserrat(
                    fontSize: 11,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          FadeInSlide(
            delay: const Duration(milliseconds: 200),
            child: Text(
              'Professional Trajectory',
              style: GoogleFonts.montserrat(
                fontSize: isMobile ? 28 : 40,
                fontWeight: FontWeight.w900,
                color: isDark ? Colors.white : Colors.black,
                letterSpacing: -1,
              ),
            ),
          ),
          const SizedBox(height: 80),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: experiences.length,
                itemBuilder: (context, index) {
                  return FadeInSlide(
                    delay: Duration(milliseconds: 300 + (index * 100)),
                    child: ExperienceItem(
                      experience: experiences[index] as Map<String, dynamic>,
                      isLast: index == experiences.length - 1,
                      themeValue: themeValue,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final Map<String, dynamic> experience;
  final bool isLast;
  final dynamic themeValue;

  const ExperienceItem({
    super.key,
    required this.experience,
    required this.isLast,
    required this.themeValue,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = themeValue.brightness == Brightness.dark;
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Stack(
      children: [
        if (!isLast)
          Positioned(
            left: 3, // Centered with the 8px dot
            top: 24,
            bottom: 0,
            child: Container(
              width: 1,
              color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Professional Marker
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
              const SizedBox(width: 32), // Reduced from 40 for mobile efficiency
              
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isMobile) ...[
                      Text(
                        experience['period'],
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        experience['role'],
                        style: GoogleFonts.montserrat(
                          fontSize: 18, // Reduced for mobile
                          fontWeight: FontWeight.w900,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ] else
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              experience['role'],
                              style: GoogleFonts.montserrat(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: isDark ? Colors.white : Colors.black,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),
                          Text(
                            experience['period'].toString().toUpperCase(),
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 8),
                    Text(
                      experience['company'].toString().toUpperCase(),
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ...(experience['description'] as List<String>).map((point) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Text(
                          point,
                          style: GoogleFonts.montserrat(
                            fontSize: 13, // Reduced for better fit
                            height: 1.6,
                            color: isDark ? Colors.grey.shade500 : Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
