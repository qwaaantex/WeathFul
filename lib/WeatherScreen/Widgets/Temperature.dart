import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/weather.dart';

class Temperature extends StatefulWidget {
  final String nameCity;
  const Temperature({super.key, required this.nameCity});

  @override
  State<StatefulWidget> createState() => TemperatureState();
}

class TemperatureState extends State<Temperature> {
  late WeatherFactory wf;
  Weather? temp;
  Weather? weather;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPersistentFrameCallback((_) async {
      try {
        await dotenv.load(fileName: "key.env");

        final apiKey = dotenv.env['api-key'];
        wf = WeatherFactory(apiKey!, language: Language.ENGLISH);
        temp = await wf.currentWeatherByCityName(widget.nameCity);
        weather = await wf.currentWeatherByCityName(widget.nameCity);
        setState(() {
          isLoading = true;
        });
      } catch (e) {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        } else {
          isLoading = false;
        }
        print('Error fetching weather: $e');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isLoading
            ? Text(
                "${temp?.temperature?.celsius?.round()}°",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 56),
              )
            : const Column(children: [
                SizedBox(
                  height: 10,
                ),
                CircularProgressIndicator(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10,
                ),
              ])
      ],
    );
  }
}
