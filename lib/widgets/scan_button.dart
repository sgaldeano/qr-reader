import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:s10_qr_reader/providers/providers.dart';

import '../utils/utils.dart';

class ScanButton extends StatelessWidget {

  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.qr_code_scanner_outlined),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#FF0000', 'Cancelar', false, ScanMode.QR);

        // The value -1 means that the user canceled the scan manually before it finished
        if (barcodeScanRes != '-1') {
          final ScansListProvider scansProvider = Provider.of<ScansListProvider>(context, listen: false);
          scansProvider.newScan(barcodeScanRes).then((scan) => executeScanAction(context, scan));
        }
      }
    );
  }
}