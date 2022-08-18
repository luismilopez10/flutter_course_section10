import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:seccion10_fluttercourse/models/models.dart';

Future<void> launchURL(BuildContext context, ScanModel scan) async {
  final Uri _url = Uri.parse(scan.valor);

  if (scan.tipo == 'http') {
    // Abrir el sitio web
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
