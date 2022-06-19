import 'package:flutter/material.dart';
import 'package:razdel10_practica/screens/location_screen.dart';
import 'package:razdel10_practica/screens/weather_forecast_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationScreen(),
    );
  }
}