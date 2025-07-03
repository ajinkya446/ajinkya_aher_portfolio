import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';
import '../widgets/service_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static const double desktopMaxWidth = 1200;
  static const double horizontalPadding = 16;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 60),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Services',
            style: GoogleFonts.montserrat(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'I craft high-quality Android, iOS, and cross-platform apps with Flutter, combining intuitive UI/UX design, seamless web integration, and robust CI/CD automation. Let’s turn your ideas into fast, reliable, and beautifully designed digital experiences.',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: Colors.grey.shade400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: desktopMaxWidth),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final containerWidth = constraints.maxWidth;
                    int crossAxisCount;
                    double? aspectRatio;
                    if (containerWidth >= 1000) {
                      crossAxisCount = 3;
                      aspectRatio = 8 / 4.5;
                    } else if (containerWidth >= 600) {
                      crossAxisCount = 2;
                      aspectRatio = 6 / 3.2;
                    } else {
                      return Column(
                        children: List.generate(
                          serviceList.length,
                          (index) => Padding(padding: const EdgeInsets.only(bottom: 20), child: ServiceCard(serviceContent: serviceList[index])),
                        ),
                      );
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: serviceList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: aspectRatio!),
                      itemBuilder: (context, index) => ServiceCard(serviceContent: serviceList[index]),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
