import 'dart:async';

import 'package:flutter/material.dart';
import '../models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)?.settings.arguments as ScanModel;
    final CameraPosition puntoIncial =
        CameraPosition(target: scan.getLatLng(), zoom: 17, tilt: 50);

    Set<Marker> markers = <Marker>{};
    markers.add(
      Marker(
          markerId: const MarkerId('geo-location'), position: scan.getLatLng()),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: scan.getLatLng(), zoom: 17.5, tilt: 50)));
              },
              icon: Icon(Icons.location_disabled))
        ],
      ),
      body: GoogleMap(
        //myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        mapType: mapType,
        initialCameraPosition: puntoIncial,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else {
            mapType = MapType.normal;
          }
          setState(() {});
        },
      ),
    );
  }
}
