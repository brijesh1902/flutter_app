import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapPage(),
    );
  }
}

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();

}

class _MapPageState extends State<MapPage> {
  
  static const _initialCameraPosition = CameraPosition(
      target: LatLng(19.232603, 73.149512),
      zoom: 12);
  Completer<GoogleMapController> completer = Completer();
  List<Marker> markers = [];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    initialise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _initialCameraPosition,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: true,
      zoomGesturesEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        completer.complete(controller);
      },
      markers: markers.map((e) => e).toSet(),
    );
  }

  void initialise() {
    Marker marker = Marker(
        markerId: const MarkerId('Me'),
        position: const LatLng(19.232603, 73.149512),
        infoWindow: const InfoWindow(title: 'My Location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)
    );
    Marker marker1 = Marker(
      markerId: const MarkerId('market'),
      position: const LatLng(19.233793, 73.162168),
      infoWindow: const InfoWindow(title: 'Gajanand Market'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
    );
    Marker marker2 = Marker(
        markerId: const MarkerId('bazar'),
        position: const LatLng(19.229632, 73.165204),
        infoWindow: const InfoWindow(title: 'Press Bazar'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
    );
    Marker marker3 = Marker(
        markerId: const MarkerId('garden'),
        position: const LatLng(19.229999, 73.160124),
        infoWindow: const InfoWindow(title: 'Sapna Garden'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
    );

    setState(() {
      markers.add(marker);
      markers.add(marker1);
      markers.add(marker2);
      markers.add(marker3);
    });
  }

}