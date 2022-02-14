import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetLocation extends ChangeNotifier {
  String? city = "Loding..";
  String? country = "Loding..";
  double? lat;
  double? lon;
  String? get getcity => city;
  String? get getcountry => country;
  double? get getlat => lat;
  double? get getlon => lon;

  Future GetLocationData() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable Your Location Service');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];

      city = place.locality;
      country = place.country;
      lon = position.longitude;
      lat = position.latitude;
      print(place.locality);
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  Future UpdateLocation(cityName) async {
    city = cityName;
    notifyListeners();
  }
}
