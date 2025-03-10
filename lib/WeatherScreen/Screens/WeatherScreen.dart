import 'package:WeathFul/Providers/CityProvider.dart';
import 'package:WeathFul/TownsScreen/Screens/TownsScreen.dart';
import 'package:WeathFul/WeatherScreen/Screens/WeatherScreenMain.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class WeatherAppScreen extends StatefulWidget {
  const WeatherAppScreen({super.key});

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
        bottomNavigationBar: ConvexAppBar(
          height: 60,
          color: Colors.grey,
          backgroundColor: Colors.grey[900],
          activeColor: Colors.grey[600],
          items: const [
            TabItem(icon: Bootstrap.sun, title: 'Погода'),
            TabItem(
              icon: BoxIcons.bx_building_house,
              title: 'Города',
            ),
          ],
          onTap: (i) {
            setState(() {
              currentindex = i;
            });
          },
        ),
        body: SafeArea(
          child: IndexedStack(index: currentindex, children: [
            const WeatherScreenMain(),
            TownScreenApp(
              cityName: cityName,
            ),
          ]),
        ));
  }
}
