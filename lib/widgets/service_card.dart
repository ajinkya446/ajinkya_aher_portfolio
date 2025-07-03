import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class ServiceCard extends StatefulWidget {
  final dynamic serviceContent;

  const ServiceCard({super.key, required this.serviceContent});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.2, 0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
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
        mainAxisSize: MainAxisSize.min, // Prevent overflow
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(icon: FaIcon(faIconMap[widget.serviceContent["icon"]] ?? FontAwesomeIcons.question, size: 32 * scale), color: Colors.orange, onPressed: () {}),
          const SizedBox(height: 12),
          Text(
            widget.serviceContent["title"],
            style: GoogleFonts.montserrat(fontSize: 18 * scale, fontWeight: FontWeight.bold, color: Colors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Flexible(
            fit: FlexFit.loose,
            child: Text(widget.serviceContent["shortDescription"], style: GoogleFonts.montserrat(fontSize: 14 * scale, color: Colors.grey.shade300), maxLines: 3, overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.bottomRight,
            child: SlideTransition(
              position: _offsetAnimation,
              child: Icon(Icons.arrow_right_alt, color: Colors.orange, size: 32),
            ),
          ),
        ],
      ),
    );
  }
}
