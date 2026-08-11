import 'package:flutter/material.dart';

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
          return const MobileView();
        }
      },
    );
  }
}
