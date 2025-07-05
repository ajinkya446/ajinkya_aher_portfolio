import 'dart:html' as html;

import 'package:flutter/services.dart';

class Utils {
  Future<void> downloadPDF() async {
    final ByteData bytes = await rootBundle.load('assets/ajinkya_resume.pdf');
    final Uint8List list = bytes.buffer.asUint8List();

    final blob = html.Blob([list]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.AnchorElement(href: url)
      ..setAttribute('download', 'Ajinkya_Aher_CV.pdf')
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  void launchEmail() {
    final String email = 'ajinkya446@gmail.com';
    final String subject = Uri.encodeComponent('Hire Request');
    final String body = Uri.encodeComponent('Hello Ajinkya,');

    final String mailtoLink = 'mailto:$email?subject=$subject&body=$body';

    final html.AnchorElement anchor = html.AnchorElement(href: mailtoLink)
      ..target = '_self'
      ..click();
  }
}
