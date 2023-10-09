import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapDemo extends StatefulWidget {
  const GoogleMapDemo({super.key});

  @override
  State<GoogleMapDemo> createState() => _GoogleMapDemoState();
}

class _GoogleMapDemoState extends State<GoogleMapDemo> {
  double latitude = 0.0;
  double longitude = 0.0;

  getLocation() async {
    try {
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
       await Geolocator.requestPermission();
      } else {
        final location = await Geolocator.getCurrentPosition();
        setState(() {
          latitude = location.latitude;
          longitude = location.longitude;

          print('LATITUDE$latitude');
          print('LONGITUDE$longitude');
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.gps_fixed),
        onPressed: () {
          getLocation();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('LATITUDE   $latitude  LONGITUDE   $longitude')));
        },
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(latitude, longitude), zoom: 0),
          zoomControlsEnabled: false,
        ),
      ),
    );
  }
}
