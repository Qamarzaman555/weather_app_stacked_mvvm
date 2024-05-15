import 'package:flutter/material.dart';

import 'views/akora_weather_vu/akora_weather_vu.dart';
// import 'views/splash/splash_vu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AkoraWeatherScreenVU());
  }
}
