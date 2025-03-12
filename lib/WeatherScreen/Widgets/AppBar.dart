import 'package:WeathFul/MainWidgets/Widgets/Drawer.dart';
import 'package:WeathFul/WeatherScreen/Widgets/Navigation.bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_appbar/components/appbar_behavior.dart';
import 'package:flutter_appbar/widgets/appbar_connection.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter_appbar/components/appbar.dart' as CustomAppBar;

class AppBarWeathFul extends StatefulWidget {
  final Widget child;
  final bool isChanged;
  final int index;
  const AppBarWeathFul(
      {super.key,
      required this.child,
      required this.isChanged,
      required this.index});

  @override
  State<StatefulWidget> createState() => AppBarWeathFulState();
}

class AppBarWeathFulState extends State<AppBarWeathFul> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
                  child: Row(
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
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: NavigationBarAppBar(
                              isChanged: widget.isChanged,
                              index: widget.index,
                            )),
                        IconButton(
                            onPressed: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                            icon: const Icon(
                              BoxIcons.bx_question_mark,
                              size: 25,
                              color: Colors.white,
                            )),
                      ])),
            )
          ],
          child: widget.child,
        ));
  }
}
