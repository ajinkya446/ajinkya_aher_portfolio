import 'dart:html' as html;

import 'package:ajinkya_aher_portfolio/pages/service_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/info_card.dart';
import 'about_me_screen.dart';
import 'desktop_view.dart';
import 'mobile_view.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget desktop;
  final Widget mobile;

  const ResponsiveLayout({super.key, required this.desktop, required this.mobile});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return DesktopView();
        } else {
          return MobileView();
        }
      },
    );
  }
}

