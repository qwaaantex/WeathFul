import 'package:WeathFul/Providers/State/WeatherState.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather/weather.dart';

class Sunny extends StatefulWidget {
  final String cityName;
  const Sunny({super.key, required this.cityName});

  @override
  State<StatefulWidget> createState() => SunnyState();
}

class SunnyState extends State<Sunny> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  final Uri _url = Uri.parse('https://yandex.ru/pogoda/temperature');

  final weatherService = WeatherService();
  Weather? sunnyup;
  Weather? sunnydown;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchSunny();
  }

  Future<void> fetchSunny() async {
    try {
      setState(() {
        isLoading = true;
      });

      await weatherService.initialize();
      sunnyup = await weatherService.fetchWeatherByCityName(widget.cityName);
      sunnydown = await weatherService.fetchWeatherByCityName(widget.cityName);

      if (mounted) {
        setState(() {
          _valueNotifier.value = sunnyup?.humidity?.toDouble() ?? 0;
          _valueNotifier.value = sunnydown?.humidity?.toDouble() ?? 0;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
      print('Error fetching weather: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.grey.shade800),
        child: Column(children: [
          Stack(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.grey)
                          : DashedCircularProgressBar.aspectRatio(
                              valueNotifier: _valueNotifier,
                              aspectRatio: 2.1,
                              progress: sunnyup?.latitude ?? 0,
                              startAngle: 270,
                              sweepAngle: 180,
                              circleCenterAlignment: Alignment.bottomCenter,
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.grey.shade600,
                              foregroundStrokeWidth: 3,
                              backgroundStrokeWidth: 2,
                              backgroundGapSize: 2,
                              backgroundDashSize: 1,
                              seekColor: Colors.yellow,
                              seekSize: 22,
                              animation: true,
                            )),
                  Column(children: [
                    RiveAnimatedIcon(
                        riveIcon: RiveIcon.cursor,
                        width: 35,
                        height: 35,
                        color: Colors.grey,
                        strokeWidth: 3,
                        loopAnimation: true,
                        onTap: () {},
                        onHover: (value) {}),
                    TextButton(
                      style: const ButtonStyle(
                          splashFactory: NoSplash.splashFactory),
                      onPressed: () async {
                        if (!await launchUrl(_url)) {
                          throw Exception('Could not launch $_url');
                        }
                      },
                      child: const Text("Еще..",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                    )
                  ]),
                ])
          ]),
          const SizedBox(
            height: 20,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: isLoading
                  ? [
                      const CircularProgressIndicator(
                        color: Colors.grey,
                      )
                    ]
                  : [
                      Text(
                        'Восход: ${sunnyup?.sunrise?.hour}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Text(
                        'Закат: ${sunnydown?.sunset?.hour}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ])
        ]));
  }
}
