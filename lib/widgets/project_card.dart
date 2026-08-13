import 'dart:ui';

import 'package:flutter/material.dart';

import '../browser_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectCard extends StatefulWidget {
  final String imagePath;
  final String projectName;
  final String description;
  final String appStoreUrl;
  final String playStoreUrl;
  final dynamic themeValue;

  const ProjectCard({
    super.key,
    required this.imagePath,
    required this.projectName,
    required this.description,
    required this.appStoreUrl,
    required this.playStoreUrl,
    this.themeValue,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = widget.themeValue.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Even smaller adaptive width for cards
    double cardWidth = screenWidth < 340 ? screenWidth - 32 : 240.0;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
        width: cardWidth,
        height: 320, // Reduced from 380
        decoration: BoxDecoration(
          color: isDark 
              ? (isHovered ? Colors.white.withValues(alpha: 0.05) : const Color(0xFF0F0F0F))
              : (isHovered ? Colors.black.withValues(alpha: 0.02) : Colors.white),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isHovered 
                ? Colors.orange.withValues(alpha: 0.4) 
                : (isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.05)),
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Banner - Smaller size
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32), 
                  decoration: BoxDecoration(
                    color: isDark ? Colors.black : Colors.grey.shade50,
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AnimatedScale(
                        scale: isHovered ? 1.05 : 1.0,
                        duration: const Duration(milliseconds: 600),
                        child: Image.asset(
                          widget.imagePath,
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                        ),
                      ),
                      if (isHovered)
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                          child: Container(
                            color: Colors.orange.withValues(alpha: 0.03),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              
              // Content Section
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.projectName.toUpperCase(),
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.2,
                          color: Colors.orange,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.description,
                        style: GoogleFonts.montserrat(
                          fontSize: 9,
                          height: 1.4,
                          color: isDark ? Colors.grey.shade400 : Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          if (widget.playStoreUrl.isNotEmpty)
                            _storeIconButton(FontAwesomeIcons.googlePlay, widget.playStoreUrl, isDark),
                          if (widget.appStoreUrl.isNotEmpty)
                            _storeIconButton(FontAwesomeIcons.apple, widget.appStoreUrl, isDark),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward,
                            size: 12,
                            color: isHovered ? Colors.orange : Colors.grey.shade600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _storeIconButton(FaIconData icon, String url, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: () => openExternalLink(url),
        child: FaIcon(
          icon,
          size: 11,
          color: isDark ? Colors.white38 : Colors.black26,
        ),
      ),
    );
  }
}
