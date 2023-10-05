import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapDemo extends StatefulWidget {
  const GoogleMapDemo({super.key});

  @override
  State<GoogleMapDemo> createState() => _GoogleMapDemoState();
}

class _GoogleMapDemoState extends State<GoogleMapDemo> {
  static final LatLng _kMapCenter = LatLng(42.361145, -71.057083);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(40),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.gps_fixed),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: GoogleMap(
          initialCameraPosition: CameraPosition(target: _kMapCenter, zoom: 2)),
    );
  }
}
