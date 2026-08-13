import 'browser_utils.dart';

class Utils {
  Future<void> downloadPDF() async {
    await downloadPDFFromAsset('assets/ajinkya_resume.pdf', 'Ajinkya_Aher_resume_2026.pdf');
  }

  void launchEmail() {
    final String email = 'ajinkya446@gmail.com';
    final String subject = Uri.encodeComponent('Hire Request');
    final String body = Uri.encodeComponent('Hello Ajinkya,');

    final String mailtoLink = 'mailto:$email?subject=$subject&body=$body';
    openExternalLink(mailtoLink);
  }
}
