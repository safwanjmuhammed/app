import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapDemo extends StatefulWidget {
  const GoogleMapDemo({super.key});

  @override
  State<GoogleMapDemo> createState() => _GoogleMapDemoState();
}

class _GoogleMapDemoState extends State<GoogleMapDemo> {
  static final LatLng _kMapCenter =
      LatLng(19.018255973653343, 72.84793849278007);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          GoogleMap(initialCameraPosition: CameraPosition(target: _kMapCenter)),
    );
  }
}
