import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import 'package:seccion10_fluttercourse/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.filter_center_focus),
        onPressed: () async {
          // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR);
          final barcodeScanRes = 'https://google.com';

          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          scanListProvider.createScan(barcodeScanRes);
          scanListProvider.createScan('geo:15.33,15.66');
        });
  }
}
