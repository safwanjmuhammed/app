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
  GoogleMapController? googleMapController;

  void liveLocation() async {
    final permission = await Geolocator.checkPermission();
    final locationService = await Geolocator.isLocationServiceEnabled();
    try {
      if (permission == LocationPermission.denied || locationService == false) {
        await Geolocator.requestPermission();
      } else {
        Geolocator.getPositionStream(
                locationSettings:
                    const LocationSettings(accuracy: LocationAccuracy.high))
            .listen((position) {
          setState(() {
            latitude = position.latitude;
            longitude = position.longitude;
            print(latitude);
            print(longitude);
          });
          googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: LatLng(latitude, longitude), zoom: 15)));
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.gps_fixed),
        onPressed: () {
          liveLocation();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('LAT  $latitude  LON  $longitude'),
          ));
        },
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(latitude, longitude), zoom: 0),
          onMapCreated: (controller) {
            setState(() {
              googleMapController = controller;
            });
          },
          markers: {
            Marker(
                markerId: const MarkerId('Current User Location'),
                position: LatLng(latitude, longitude))
          },
          zoomControlsEnabled: false,
        ),
      ),
    );
  }
}
