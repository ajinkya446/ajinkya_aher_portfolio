import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

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
            style: GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'I craft high-quality Android, iOS, and cross-platform apps with Flutter, combining intuitive UI/UX design, seamless web integration, and robust CI/CD automation. Let’s turn your ideas into fast, reliable, and beautifully designed digital experiences.',
              style: GoogleFonts.montserrat(fontSize: 16, color: Colors.grey.shade400),
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
                    double aspectRatio;

                    if (containerWidth >= 1000) {
                      crossAxisCount = 3;
                      aspectRatio = 8 / 4.5;
                    } else if (containerWidth >= 600) {
                      crossAxisCount = 2;
                      aspectRatio = 6 / 3.2;
                    } else {
                      crossAxisCount = 1;
                      aspectRatio = 1.8;
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: serviceList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: aspectRatio),
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

class ServiceCard extends StatefulWidget {
  dynamic serviceContent;

  ServiceCard({super.key, this.serviceContent});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this)..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(0.2, 0)).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.of(context).textScaleFactor;
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade900, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.orange, width: 1)),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(icon: FaIcon(faIconMap[widget.serviceContent["icon"]] ?? FontAwesomeIcons.question, size: 32 * scale), color: Colors.orange, onPressed: () {}),
          const SizedBox(height: 12),
          Text(widget.serviceContent["title"], style: GoogleFonts.montserrat(fontSize: 18 * scale, fontWeight: FontWeight.bold, color: Colors.white), maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8),
          Expanded(
            child: Text(widget.serviceContent["shortDescription"], style: GoogleFonts.montserrat(fontSize: 14 * scale, color: Colors.grey.shade300), maxLines: 3, overflow: TextOverflow.ellipsis),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SlideTransition(position: _offsetAnimation, child: Icon(Icons.arrow_right_alt, color: Colors.orange, size: 32)),
          ),
        ],
      ),
    );
  }
}
