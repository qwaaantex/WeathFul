import 'package:flutter/material.dart';
import 'package:flutter_appbar/components/appbar_behavior.dart';
import 'package:flutter_appbar/widgets/appbar_connection.dart';
import 'package:flutter_learn/MainWidgets/Widgets/Drawer.dart';
import 'package:flutter_learn/Providers/CityProvider.dart';
import 'package:flutter_learn/WeatherScreen/Widgets/Day.dart';
import 'package:flutter_learn/WeatherScreen/Widgets/Name.dart';
import 'package:flutter_learn/WeatherScreen/Widgets/Temperature.dart';
import 'package:flutter_learn/WeatherScreen/Widgets/TemperatureFiveDays.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:flutter_appbar/components/appbar.dart' as CustomAppBar;

class WeatherScreenMain extends StatefulWidget {
  const WeatherScreenMain({super.key});

  @override
  State<WeatherScreenMain> createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreenMain> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final cityProvider = Provider.of<CityProvider>(context);
    String cityName = cityProvider.cityName;
    return Scaffold(
        key: scaffoldKey,
        drawer: const DrawerPage(),
        body: SafeArea(
            child: AppBarConnection(
          appBars: [
            CustomAppBar.AppBar(
              behavior: const MaterialAppBarBehavior(floating: true),
              body: Container(
                  height: 55,
                  color: Colors.purple.shade500,
                  alignment: Alignment.center,
                  child: Stack(children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            onPressed: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                            icon: const Icon(
                              BoxIcons.bx_menu_alt_left,
                              size: 25,
                              color: Colors.white,
                            ))),
                    const Center(
                        child: Text(
                      "WeathFul",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'RobotoMono'),
                    )),
                  ])),
            )
          ],
          child: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.purpleAccent, Colors.deepPurple])),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Day(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Name(nameCity: cityName),
                    ),
                    Temperature(
                      nameCity: cityName,
                    ),
                    TemperatureFiveDays(cityName: cityName)
                  ],
                )
              ],
            ),
          ]),
        )));
  }
}
