import 'dart:html';
import 'package:flutter/services.dart';

void openExternalLink(String url) {
  window.open(url, '_blank');
}

Future<void> downloadPDFFromAsset(String assetPath, String fileName) async {
  final bytes = await rootBundle.load(assetPath);
  final list = bytes.buffer.asUint8List();
  final blob = Blob([list]);
  final url = Url.createObjectUrlFromBlob(blob);
  final anchor = AnchorElement(href: url)
    ..style.display = 'none'
    ..download = fileName
    ..click();
  Url.revokeObjectUrl(url);
  anchor.remove();
}
