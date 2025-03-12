import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class Winds extends StatefulWidget {
  const Winds({super.key});

  @override
  State<StatefulWidget> createState() => WindsState();
}

class WindsState extends State<Winds> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  final Uri _url = Uri.parse('https://yandex.ru/pogoda/wind');
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
                          child: DashedCircularProgressBar.aspectRatio(
                            aspectRatio: 1,
                            valueNotifier: _valueNotifier,
                            progress: 40,
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
                                      fontWeight: FontWeight.w300,
                                      fontSize: 40),
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
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Скорость: 10%',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      'Ощущается: 5°',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ])
            ]));
  }
}
