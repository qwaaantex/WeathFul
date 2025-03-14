import 'package:flutter/material.dart';

import 'package:weather/weather.dart';

class Name extends StatefulWidget {
  final String nameCity;

  const Name({super.key, required this.nameCity});
  @override
  State<StatefulWidget> createState() => NameState();
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

class NameState extends State<Name> {
  late WeatherFactory wf;
  Weather? forecast;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.nameCity,
          style: const TextStyle(
              fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
