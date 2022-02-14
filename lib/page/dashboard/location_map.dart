// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/service/get_location_data.dart';

class LocationDialog extends StatefulWidget {
  @override
  State<LocationDialog> createState() => LocationDialogState();
}

class LocationDialogState extends State<LocationDialog> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(Provider.of<GetLocation>(context, listen: true).getlat!,
          Provider.of<GetLocation>(context, listen: true).getlon!),
      zoom: 12.4746,
    );
    final CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(Provider.of<GetLocation>(context, listen: true).getlat!,
            Provider.of<GetLocation>(context, listen: true).getlon!),
        tilt: 59.440717697143555,
        zoom: 17.151926040649414);
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Location'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        padding: const EdgeInsets.all(0),
        indoorViewEnabled: true,
        trafficEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black38,
        onPressed: () async {
          final GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
        },
        label: Text('Your Location'),
        icon: Icon(Icons.location_on_rounded),
      ),
    );
  }
}
