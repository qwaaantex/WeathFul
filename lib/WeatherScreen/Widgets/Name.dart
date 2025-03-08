import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
    SchedulerBinding.instance.addPersistentFrameCallback((_) async {
      try {
        await dotenv.load(fileName: 'key.env');
        final apiKey = dotenv.env['api-key'];
        wf = WeatherFactory(apiKey!, language: Language.RUSSIAN);
        _fetchForecast();
      } catch (e) {
        print("Ошибка $e");
      }
    });
  }

  Future<void> _fetchForecast() async {
    try {
      final fetchedForecast =
          await wf.currentWeatherByCityName(widget.nameCity);

      if (mounted) {
        setState(() {
          forecast = fetchedForecast;
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching weather: $e');

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isLoading
            ? const CircularProgressIndicator(
                color: Colors.transparent,
              )
            : Image.network(
                'http://openweathermap.org/img/wn/${forecast?.weatherIcon}@2x.png',
                scale: 0.5,
              ),
        Text(
          widget.nameCity,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }
}
