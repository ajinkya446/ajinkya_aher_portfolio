import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class ServiceCard extends StatefulWidget {
  final dynamic serviceContent;
  final dynamic themeValue;

  const ServiceCard({super.key, required this.serviceContent, this.themeValue});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = widget.themeValue.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 300,
        height: 220,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF0D0D0D) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isHovered 
                ? Colors.orange.withValues(alpha: 0.5) 
                : (isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.05)),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FaIcon(
              faIconMap[widget.serviceContent["icon"]] ?? FontAwesomeIcons.question,
              color: isHovered ? Colors.orange : Colors.grey.shade600,
              size: 24,
            ),
            const Spacer(),
            Text(
              widget.serviceContent["title"].toUpperCase(),
              style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.serviceContent["shortDescription"],
              style: GoogleFonts.montserrat(
                fontSize: 11,
                height: 1.5,
                color: isDark ? Colors.grey.shade500 : Colors.black54,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
