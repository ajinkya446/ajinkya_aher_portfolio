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
        // Breakpoint updated to 900 to match the logic in the individual sections
        if (constraints.maxWidth > 900) {
          return DesktopView();
        } else {
          return const MobileView();
        }
      },
    );
  }
}
