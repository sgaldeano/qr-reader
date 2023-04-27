import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/models.dart' show QRCodeScan;
import '../routing/app_routes.dart';

Future<void> executeScanAction(BuildContext context, QRCodeScan scan) async {
  if (scan.type == QRCodeScan.url) {
    final url = Uri.parse(scan.value);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  } else {
    Navigator.pushNamed(context, AppRoutes.mapPage, arguments: scan);
  }
}