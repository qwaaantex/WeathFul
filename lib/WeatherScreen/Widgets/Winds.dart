import 'package:WeathFul/Providers/State/WeatherState.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather/weather.dart';

class Winds extends StatefulWidget {
  final String nameCity;
  const Winds({super.key, required this.nameCity});

  @override
  State<StatefulWidget> createState() => WindsState();
}

class WindsState extends State<Winds> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  final Uri _url = Uri.parse('https://yandex.ru/pogoda/wind');
  final weatherService = WeatherService();
  Weather? windSpeed;
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
      windSpeed = await weatherService.fetchWeatherByCityName(widget.nameCity);

      if (mounted) {
        setState(() {
          _valueNotifier.value = windSpeed?.windSpeed?.toDouble() ?? 0;
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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.grey,
                                )
                              : DashedCircularProgressBar.aspectRatio(
                                  aspectRatio: 1,
                                  valueNotifier: _valueNotifier,
                                  progress: windSpeed?.windSpeed ?? 0,
                                  maxProgress: 150,
                                  corners: StrokeCap.butt,
                                  foregroundColor: Colors.lightGreenAccent,
                                  backgroundColor: const Color(0xffeeeeee),
                                  foregroundStrokeWidth: 15,
                                  backgroundStrokeWidth: 15,
                                  animation: true,
                                  child: Center(
                                    child: ValueListenableBuilder(
                                      valueListenable: _valueNotifier,
                                      builder: (_, double value, __) => Text(
                                        '${value.toInt()} км/ч',
                                        style: const TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 35),
                                      ),
                                    ),
                                  ),
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12)),
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
                    ? [const CircularProgressIndicator(color: Colors.grey)]
                    : windSpeed == null
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
                              'Скорость: ${windSpeed?.windSpeed?.round() ?? 0} км/ч',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                            Text(
                              'Давление: ${windSpeed?.pressure?.round() ?? 0} мм.рт.ст',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
              )
            ]));
  }
}
