// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/page/splash/splash_page.dart';
import 'package:weather_app/service/get_location_data.dart';
import 'package:weather_app/service/get_weather_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GetWeatherData()),
        ChangeNotifierProvider(create: (_) => GetLocation()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SpalashPage(),
        //  DashBoardPage(),
      ),
    );
  }
}
