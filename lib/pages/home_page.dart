import 'package:ajinkya_aher_portfolio/pages/responsive_layout.dart';
import 'package:flutter/material.dart';

import 'desktop_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(desktop: DesktopView(), mobile: const MobileView()),
    );
  }
}
