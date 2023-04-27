import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:s10_qr_reader/models/models.dart';

class MapPage extends StatefulWidget {

	static const route = 'map_page';

	const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

	final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
	MapType _mapType = MapType.normal;

	@override
	Widget build(BuildContext context) {

		final QRCodeScan scan = ModalRoute.of(context)?.settings.arguments as QRCodeScan;

		CameraPosition initialPosition = CameraPosition(
			target: scan.latLng,
			zoom: 17.5,
			tilt:20
		);

		Set<Marker> markers = <Marker>{};
		markers.add(
			Marker(
				markerId: const MarkerId('act-location'),
				position: scan.latLng,
				onTap: () => print(scan.latLng),
			)
		);

  	return Scaffold(
			appBar: AppBar(
				centerTitle: Platform.isIOS ? true : false,
				title: const Text('Map'),
				actions: [
					IconButton(
							onPressed: () => _goToCameraPosition(initialPosition),
							icon: const Icon(Icons.location_searching_outlined)
					)
				],
			),
    	body: GoogleMap(
				mapType: _mapType,
				initialCameraPosition: initialPosition,
				markers: markers,
				zoomControlsEnabled: false,
				onMapCreated: (GoogleMapController controller) {
					_controller.complete(controller);
				}
			),
			floatingActionButton: FloatingActionButton(
				onPressed: () => setState(() {
						_mapType == MapType.normal ? _mapType = MapType.satellite : _mapType = MapType.normal;
					}
				),
				child: const Icon(Icons.layers_rounded),
			),
			floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
		);
	}

	Future<void> _goToCameraPosition(CameraPosition cameraPosition) async {
		final GoogleMapController controller = await _controller.future;
		controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
	}
}