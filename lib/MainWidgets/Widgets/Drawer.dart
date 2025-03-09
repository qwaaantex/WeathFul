import 'package:flutter/material.dart';
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
    return Drawer(
        shape: const RoundedRectangleBorder(),
        backgroundColor: Colors.grey[850],
        child: ListView(children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              padding: const EdgeInsets.only(bottom: 5, top: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.grey.shade800),
              child: Column(children: [
                Card(
                    // ignore: deprecated_member_use
                    color: Colors.grey[700],
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: const ListTile(
                      leading: Icon(
                        BoxIcons.bx_home,
                        size: 25,
                        color: Colors.white70,
                      ),
                      title: Text(
                        "Погода",
                        style: TextStyle(color: Colors.white70),
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.transparent),
                      ),
                    )),
                Card(
                    // ignore: deprecated_member_use
                    color: Colors.grey[700],
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: const ListTile(
                      leading: Icon(
                        BoxIcons.bx_list_check,
                        size: 25,
                        color: Colors.white70,
                      ),
                      title: Text(
                        "Города",
                        style: TextStyle(color: Colors.white70),
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.transparent),
                      ),
                    )),
              ])),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              padding: const EdgeInsets.only(bottom: 5, top: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.grey.shade800),
              child: Column(children: [
                Card(
                    // ignore: deprecated_member_use
                    color: Colors.grey[700],
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: const ListTile(
                      leading: Icon(
                        BoxIcons.bx_time,
                        size: 22,
                        color: Colors.white70,
                      ),
                      title: Text(
                        "Время",
                        style: TextStyle(color: Colors.white70),
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.transparent),
                      ),
                    )),
                Card(
                    // ignore: deprecated_member_use
                    color: Colors.grey[700],
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: const ListTile(
                      leading: Icon(
                        Bootstrap.calendar_date,
                        size: 21,
                        color: Colors.white70,
                      ),
                      title: Text(
                        "Дата",
                        style: TextStyle(color: Colors.white70),
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.transparent),
                      ),
                    )),
              ])),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.grey.shade800),
            child: Column(
              children: [
                Card(
                    // ignore: deprecated_member_use
                    color: Colors.grey[700],
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    child: const ListTile(
                      leading: Icon(BoxIcons.bx_help_circle,
                          size: 25, color: Colors.white70),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.transparent),
                      ),
                      title: Text(
                        "Тех. Поддержка",
                        style: TextStyle(color: Colors.white70),
                      ),
                    )),
                Card(
                    // ignore: deprecated_member_use
                    color: Colors.grey[700],
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: const ListTile(
                      leading: Icon(
                        Bootstrap.info,
                        size: 25,
                        color: Colors.white70,
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.transparent),
                      ),
                      title: Text(
                        "Связаться с нами",
                        style: TextStyle(color: Colors.white70),
                      ),
                    )),
                Card(
                    // ignore: deprecated_member_use
                    color: Colors.grey[700],
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: const ListTile(
                      leading: Icon(
                        BoxIcons.bx_error,
                        size: 25,
                        color: Colors.white70,
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.transparent),
                      ),
                      title: Text(
                        "Сообщить о ошибке",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    )),
                Card(
                    // ignore: deprecated_member_use
                    color: Colors.grey[700],
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: const ListTile(
                      leading: Icon(
                        Bootstrap.list_check,
                        size: 25,
                        color: Colors.white70,
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.transparent),
                      ),
                      title: Text(
                        "Лицензия",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ))
              ],
            ),
          ),
        ]));
  }
}
