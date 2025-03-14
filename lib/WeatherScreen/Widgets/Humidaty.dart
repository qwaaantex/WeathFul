import 'package:WeathFul/Providers/State/WeatherState.dart';

import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather/weather.dart';

class Humidaty extends StatefulWidget {
  final String nameCity;

  const Humidaty({super.key, required this.nameCity});

  @override
  State<StatefulWidget> createState() => HumidatyState();
}

class HumidatyState extends State<Humidaty> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  final Uri _url = Uri.parse('https://yandex.ru/pogoda/nowcast');

  final weatherService = WeatherService();
  Weather? humidation;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    try {
      setState(() {
        isLoading = true;
      });

      await weatherService.initialize();
      humidation = await weatherService.fetchWeatherByCityName(widget.nameCity);

      if (mounted) {
        setState(() {
          _valueNotifier.value = humidation?.humidity?.toDouble() ?? 0;
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
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.grey.shade800,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.grey)
                        : DashedCircularProgressBar.aspectRatio(
                            aspectRatio: 1.0,
                            valueNotifier: _valueNotifier,
                            progress: humidation?.humidity ?? 0,
                            maxProgress: 100,
                            startAngle: 225,
                            sweepAngle: 270,
                            foregroundColor: Colors.blue.shade300,
                            backgroundColor: const Color(0xffeeeeee),
                            foregroundStrokeWidth: 15,
                            backgroundStrokeWidth: 15,
                            animation: true,
                            seekSize: 6,
                            seekColor: const Color(0xffeeeeee),
                            child: Center(
                              child: ValueListenableBuilder(
                                valueListenable: _valueNotifier,
                                builder: (_, double value, __) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${value.toInt()}%',
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 50,
                                      ),
                                    ),
                                    const Text(
                                      'Влажность',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                  Column(
                    children: [
                      RiveAnimatedIcon(
                        riveIcon: RiveIcon.cursor,
                        width: 35,
                        height: 35,
                        color: Colors.grey,
                        strokeWidth: 3,
                        loopAnimation: true,
                        onTap: () {},
                        onHover: (value) {},
                      ),
                      TextButton(
                        style: const ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                        ),
                        onPressed: () async {
                          if (!await launchUrl(_url)) {
                            throw Exception('Could not launch $_url');
                          }
                        },
                        child: const Text(
                          "Еще..",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: isLoading
                ? [const CircularProgressIndicator(color: Colors.grey)]
                : humidation == null
                    ? [
                        const Center(
                          child: Text(
                            "Нет данных",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ]
                    : [
                        Text(
                          'Влажность: ${humidation?.humidity?.round()}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Ощущается: ${humidation?.tempFeelsLike?.celsius?.round() ?? 0}°',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
          )
        ],
      ),
    );
  }
}
