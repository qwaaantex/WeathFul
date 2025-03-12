import 'package:WeathFul/Providers/CityProvider.dart';
import 'package:WeathFul/TownsScreen/Screens/TownsScreen.dart';
import 'package:WeathFul/WeatherScreen/Screens/WeatherScreenMain.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class WeatherAppScreen extends StatefulWidget {
  final bool isChanged;
  final int index;
  final PageController controller;
  const WeatherAppScreen(
      {super.key,
      required this.isChanged,
      required this.index,
      required this.controller});

  @override
  State<WeatherAppScreen> createState() => WeatherAppScreenState();
}

class WeatherAppScreenState extends State<WeatherAppScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final List Messages = List.generate(10, (i) {
    switch (i) {
      case 1:
        return "";
      default:
        return 'Ошибка';
    }
  });
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    final cityProvider = Provider.of<CityProvider>(context);
    String cityName = cityProvider.cityName;
    return Scaffold(
      body: IndexedStack(index: currentindex, children: [
        WeatherScreenMain(
          isChanged: widget.isChanged,
          index: widget.index,
        ),
        TownScreenApp(
          cityName: cityName,
          isChanged: widget.isChanged,
          index: widget.index,
          controller: widget.controller,
        ),
      ]),
    );
  }
}
