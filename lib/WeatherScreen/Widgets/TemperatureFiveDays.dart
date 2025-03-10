import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/weather.dart';

class TemperatureFiveDays extends StatefulWidget {
  final String cityName;
  const TemperatureFiveDays({super.key, required this.cityName});

  @override
  State<StatefulWidget> createState() => TemperaturefivedaysState();
}

class TemperaturefivedaysState extends State<TemperatureFiveDays> {
  late WeatherFactory wf;

  List<Weather> forecast = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPersistentFrameCallback((_) async {
      try {
        await dotenv.load(fileName: "key.env");

        final apiKey = dotenv.env['api-key'];
        wf = WeatherFactory(apiKey!, language: Language.ENGLISH);
        _fetchForecast();
      } catch (e) {
        print('Error fetching weather: $e');
      }
    });
  }

  Future<void> _fetchForecast() async {
    try {
      final fetchedForecast =
          await wf.fiveDayForecastByCityName(widget.cityName);

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
    return Container(
      width: MediaQuery.of(context).size.width * 0.94,
      height: 100,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.grey,
            ))
          : forecast.isEmpty
              ? const Center(child: Text('Нет данных'))
              : Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.grey.shade800),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: forecast.length,
                    itemExtent: 100,
                    itemBuilder: (context, index) {
                      final weather = forecast[index];
                      return Card(
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                if (weather.weatherIcon != null)
                                  Image.network(
                                    'http://openweathermap.org/img/wn/${weather.weatherIcon}@2x.png',
                                  ),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "${weather.date?.hour}:00",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )),
                              ],
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "${weather.temperature?.celsius?.round()}°",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )),
                          ],
                        ),
                      );
                    },
                  )),
    );
  }
}
