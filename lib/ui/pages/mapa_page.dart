import 'dart:async';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:seccion10_fluttercourse/models/models.dart';

class MapaPage extends StatefulWidget {
  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();

  List<MapType> mapType = [
    MapType.terrain,
    MapType.normal,
    MapType.satellite,
    MapType.hybrid,
  ];

  int mapTypeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition puntoInicial = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17.5,
      tilt: 50,
    );

    // Marcadores
    Set<Marker> markers = new Set<Marker>();
    markers.add(new Marker(
        markerId: MarkerId('geo-location'), position: scan.getLatLng()));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(CameraPosition(
                  target: scan.getLatLng(),
                  zoom: 17.5,
                  tilt: 50,
                )));
              },
              icon: Icon(Icons.my_location_outlined))
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        mapType: mapType[mapTypeIndex],
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: () {
          mapTypeIndex++;
          if (mapTypeIndex > mapType.length - 1) {
            mapTypeIndex = 0;
          }
          setState(() {});
        },
      ),
    );
  }
}
