import 'package:web/web.dart' as web;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatefulWidget {
  final ThemeData themeValue;

  const ContactPage({super.key, required this.themeValue});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String selectedService = '';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _timelineController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _timelineController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  Widget _inputField(String label, TextEditingController controller, ThemeData themeValue, {int maxLines = 1}) {
    final isDark = themeValue.brightness == Brightness.dark;
    return TextField(
      controller: controller,
      style: GoogleFonts.montserrat(color: isDark ? Colors.white : Colors.black, fontSize: 14),
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: GoogleFonts.montserrat(color: isDark ? Colors.grey.shade600 : Colors.black38, fontSize: 13),
        filled: true,
        fillColor: isDark ? const Color(0xFF0F0F0F) : Colors.grey.shade100,
        contentPadding: const EdgeInsets.all(24),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.05)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.05)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.orange, width: 1),
        ),
      ),
    );
  }

  Widget _dropdownField() {
    final isDark = widget.themeValue.brightness == Brightness.dark;
    return DropdownButtonFormField<String>(
      initialValue: selectedService.isEmpty ? null : selectedService,
      onChanged: (value) {
        setState(() {
          selectedService = value!;
        });
      },
      dropdownColor: isDark ? const Color(0xFF0F0F0F) : Colors.white,
      style: GoogleFonts.montserrat(color: isDark ? Colors.white : Colors.black, fontSize: 14),
      decoration: InputDecoration(
          filled: true,
          fillColor: isDark ? const Color(0xFF0F0F0F) : Colors.grey.shade100,
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.05)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.05)),
          ),
      ),
      hint: Text('SERVICE OF INTEREST', style: GoogleFonts.montserrat(color: isDark ? Colors.grey.shade600 : Colors.black38, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
      items: ['UI/UX DESIGN', 'APP DEVELOPMENT', 'WEB DEVELOPMENT'].map((e) => DropdownMenuItem(value: e, child: Text(e, style: GoogleFonts.montserrat(fontSize: 13)))).toList(),
    );
  }

  void _submitForm() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final timeline = _timelineController.text.trim();
    final details = _detailsController.text.trim();

    if (name.isEmpty) {
      _showError('Please enter your name');
      return;
    }
    if (email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      _showError('Please enter a valid email');
      return;
    }
    if (phone.isEmpty || !RegExp(r'^[0-9]{7,15}$').hasMatch(phone)) {
      _showError('Please enter a valid phone number');
      return;
    }
    if (selectedService.isEmpty) {
      _showError('Please select a service of interest');
      return;
    }
    if (timeline.isEmpty) {
      _showError('Please enter your timeline');
      return;
    }
    if (details.isEmpty || details.length < 20) {
      _showError('Project details must be at least 20 characters');
      return;
    }

    _showSuccess('Form submitted successfully!');
    _clearForm();
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13)), backgroundColor: const Color(0xffE60026)),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: const Duration(seconds: 5), content: Text(message, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13)), backgroundColor: Colors.green),
    );
  }

  void _clearForm() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _timelineController.clear();
    _detailsController.clear();
    setState(() {
      selectedService = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.themeValue.brightness == Brightness.dark;
    return Container(
      color: isDark ? const Color(0xFF080808) : Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(width: 32, height: 1, color: Colors.orange),
                      const SizedBox(width: 16),
                      Text('CONTACT', style: GoogleFonts.montserrat(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.orange, letterSpacing: 3)),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text('Let\'s work together.', style: GoogleFonts.montserrat(fontSize: 40, fontWeight: FontWeight.w900, color: isDark ? Colors.white : Colors.black, letterSpacing: -1)),
                  const SizedBox(height: 80),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      bool isMobile = constraints.maxWidth < 900;
                      return Column(
                        children: [
                          Wrap(
                            spacing: 24,
                            runSpacing: 24,
                            children: [
                              SizedBox(width: isMobile ? double.infinity : 400, child: _inputField('NAME', _nameController, widget.themeValue)),
                              SizedBox(width: isMobile ? double.infinity : 400, child: _inputField('EMAIL', _emailController, widget.themeValue)),
                              SizedBox(width: isMobile ? double.infinity : 400, child: _inputField('PHONE', _phoneController, widget.themeValue)),
                              SizedBox(width: isMobile ? double.infinity : 400, child: _dropdownField()),
                              SizedBox(width: isMobile ? double.infinity : 400, child: _inputField('TIMELINE', _timelineController, widget.themeValue)),
                              SizedBox(width: isMobile ? double.infinity : 400, child: _inputField('PROJECT DETAILS', _detailsController, widget.themeValue, maxLines: 4)),
                            ],
                          ),
                          const SizedBox(height: 48),
                          Container(
                            alignment: isMobile ? Alignment.centerLeft : Alignment.centerLeft,
                            child: ElevatedButton(
                              onPressed: _submitForm,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
                                shape: const StadiumBorder(),
                                elevation: 0,
                              ),
                              child: Text('SEND MESSAGE', style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 2)),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            _buildFooter(widget.themeValue),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(ThemeData themeValue) {
    final isDark = themeValue.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 100),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF050505) : Colors.grey.shade50,
        border: Border(top: BorderSide(color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.05))),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('AA.', style: GoogleFonts.montserrat(fontSize: 24, color: Colors.orange, fontWeight: FontWeight.w900, letterSpacing: -1)),
              Row(
                children: [
                  _footerSocial(FontAwesomeIcons.linkedinIn, 'https://www.linkedin.com/in/ajinkya-aher-34b012348/', isDark),
                  _footerSocial(FontAwesomeIcons.github, 'https://github.com/ajinkya446', isDark),
                  _footerSocial(FontAwesomeIcons.instagram, 'https://www.instagram.com/forever__undefeated/', isDark),
                ],
              ),
            ],
          ),
          const SizedBox(height: 60),
          Divider(color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.05)),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('© 2026 Ajinkya Aher', style: GoogleFonts.montserrat(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)),
              Text('Crafted with Flutter', style: GoogleFonts.montserrat(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footerSocial(FaIconData icon, String url, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: GestureDetector(
        onTap: () => web.window.open(url, '_blank'),
        child: FaIcon(icon, size: 18, color: isDark ? Colors.white38 : Colors.black38),
      ),
    );
  }
}
