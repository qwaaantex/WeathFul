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
        backgroundColor: Colors.purple,
        child: ListView(children: [
          Container(
              width: 100,
              height: 100,
              alignment: Alignment.topCenter,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "WeathFul",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'RobotoMono',
                      color: Colors.white,
                      fontSize: 30),
                ),
              )),
          const Text(
            "ИНФОРМАЦИЯ",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white60, fontSize: 15),
          ),
          Card(
              // ignore: deprecated_member_use
              color: Colors.purple.withOpacity(0.5),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: ExpansionTile(
                leading: const Icon(
                  BoxIcons.bx_list_check,
                  size: 25,
                ),
                trailing: Icon(
                  isOpenedHelped ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  size: 25,
                ),
                onExpansionChanged: (changed) {
                  setState(() {
                    isOpenedHelped = !isOpenedHelped;
                  });
                },
                collapsedShape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                title: const Text(
                  "О приложении",
                  style: TextStyle(color: Colors.white),
                ),
                children: [
                  Card(
                    color: Colors.purple.shade600,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const Text(
                          "Для помощи обращаться к @qwaaantex",
                          style: TextStyle(color: Colors.white60),
                        )),
                  )
                ],
              )),
          const Text(
            "О УСТРОЙСТВЕ",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white60, fontSize: 15),
          ),
          Card(
              // ignore: deprecated_member_use
              color: Colors.purple.withOpacity(0.5),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: ExpansionTile(
                leading: const Icon(
                  BoxIcons.bx_time,
                  size: 25,
                ),
                trailing: Icon(
                  isOpenedHelped ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  size: 25,
                ),
                onExpansionChanged: (changed) {
                  setState(() {
                    isOpenedHelped = !isOpenedHelped;
                  });
                },
                collapsedShape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                title: const Text(
                  "Время",
                  style: TextStyle(color: Colors.white),
                ),
                children: [
                  Card(
                    color: Colors.purple.shade600,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const Text(
                          "Для помощи обращаться к @qwaaantex",
                          style: TextStyle(color: Colors.white60),
                        )),
                  ),
                ],
              )),
          Card(
              // ignore: deprecated_member_use
              color: Colors.purple.withOpacity(0.5),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: ExpansionTile(
                  leading: const Icon(
                    Bootstrap.calendar_date,
                    size: 21,
                  ),
                  trailing: Icon(
                    isOpenedHelped
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    size: 25,
                  ),
                  onExpansionChanged: (changed) {
                    setState(() {
                      isOpenedHelped = !isOpenedHelped;
                    });
                  },
                  collapsedShape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                  ),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                  ),
                  title: const Text(
                    "Дата",
                    style: TextStyle(color: Colors.white),
                  ),
                  children: [
                    Card(
                      color: Colors.purple.shade600,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const Text(
                            "Для помощи обращаться к @qwaaantex",
                            style: TextStyle(color: Colors.white60),
                          )),
                    )
                  ])),
          const Text(
            "СВЯЗЬ",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white60, fontSize: 15),
          ),
          Card(
              // ignore: deprecated_member_use
              color: Colors.purple.withOpacity(0.5),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: ExpansionTile(
                leading: const Icon(
                  Bootstrap.info,
                  size: 25,
                ),
                trailing: Icon(
                  isOpenedHelped ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  size: 25,
                ),
                onExpansionChanged: (changed) {
                  setState(() {
                    isOpenedHelped = !isOpenedHelped;
                  });
                },
                collapsedShape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                title: const Text(
                  "Связаться с нами",
                  style: TextStyle(color: Colors.white),
                ),
                children: [
                  Card(
                    color: Colors.purple.shade600,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const Text(
                          "Для помощи обращаться к @qwaaantex",
                          style: TextStyle(color: Colors.white60),
                        )),
                  )
                ],
              )),
          const Text(
            "РОЗЫГРЫШИ",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white60, fontSize: 15),
          ),
          Card(
              // ignore: deprecated_member_use
              color: Colors.purple.withOpacity(0.5),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: ExpansionTile(
                leading: const Icon(
                  BoxIcons.bx_calendar_event,
                  size: 25,
                ),
                trailing: Icon(
                  isOpenedHelped ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  size: 25,
                ),
                onExpansionChanged: (changed) {
                  setState(() {
                    isOpenedHelped = !isOpenedHelped;
                  });
                },
                collapsedShape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                title: const Text(
                  "События",
                  style: TextStyle(color: Colors.white),
                ),
                children: [
                  Card(
                    color: Colors.purple.shade600,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const Text(
                          "Для помощи обращаться к @qwaaantex",
                          style: TextStyle(color: Colors.white60),
                        )),
                  )
                ],
              )),
          const Text(
            "ПОМОЩЬ",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white60, fontSize: 15),
          ),
          Card(
              // ignore: deprecated_member_use
              color: Colors.purple.withOpacity(0.5),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: ExpansionTile(
                leading: const Icon(
                  BoxIcons.bx_help_circle,
                  size: 25,
                ),
                trailing: Icon(
                  isOpenedHelped ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  size: 25,
                ),
                onExpansionChanged: (changed) {
                  setState(() {
                    isOpenedHelped = !isOpenedHelped;
                  });
                },
                collapsedShape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                title: const Text(
                  "Тех. Поддержка",
                  style: TextStyle(color: Colors.white),
                ),
                children: [
                  Card(
                    color: Colors.purple.shade600,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const Text(
                          "Для помощи обращаться к @qwaaantex",
                          style: TextStyle(color: Colors.white60),
                        )),
                  ),
                ],
              )),
          Card(
              // ignore: deprecated_member_use
              color: Colors.purple.withOpacity(0.5),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: ExpansionTile(
                  leading: const Icon(
                    BoxIcons.bx_error,
                    size: 25,
                  ),
                  trailing: Icon(
                    isOpenedHelped
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    size: 25,
                  ),
                  onExpansionChanged: (changed) {
                    setState(() {
                      isOpenedHelped = !isOpenedHelped;
                    });
                  },
                  collapsedShape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                  ),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                  ),
                  title: const Text(
                    "Сообщить о ошибке",
                    style: TextStyle(color: Colors.white),
                  ),
                  children: [
                    Card(
                      color: Colors.purple.shade600,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const Text(
                            "Для помощи обращаться к @qwaaantex",
                            style: TextStyle(color: Colors.white60),
                          )),
                    )
                  ])),
          const Text(
            "ДОКУМЕНТЫ",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white60, fontSize: 15),
          ),
          Card(
              // ignore: deprecated_member_use
              color: Colors.purple.withOpacity(0.5),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: ExpansionTile(
                leading: const Icon(
                  Bootstrap.list_check,
                  size: 25,
                ),
                trailing: Icon(
                  isOpenedHelped ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  size: 25,
                ),
                onExpansionChanged: (changed) {
                  setState(() {
                    isOpenedHelped = !isOpenedHelped;
                  });
                },
                collapsedShape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                title: const Text(
                  "Лицензия",
                  style: TextStyle(color: Colors.white),
                ),
                children: [
                  Card(
                    // ignore: deprecated_member_use
                    color: Colors.purple.withOpacity(0.5),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const Text(
                          "Для помощи обращаться к @qwaaantex",
                          style: TextStyle(color: Colors.white60),
                        )),
                  )
                ],
              ))
        ]));
  }
}
