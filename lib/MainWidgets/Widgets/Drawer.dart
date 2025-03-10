import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:icons_plus/icons_plus.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => DrawerState();
}

class DrawerState extends State<DrawerPage> {
  bool isOpenedHelped = false;
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Drawer(
          shape: const RoundedRectangleBorder(),
          backgroundColor: Colors.grey[850],
          width: MediaQuery.of(context).size.width * 0.75,
          child: ListView(children: [
            Container(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                padding: const EdgeInsets.only(bottom: 5, top: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.grey.shade800),
                child: ListTile(
                  splashColor: Colors.transparent,
                  onTap: () {},
                  leading: const Icon(
                    BoxIcons.bx_share_alt,
                    color: Colors.white70,
                  ),
                  title: const Text(
                    "Поделиться",
                    style: TextStyle(color: Colors.white70),
                  ),
                )),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                padding: const EdgeInsets.only(bottom: 5, top: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.grey.shade800),
                child: Column(children: [
                  ListTile(
                    splashColor: Colors.transparent,
                    onTap: () {},
                    leading: const Icon(
                      BoxIcons.bx_home,
                      size: 25,
                      color: Colors.white70,
                    ),
                    title: const Text(
                      "Погода",
                      style: TextStyle(color: Colors.white70),
                    ),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  ListTile(
                    splashColor: Colors.transparent,
                    onTap: () {},
                    leading: const Icon(
                      BoxIcons.bxs_city,
                      size: 25,
                      color: Colors.white70,
                    ),
                    title: const Text(
                      "Города",
                      style: TextStyle(color: Colors.white70),
                    ),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ])),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                padding: const EdgeInsets.only(bottom: 5, top: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.grey.shade800),
                child: Column(children: [
                  ListTile(
                    splashColor: Colors.transparent,
                    onTap: () {},
                    leading: const Icon(
                      BoxIcons.bx_time,
                      size: 25,
                      color: Colors.white70,
                    ),
                    title: const Text(
                      "Время",
                      style: TextStyle(color: Colors.white70),
                    ),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  ListTile(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      leading: const Icon(
                        BoxIcons.bx_calendar_event,
                        size: 25,
                        color: Colors.white70,
                      ),
                      title: const Text(
                        "Дата",
                        style: TextStyle(color: Colors.white70),
                      ),
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.transparent),
                      )

                      // ignore: deprecated_member_use
                      )
                ])),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              padding: const EdgeInsets.only(bottom: 5, top: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.grey.shade800),
              child: Column(
                children: [
                  ListTile(
                    splashColor: Colors.transparent,
                    onTap: () {},
                    leading: const Icon(BoxIcons.bx_help_circle,
                        size: 25, color: Colors.white70),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent),
                    ),
                    title: const Text(
                      "Тех. Поддержка",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Bootstrap.info,
                      size: 25,
                      color: Colors.white70,
                    ),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent),
                    ),
                    title: const Text(
                      "Связаться с нами",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  ListTile(
                    splashColor: Colors.transparent,
                    onTap: () {},
                    leading: const Icon(
                      BoxIcons.bx_error,
                      size: 25,
                      color: Colors.white70,
                    ),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent),
                    ),
                    title: const Text(
                      "Сообщить о ошибке",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  ListTile(
                    splashColor: Colors.transparent,
                    onTap: () {},
                    leading: const Icon(
                      HugeIcons.strokeRoundedSoftwareLicense,
                      size: 25,
                      color: Colors.white70,
                    ),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent),
                    ),
                    title: const Text(
                      "Лицензия",
                      style: TextStyle(color: Colors.white70),
                    ),
                  )
                ],
              ),
            ),
          ]))
    ]);
  }
}
