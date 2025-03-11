import 'package:WeathFul/MainWidgets/Widgets/Drawer.dart';
import 'package:WeathFul/Providers/CityProvider.dart';
import 'package:WeathFul/WeatherScreen/Widgets/Humidaty.dart';
import 'package:WeathFul/WeatherScreen/Widgets/Name.dart';
import 'package:WeathFul/WeatherScreen/Widgets/Navigation.bar.dart';
import 'package:WeathFul/WeatherScreen/Widgets/Sunny.dart';
import 'package:WeathFul/WeatherScreen/Widgets/Temperature.dart';
import 'package:WeathFul/WeatherScreen/Widgets/TemperatureFiveDays.dart';
import 'package:WeathFul/WeatherScreen/Widgets/Winds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appbar/components/appbar_behavior.dart';
import 'package:flutter_appbar/widgets/appbar_connection.dart';

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
        body: AppBarConnection(
          appBars: [
            CustomAppBar.AppBar(
                behavior: const MaterialAppBarBehavior(floating: true),
                body: Container(
                  height: 90,
                  color: Colors.grey[850],
                  child: Stack(clipBehavior: Clip.none, children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                              icon: const Icon(
                                BoxIcons.bx_menu_alt_left,
                                size: 25,
                                color: Colors.white,
                              )),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(child: NavigationBarAppBar()),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                              icon: const Icon(
                                BoxIcons.bx_question_mark,
                                size: 25,
                                color: Colors.white,
                              )),
                        ])
                  ]),
                ))
          ],
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              ListView(children: [
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
                        TemperatureFiveDays(cityName: cityName),
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                            child: Text(
                          "Влажность воздуха",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Humidaty(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                            child: Text(
                          "Скорость ветра",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Winds(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                            child: Text(
                          "Восход солнца",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Sunny(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Создано с поддержкой WeathFul.",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Text(
                              "Ещё",
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 14),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ])
            ],
          ),
        ));
  }
}
