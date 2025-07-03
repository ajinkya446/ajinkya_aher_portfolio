import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Services', style: GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Text('Lorem ipsum dolor sit amet consectetur. Imperdiet convallis blandit felis ligula aliquam',
              style: GoogleFonts.montserrat(fontSize: 16, color: Colors.grey.shade400), textAlign: TextAlign.center),
          const SizedBox(height: 40),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  int crossAxisCount;
                  double aspectRatio;

                  if (width >= 1000) {
                    crossAxisCount = 3;
                    aspectRatio = 8 / 4.5;
                  } else if (width >= 600) {
                    crossAxisCount = 2;
                    aspectRatio = 6 / 3.2;
                  } else {
                    crossAxisCount = 1;
                    aspectRatio = 1.5;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: aspectRatio),
                    itemBuilder: (context, index) => const ServiceCard(),
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

class ServiceCard extends StatefulWidget {
  const ServiceCard({super.key});

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
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade900, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.orange, width: 1)),
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.design_services, size: 48, color: Colors.orange),
            const SizedBox(height: 16),
            Text('Service Title', style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 8),
            Text('This is a short description of the service offered.', style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey.shade300)),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.bottomRight,
              child: SlideTransition(position: _offsetAnimation, child: Icon(Icons.arrow_right_alt, color: Colors.orange, size: 32)),
            ),
          ],
        ),
      ),
    );
  }
}
