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

  liveLocation() async {
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
        });
      }
    } catch (e) {
      print(e);
    }
  }

  // Future<Position> getLocation() async {
  //   try {
  //     final permission = await Geolocator.checkPermission();
  //     if (permission == LocationPermission.denied) {
  //       await Geolocator.requestPermission();
  //     } else {
  //       final location = await Geolocator.getCurrentPosition();
  //       return location;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   throw Exception('EXCEPTION EXICUTED');
  // }

  @override
  void initState() {
    super.initState();
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
