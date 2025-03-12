import 'package:WeathFul/Providers/CityProvider.dart';
import 'package:WeathFul/TownsScreen/Screens/TownsScreen.dart';
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
  bool isChanged = true;
  int index = 0;
  final PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final cityProvider = Provider.of<CityProvider>(context);
    String cityName = cityProvider.cityName;
    return MaterialApp(
      home: PageView(
          physics: AlwaysScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (changed) {
            if (isChanged) {
              setState(() {
                index = index + 1;
              });
              isChanged = false;
            } else {
              setState(() {
                index = index - 1;
              });
              isChanged = true;
            }
          },
          children: [
            WeatherAppScreen(
              isChanged: isChanged,
              index: index,
              controller: _controller,
            ),
            TownScreenApp(
              cityName: cityName,
              isChanged: isChanged,
              index: index,
              controller: _controller,
            )
          ]),
    );
  }
}
