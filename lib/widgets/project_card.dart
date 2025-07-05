import 'dart:html' as html;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectCard extends StatefulWidget {
  final String imagePath;
  final String projectName;
  final String description;
  final String appStoreUrl;
  final String playStoreUrl;
  final themeValue;

  const ProjectCard({super.key, required this.imagePath, required this.projectName, required this.description, required this.appStoreUrl, required this.playStoreUrl, this.themeValue});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> with SingleTickerProviderStateMixin {
  bool isHovered = false;

  void _launchUrl(String url) {
    html.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 300,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: widget.themeValue.brightness == Brightness.light ? Colors.black.withOpacity(0.05) : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.orange.withOpacity(0.7), width: 0.8),
          boxShadow: [
            BoxShadow(color: Colors.orange.withOpacity(isHovered ? 0.4 : 0.05), blurRadius: isHovered ? 10 : 4, spreadRadius: isHovered ? 2 : 0),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(widget.imagePath, height: 100, fit: BoxFit.contain),
                const SizedBox(height: 16),
                Text(
                  widget.projectName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold, color: widget.themeValue.brightness == Brightness.light ? Colors.black : Colors.white),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w300, color: widget.themeValue.brightness == Brightness.light ? Colors.black45 : Colors.grey.shade300),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => _launchUrl(widget.appStoreUrl),
                      child: AnimatedScale(scale: isHovered ? 1.2 : 1.0, duration: const Duration(milliseconds: 300), child: const FaIcon(FontAwesomeIcons.appStoreIos, color: Colors.white, size: 24)),
                    ),
                    const SizedBox(width: 40),
                    GestureDetector(
                      onTap: () => _launchUrl(widget.playStoreUrl),
                      child: AnimatedScale(scale: isHovered ? 1.2 : 1.0, duration: const Duration(milliseconds: 300), child: const FaIcon(FontAwesomeIcons.googlePlay, color: Colors.white, size: 24)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
