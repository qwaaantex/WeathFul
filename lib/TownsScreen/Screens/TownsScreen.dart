import 'package:WeathFul/MainWidgets/Widgets/Drawer.dart';
import 'package:WeathFul/Providers/CityProvider.dart';
import 'package:WeathFul/WeatherScreen/Screens/WeatherScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appbar/flutter_appbar.dart';

import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:flutter_appbar/components/appbar.dart' as CustomAppBar;

class TownScreenApp extends StatefulWidget {
  final String cityName;
  const TownScreenApp({super.key, required this.cityName});

  @override
  State<TownScreenApp> createState() => TownsScreenAppState();
}

class TownsScreenAppState extends State<TownScreenApp> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final List Towns = List.generate(20, (int i) {
    switch (i) {
      case 1:
        return 'Москва';
      case 2:
        return 'Санкт-Петербург';
      case 3:
        return 'Рязань';
      case 4:
        return 'Тверь';
      case 5:
        return 'Ярославль';
      case 6:
        return 'Курган';
      case 7:
        return 'Тюмень';
      case 8:
        return 'Челябинск';
      case 9:
        return 'Екатеринбург';
      case 10:
        return 'Ханты-Мансийский автономный округ';
      case 11:
        return 'Алтай';
      case 12:
        return 'Иркутск';
      case 13:
        return 'Красноярск';
      case 14:
        return 'Омск';
      case 15:
        return 'Кемерово';
      case 16:
        return 'Владивосток';
      case 17:
        return 'Хабаровск';
      case 18:
        return 'Находка';
      case 19:
        return 'Славянка';

      default:
        return 'Ошибка';
    }
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        endDrawer: const DrawerPage(),
        body: SafeArea(
            child: AppBarConnection(
                appBars: [
              CustomAppBar.AppBar(
                behavior: const MaterialAppBarBehavior(floating: true),
                body: Container(
                    height: 55,
                    color: Colors.grey[850],
                    alignment: Alignment.center,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "WeathFul",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'RobotoMono'),
                                  ),
                                ),
                                const IconButton(
                                    onPressed: null,
                                    icon: Icon(
                                      BoxIcons.bx_search_alt,
                                      size: 25,
                                      color: Colors.white,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      scaffoldKey.currentState?.openEndDrawer();
                                    },
                                    icon: const Icon(
                                      BoxIcons.bx_menu_alt_right,
                                      size: 25,
                                      color: Colors.white,
                                    )),
                              ]),
                        ])),
              )
            ],
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.grey[850]),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        const SizedBox(
                          height: 5,
                        ),
                        switch (index) {
                          0 => const Text(
                              "Центральная Россия",
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          5 => const Text(
                              "Урал",
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          10 => const Text(
                              "Сибирь",
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          15 => const Text(
                              "Дальний Восток",
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          _ => Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 2),
                              // ignore: deprecated_member_use
                              color: Colors.grey.withOpacity(0.3),
                              child: ListTile(
                                  trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        Provider.of<CityProvider>(context,
                                                listen: false)
                                            .updateTown(Towns[index]);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    const WeatherAppScreen()));
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                  subtitle: const Text(
                                    "Нажмите, чтобы выбрать..",
                                    style: TextStyle(color: Colors.white38),
                                  ),
                                  title: Text(
                                    Towns[index],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  )),
                            ),
                        },
                      ]);
                    },
                    itemCount: Towns.length,
                  ),
                ]))));
  }
}
