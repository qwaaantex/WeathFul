import 'package:WeathFul/Providers/CityProvider.dart';
import 'package:WeathFul/Providers/NavigationProvider.dart';
import 'package:WeathFul/TownsScreen/Screens/TownsScreen.dart';
import 'package:WeathFul/WeatherScreen/Screens/WeatherScreen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CityProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: const WeatherApp(),
    ));

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => WeatherAppState();
}

class WeatherAppState extends State<WeatherApp> {
  final PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final cityProvider = Provider.of<CityProvider>(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);
    String cityName = cityProvider.cityName;

    return MaterialApp(
      home: PageView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (changed) {
            navigationProvider.updatePage(changed);
          },
          children: [
            WeatherAppScreen(
              controller: _controller,
            ),
            TownScreenApp(
              cityName: cityName,
              controller: _controller,
            )
          ]),
    );
  }
}
