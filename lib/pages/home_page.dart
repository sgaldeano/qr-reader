import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart' show QRCodeScan;
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {

  static const String route = 'home_page';

	const HomePage({super.key});

	@override
	Widget build(BuildContext context) {
  	return Scaffold(
			appBar: AppBar(
				elevation: 0,
				centerTitle: Platform.isIOS ? true : false,
				title: const Text('Historial'),
				actions: [
					IconButton(
						icon: const Icon(Icons.delete_forever),
						onPressed: () => Provider.of<ScansListProvider>(context, listen: false).deleteAllScans()
					),
				]
			),
    	body: const _HomePageBody(),
			bottomNavigationBar: const CustomNavigationBar(),
			floatingActionButton: const ScanButton(),
			floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
		);
	}

}

class _HomePageBody extends StatelessWidget {

  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
		final uiProvider = Provider.of<UIProvider>(context);

		final ScansListProvider scansProvider = Provider.of<ScansListProvider>(context, listen: false);

		switch(uiProvider.selectedMenuOption) {
			case 0:
				scansProvider.loadScansByType(QRCodeScan.geolocation);
				return const ScansList(type: QRCodeScan.geolocation);

			case 1:
				scansProvider.loadScansByType(QRCodeScan.url);
				return const ScansList(type: QRCodeScan.url);

			default:
				scansProvider.loadScansByType(QRCodeScan.geolocation);
				return const ScansList(type: QRCodeScan.geolocation);
		}
  }
}
