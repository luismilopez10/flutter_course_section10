import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:seccion10_fluttercourse/providers/scan_list_provider.dart';
import 'package:seccion10_fluttercourse/utils/utils.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.filter_center_focus),
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#3D8BEF', 'Cancelar', false, ScanMode.QR);

          // Simular lectura de QR en el emulador:
          // final barcodeScanRes = 'https://google.com';
          // final barcodeScanRes = 'geo:45.287135,-75.920226';

          if (barcodeScanRes == -1) {
            return;
          }

          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          final nuevoScan = await scanListProvider.createScan(barcodeScanRes);

          launchURL(context, nuevoScan);
        });
  }
}
