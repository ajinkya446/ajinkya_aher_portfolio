import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'desktop_view.dart';

class ContactPage extends StatefulWidget {
  final themeValue;

  const ContactPage({super.key, this.themeValue});

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

  Widget _inputField(String label, TextEditingController controller, final themeValue, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      style: GoogleFonts.montserrat(color: Colors.white),
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: GoogleFonts.montserrat(color: widget.themeValue.brightness == Brightness.light ? Colors.black45 : Colors.grey.shade400),
        filled: true,
        fillColor: widget.themeValue.brightness == Brightness.light ? Colors.black12 : const Color(0xFF1E1E1E),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _dropdownField() {
    return DropdownButtonFormField<String>(
      value: selectedService.isEmpty ? null : selectedService,
      onChanged: (value) {
        setState(() {
          selectedService = value!;
        });
      },
      dropdownColor: const Color(0xFF1E1E1E),
      style: GoogleFonts.montserrat(color: Colors.white),
      decoration: InputDecoration(
          filled: true,
          fillColor: widget.themeValue.brightness == Brightness.light ? Colors.black12 : const Color(0xFF1E1E1E),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide.none)),
      hint: Text('Service Of Interest', style: GoogleFonts.montserrat(color: widget.themeValue.brightness == Brightness.light ? Colors.black45 : Colors.grey.shade400)),
      items: ['UI/UX Design', 'App Development', 'Web Development'].map((e) => DropdownMenuItem(value: e, child: Text(e, style: GoogleFonts.montserrat(color: Colors.white)))).toList(),
    );
  }

  void _submitForm() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final timeline = _timelineController.text.trim();
    final details = _detailsController.text.trim();

    // Validation
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

    // All passed
    _showSuccess('Form submitted successfully!');
    _clearForm();
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: GoogleFonts.montserrat(color: Colors.white)), backgroundColor: Color(0xffE60026)),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: Duration(seconds: 5), content: Text(message, style: GoogleFonts.montserrat(color: Colors.white)), backgroundColor: Colors.green),
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
    return Container(
      color: widget.themeValue.brightness == Brightness.light ? Colors.white : Colors.black,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                children: [
                  Text('Contact me',
                      style: GoogleFonts.montserrat(fontSize: 28, color: widget.themeValue.brightness == Brightness.light ? Colors.black : Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  Text('Cultivating Connections: Reach Out And Connect With Me', style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey.shade500), textAlign: TextAlign.center),
                  const SizedBox(height: 40),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      bool isMobile = constraints.maxWidth < 800;
                      return Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        alignment: WrapAlignment.center,
                        children: [
                          SizedBox(width: isMobile ? double.infinity : 300, child: _inputField('Name', _nameController, widget.themeValue)),
                          SizedBox(width: isMobile ? double.infinity : 300, child: _inputField('Email', _emailController, widget.themeValue)),
                          SizedBox(width: isMobile ? double.infinity : 300, child: _inputField('Phone Number', _phoneController, widget.themeValue)),
                          SizedBox(width: isMobile ? double.infinity : 300, child: _dropdownField()),
                          SizedBox(width: isMobile ? double.infinity : 300, child: _inputField('Timeline', _timelineController, widget.themeValue)),
                          SizedBox(width: isMobile ? double.infinity : 300, child: _inputField('Project Details...', _detailsController, widget.themeValue, maxLines: 4)),
                          Container(
                            alignment: isMobile ? Alignment.center : Alignment.centerRight,
                            width: isMobile ? double.infinity : 620,
                            child: OutlinedButton(
                              onPressed: _submitForm,
                              style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.grey), padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32)),
                              child: Text('Send', style: GoogleFonts.montserrat(color: widget.themeValue.brightness == Brightness.light ? Colors.black45 : Colors.white)),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            _buildFooter(widget.themeValue),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(final themeValue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFF1E1E1E), width: 1),
        ),
      ),
      child: Column(
        children: [
          Text(
            'AJINKYA AHER',
            style: GoogleFonts.montserrat(fontSize: 24, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 24,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              TextButton(
                child: Text('Home', style: GoogleFonts.montserrat(color: widget.themeValue.brightness == Brightness.light ? Colors.black : Colors.white)),
                onPressed: () {
                  _scrollToSection(homeKey);
                },
              ),
              TextButton(
                child: Text('Services', style: GoogleFonts.montserrat(color: widget.themeValue.brightness == Brightness.light ? Colors.black : Colors.white)),
                onPressed: () {
                  _scrollToSection(servicesKey);
                },
              ),
              TextButton(
                child: Text('About me', style: GoogleFonts.montserrat(color: widget.themeValue.brightness == Brightness.light ? Colors.black : Colors.white)),
                onPressed: () {
                  _scrollToSection(aboutKey);
                },
              ),
              TextButton(
                child: Text('Projects', style: GoogleFonts.montserrat(color: widget.themeValue.brightness == Brightness.light ? Colors.black : Colors.white)),
                onPressed: () {
                  _scrollToSection(projectKey);
                },
              ),
              TextButton(
                child: Text('Contact me', style: GoogleFonts.montserrat(color: widget.themeValue.brightness == Brightness.light ? Colors.black : Colors.white)),
                onPressed: () {
                  _scrollToSection(contactKey);
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            alignment: WrapAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  html.window.open('https://www.instagram.com/forever__undefeated/', '_blank');
                },
                child: Icon(FontAwesomeIcons.instagram, size: 20, color: widget.themeValue.brightness == Brightness.light ? Colors.black : Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  html.window.open('https://www.linkedin.com/in/ajinkya-aher-34b012348/', '_blank');
                },
                child: Icon(FontAwesomeIcons.linkedin, size: 20, color: widget.themeValue.brightness == Brightness.light ? Colors.black : Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 8,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.email, color: widget.themeValue.brightness == Brightness.light ? Colors.black : Colors.white, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    'ajinkya446@gmail.com',
                    style: GoogleFonts.montserrat(color: widget.themeValue.brightness == Brightness.light ? Colors.black : Colors.white, fontSize: 14),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.phone, color: widget.themeValue.brightness == Brightness.light ? Colors.black : Colors.white, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    '+91 0000 0000 00',
                    style: GoogleFonts.montserrat(color: widget.themeValue.brightness == Brightness.light ? Colors.black : Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Divider(color: Colors.grey.shade700, thickness: 0.5),
          const SizedBox(height: 8),
          Text(
            'Designed by @Ajinkya.aher Senior Flutter Developer',
            style: GoogleFonts.montserrat(color: widget.themeValue.brightness == Brightness.light ? Colors.black : Colors.grey.shade600, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
