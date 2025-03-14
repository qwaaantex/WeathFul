import 'package:WeathFul/WeatherScreen/Widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:WeathFul/MainWidgets/Widgets/Drawer.dart';
import 'package:WeathFul/Providers/CityProvider.dart';

class TownScreenApp extends StatefulWidget {
  final String cityName;
  final PageController controller;

  const TownScreenApp({
    super.key,
    required this.cityName,
    required this.controller,
  });

  @override
  State<TownScreenApp> createState() => TownsScreenAppState();
}

class TownsScreenAppState extends State<TownScreenApp> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> Towns = List.generate(20, (int i) {
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
      body: AppBarWeathFul(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.grey[850]),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: Towns.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          switch (index) {
                            0 => const Text(
                                "Центральная Россия",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            5 => const Text(
                                "Урал",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            10 => const Text(
                                "Сибирь",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            15 => const Text(
                                "Дальний Восток",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            _ => Card(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 4,
                                ),
                                color: Colors.grey.withOpacity(0.3),
                                child: ListTile(
                                  trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        Provider.of<CityProvider>(context,
                                                listen: false)
                                            .updateTown(Towns[index]);
                                        widget.controller.animateToPage(
                                          0,
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.easeOutCubic,
                                        );
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  subtitle: const Text(
                                    "Нажмите, чтобы выбрать..",
                                    style: TextStyle(color: Colors.white38),
                                  ),
                                  title: Text(
                                    Towns[index],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                          },
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
