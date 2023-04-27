import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s10_qr_reader/utils/utils.dart';
import '../models/models.dart' show QRCodeScan;
import '../providers/providers.dart' show ScansListProvider;
import '../themes/app_themes.dart';

class ScansList extends StatelessWidget {

  final String type;

  const ScansList({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ScansListProvider scansProvider = Provider.of<ScansListProvider>(context);
    final List<QRCodeScan> scans = scansProvider.currentScans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, index) {
          final QRCodeScan scan = scans[index];

          return Dismissible(
            key: UniqueKey(),
            background: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              padding: const EdgeInsets.only(right: 40),
              child: const Text('Eliminar', style: TextStyle(color: Colors.white))
            ),
            onDismissed: (_) => scansProvider.deleteScanById(scan.id!),
            child: ListTile(
                leading: type == QRCodeScan.url
                    ? const Icon(Icons.http_rounded, color: AppThemes.primaryColor)
                    : const Icon(Icons.map_rounded, color: AppThemes.primaryColor),
                title: Text(scan.value),
                subtitle: Text('ID: ${scan.id}'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () => executeScanAction(context, scan)
            ),
          );
        }
    );
  }
}
