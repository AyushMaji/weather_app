import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class GetWeatherData extends ChangeNotifier {
  String? temp = "0.0";
  String? mintemp;
  String? maxtemp;
  String? feeltemp = "0.0";
  String? description = "loding..";
  String? icon = "50d";
  String? pressure;
  String? humidity;
  String? visibility;
  String? windSpeed;
  String? sunrise;
  String? sunset;
  String? country;
  String? city;
  String? lon;
  String? lat;
  String? time = "Lod..";
  String? winddeg;

  String? get gettemp => temp;
  String? get getmintemp => mintemp;
  String? get getmaxtemp => maxtemp;
  String? get getfeeltemp => feeltemp;
  String? get getdescription => description;
  String? get geticon => icon;
  String? get getpressure => pressure;
  String? get gethumidity => humidity;
  String? get getvisibility => visibility;
  String? get getwindSpeed => windSpeed;
  String? get getsunrise => sunrise;
  String? get getsunset => sunset;
  String? get getcity => city;
  String? get getlon => lon;
  String? get getlat => lat;
  String? get gettime => time;
  String? get getcountry => country;
  String? get getwinddeg => winddeg;

  Future getData(cityName) async {
    try {
      var apikey = "390a80c6b8f3dc881ddb193cb56d8b0a&units=metric";
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey');
      http.Response response = await http.get(url);
      var results = jsonDecode(response.body);
      if (results != null) {
        var date = DateTime.now();
        temp = results['main']['temp'].toString();
        mintemp = results['main']['temp_min'].toString();
        maxtemp = results['main']['temp_max'].toString();
        feeltemp = results['main']['feels_like'].toString();
        description = results['weather'][0]['description'].toString();
        icon = results['weather'][0]['icon'].toString().replaceAll("n", "d");
        pressure = results['main']['pressure'].toString();
        humidity = results['main']['humidity'].toString();
        visibility = results['visibility'].toString();
        windSpeed = results['wind']['speed'].toString();
        sunrise = results['sys']['sunrise'].toString();
        sunset = results['sys']['sunset'].toString();
        country = results['sys']['country'].toString();
        lat = results['coord']['lat'].toString();
        time = DateFormat('EEEE, d MMM').format(date).toString();
        lon = results['coord']['lon'].toString();
        winddeg = results['wind']['deg'].toString();
        print("${geticon}");
        print(response.body);
      } else {}
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }
}
