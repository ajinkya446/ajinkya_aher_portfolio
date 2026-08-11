import 'package:web/web.dart' as web;
import 'dart:js_interop';
import 'package:flutter/services.dart';

class Utils {
  Future<void> downloadPDF() async {
    final ByteData bytes = await rootBundle.load('assets/ajinkya_resume.pdf');
    final Uint8List list = bytes.buffer.asUint8List();

    final blob = web.Blob([list.toJS].toJS);
    final url = web.URL.createObjectURL(blob);
    final anchor = web.document.createElement('a') as web.HTMLAnchorElement;
    anchor.href = url;
    anchor.download = 'Ajinkya_Aher_resume_2026.pdf';
    anchor.click();
    web.URL.revokeObjectURL(url);
  }

  void launchEmail() {
    final String email = 'ajinkya446@gmail.com';
    final String subject = Uri.encodeComponent('Hire Request');
    final String body = Uri.encodeComponent('Hello Ajinkya,');

    final String mailtoLink = 'mailto:$email?subject=$subject&body=$body';

    final web.HTMLAnchorElement anchor = web.document.createElement('a') as web.HTMLAnchorElement;
    anchor.href = mailtoLink;
    anchor.target = '_self';
    anchor.click();
  }
}
