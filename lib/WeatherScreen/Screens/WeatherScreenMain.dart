import 'package:WeathFul/MainWidgets/Widgets/Drawer.dart';
import 'package:WeathFul/Providers/CityProvider.dart';
import 'package:WeathFul/WeatherScreen/Screens/WeatherScreenRules.dart';
import 'package:WeathFul/WeatherScreen/Widgets/AppBar.dart';
import 'package:WeathFul/WeatherScreen/Widgets/Humidaty.dart';
import 'package:WeathFul/WeatherScreen/Widgets/Name.dart';
import 'package:WeathFul/WeatherScreen/Widgets/Sunny.dart';
import 'package:WeathFul/WeatherScreen/Widgets/Temperature.dart';
import 'package:WeathFul/WeatherScreen/Widgets/TemperatureFiveDays.dart';
import 'package:WeathFul/WeatherScreen/Widgets/Winds.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class WeatherScreenMain extends StatefulWidget {
  const WeatherScreenMain({super.key});

  @override
  State<WeatherScreenMain> createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreenMain> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Uri _url = Uri.parse('https://yandex.ru/pogoda/');
  @override
  Widget build(BuildContext context) {
    final cityProvider = Provider.of<CityProvider>(context);
    String cityName = cityProvider.cityName;
    return Scaffold(
        key: scaffoldKey,
        drawer: const DrawerPage(),
        body: AppBarWeathFul(
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
                    Column(children: [
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                              child: Text(
                            "ВЛАЖНОСТЬ ВОЗДУХА",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          Humidaty(
                            nameCity: cityName,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                if (!await launchUrl(_url)) {
                                  throw Exception('Could not launch $_url');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade800,
                                overlayColor: Colors.transparent,
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.9,
                                    MediaQuery.of(context).size.height * 0.05),
                              ),
                              child: const Row(children: [
                                Text(
                                  'ПОДРОБНЫЙ ПРОГНОЗ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                )
                              ])),
                          const SizedBox(
                            height: 10,
                          ),
                          const Center(
                              child: Text(
                            "СКОРОСТЬ ВЕТРА",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          Winds(
                            nameCity: cityName,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "ВОСХОД И ЗАКАТ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Sunny(),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Создано с поддержкой WeathFul.",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 200),
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          const WeatherScreenRules(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      }),
                                );
                              },
                              style: TextButton.styleFrom(
                                  overlayColor: Colors.transparent),
                              child: const Text(
                                "Используя приложение,\n вы автоматические соглашаетесь с \nнашими правилами",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                          TextButton(
                              style: const ButtonStyle(
                                  splashFactory: NoSplash.splashFactory),
                              onPressed: () async {
                                if (!await launchUrl(_url)) {
                                  throw Exception('Could not launch $_url');
                                }
                              },
                              child: const Text(
                                "Ещё..",
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 14),
                              ))
                        ],
                      ))
                    ])
                  ],
                )
              ])
            ],
          ),
        ));
  }
}
