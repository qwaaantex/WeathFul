import 'package:flutter/material.dart';

class Day extends StatefulWidget {
  const Day({super.key});

  @override
  State<Day> createState() => DayState();
}

String dayOfWeek() {
  final dateDay = {
    DateTime.monday: 'Понедельник',
    DateTime.tuesday: 'Вторник',
    DateTime.wednesday: 'Среда',
    DateTime.thursday: 'Четверг',
    DateTime.friday: 'пятница',
    DateTime.saturday: 'Суббота',
    DateTime.sunday: 'Воскресенье'
  };
  return dateDay[DateTime.now().weekday] ?? 'Ошибка';
}

class DayState extends State<Day> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(48)),
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 15),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                border: Border.all(color: Colors.grey)),
            child: Text(
              dayOfWeek(),
              style: const TextStyle(fontSize: 40, color: Colors.white),
            )));
  }
}
