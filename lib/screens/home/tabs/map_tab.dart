import 'package:evently_app/location/location_service.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTab extends StatefulWidget {
  const MapTab({super.key});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  late GoogleMapController controller;

  CameraPosition initCamera = CameraPosition(
    target: LatLng(37.43296265331129, -122.08832357078792),
    zoom: 17,
  );

  late Set<Marker> markers = {
    Marker(markerId: MarkerId("1"), position: initCamera.target),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Position currentLocation = await LocationService.determinePosition();
          LatLng location = LatLng(
            currentLocation.latitude,
            currentLocation.longitude,
          );
          controller.animateCamera(CameraUpdate.newLatLngZoom(location, 15));
          markers.add(Marker(markerId: MarkerId("1"), position: location));
          setState(() {});

          // geocoding package
          print('current location is : ${currentLocation.toString()}');
          List<Placemark> placemarks = await placemarkFromCoordinates(
            currentLocation.latitude,
            currentLocation.longitude,
          );
          if (placemarks.isNotEmpty) {
            print('location is : ${placemarks[0].name}');
            print('location is : ${placemarks[0].country}');
            print('location is : ${placemarks[0].street}');
            print('location is : ${placemarks[0].administrativeArea}');
          }
        },
        child: Icon(Icons.location_searching, color: Colors.white),
      ),
      body: GoogleMap(
        markers: markers,
        initialCameraPosition: initCamera,
        onMapCreated: (GoogleMapController googleController) {
          controller = googleController;
        },
      ),
    );
  }
}
