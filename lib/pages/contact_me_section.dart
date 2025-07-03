import 'package:ajinkya_aher_portfolio/pages/desktop_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String selectedService = '';

  Widget _inputField(String label, {int maxLines = 1}) {
    return TextFormField(
      style: GoogleFonts.montserrat(color: Colors.white),
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: GoogleFonts.montserrat(color: Colors.grey.shade400),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
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
        fillColor: const Color(0xFF1E1E1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
      ),
      hint: Text(
        'Service Of Interest',
        style: GoogleFonts.montserrat(color: Colors.grey.shade400),
      ),
      items: ['UI/UX Design', 'App Development', 'Web Development'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              children: [
                Text(
                  'Contact me',
                  style: GoogleFonts.montserrat(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Cultivating Connections: Reach Out And Connect With Me',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Colors.grey.shade500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isMobile = constraints.maxWidth < 800;
                    return Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: [
                        SizedBox(
                          width: isMobile ? double.infinity : 300,
                          child: _inputField('Name'),
                        ),
                        SizedBox(
                          width: isMobile ? double.infinity : 300,
                          child: _inputField('Email'),
                        ),
                        SizedBox(
                          width: isMobile ? double.infinity : 300,
                          child: _inputField('Phone Number'),
                        ),
                        SizedBox(
                          width: isMobile ? double.infinity : 300,
                          child: _dropdownField(),
                        ),
                        SizedBox(
                          width: isMobile ? double.infinity : 300,
                          child: _inputField('Timeline'),
                        ),
                        SizedBox(
                          width: isMobile ? double.infinity : 300,
                          child: _inputField('Project Details...', maxLines: 4),
                        ),
                        Container(
                          alignment: isMobile ? Alignment.center : Alignment.centerRight,
                          width: isMobile ? double.infinity : 620,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.grey),
                              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                            ),
                            child: Text(
                              'Send',
                              style: GoogleFonts.montserrat(color: Colors.white),
                            ),
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
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildFooter() {
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
            style: GoogleFonts.montserrat(
              fontSize: 24,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 24,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              TextButton(
                child: Text('Home', style: GoogleFonts.montserrat(color: Colors.white)),
                onPressed: () {
                  _scrollToSection(homeKey);
                },
              ),
              TextButton(
                child: Text('Services', style: GoogleFonts.montserrat(color: Colors.white)),
                onPressed: () {
                  _scrollToSection(servicesKey);
                },
              ),
              TextButton(
                child: Text('About me', style: GoogleFonts.montserrat(color: Colors.white)),
                onPressed: () {
                  _scrollToSection(aboutKey);
                },
              ),
              TextButton(
                child: Text('Projects', style: GoogleFonts.montserrat(color: Colors.white)),
                onPressed: () {
                  _scrollToSection(projectKey);
                },
              ),
              TextButton(
                child: Text('Contact me', style: GoogleFonts.montserrat(color: Colors.white)),
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
            children: const [Icon(FontAwesomeIcons.instagram, color: Colors.white, size: 20), Icon(FontAwesomeIcons.linkedin, color: Colors.white, size: 20)],
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
                  const Icon(Icons.email, color: Colors.white, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    'ajinkya446@gmail.com',
                    style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.phone, color: Colors.white, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    '+91 0000 0000 00',
                    style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14),
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
            style: GoogleFonts.montserrat(color: Colors.grey.shade600, fontSize: 12),
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
