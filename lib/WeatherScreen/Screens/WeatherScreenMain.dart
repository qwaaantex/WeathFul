import 'package:WeathFul/MainWidgets/Widgets/Drawer.dart';
import 'package:WeathFul/Providers/CityProvider.dart';
import 'package:WeathFul/WeatherScreen/Widgets/Day.dart';
import 'package:WeathFul/WeatherScreen/Widgets/Name.dart';
import 'package:WeathFul/WeatherScreen/Widgets/Temperature.dart';
import 'package:WeathFul/WeatherScreen/Widgets/TemperatureFiveDays.dart';
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
        endDrawer: const DrawerPage(),
        body: AppBarConnection(
          appBars: [
            CustomAppBar.AppBar(
              behavior: const MaterialAppBarBehavior(floating: true),
              body: Container(
                  height: 55,
                  color: Colors.grey[900],
                  child: Stack(children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: () {
                              scaffoldKey.currentState?.openEndDrawer();
                            },
                            icon: const Icon(
                              BoxIcons.bx_menu_alt_right,
                              size: 25,
                              color: Colors.white,
                            ))),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/images/Logo.png",
                          scale: 12,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "WeathFul",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'RobotoMono'),
                            )),
                      ],
                    )
                  ])),
            )
          ],
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[850],
              ),
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
        ));
  }
}
