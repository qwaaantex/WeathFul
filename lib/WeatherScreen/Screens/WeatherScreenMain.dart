import 'package:WeathFul/MainWidgets/Widgets/Drawer.dart';
import 'package:WeathFul/Providers/CityProvider.dart';
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
  final bool isChanged;
  final int index;
  const WeatherScreenMain(
      {super.key, required this.isChanged, required this.index});

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
          isChanged: widget.isChanged,
          index: widget.index,
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
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Text(
                            "Влажность воздуха",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          Humidaty(),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Text(
                            "Скорость ветра",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          Winds(),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Восход солнца",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Sunny(),
                          SizedBox(
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
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
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
