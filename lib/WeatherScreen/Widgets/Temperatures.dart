import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/weather.dart';

class Temperatures extends StatefulWidget {
  final String nameCity;
  const Temperatures({super.key, required this.nameCity});

  @override
  State<Temperatures> createState() => TemperaturesState();
}

class TemperaturesState extends State<Temperatures> {
  late WeatherFactory wf;
  bool isLoading = false;
  Weather? temp;
  Weather? weather;
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
        setState(() {
          isLoading = false;
        });
        print('Error fetching weather: $e');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isLoading
            ? const CircularProgressIndicator(
                color: Colors.grey,
              )
            : Text(
                "${temp?.tempMin?.celsius?.round()}°/${temp?.tempMax?.celsius?.round()}°",
                style: const TextStyle(color: Colors.grey, fontSize: 20),
              )
      ],
    );
  }
}
