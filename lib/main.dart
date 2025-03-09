import 'package:WeathFul/Providers/CityProvider.dart';
import 'package:WeathFul/WeatherScreen/Screens/WeatherScreen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => CityProvider(),
      child: const WeatherApp(),
    ));

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => WeatherAppState();
}

class WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherAppScreen(),
    );
  }
}
