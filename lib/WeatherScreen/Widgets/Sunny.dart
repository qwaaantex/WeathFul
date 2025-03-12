import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class Sunny extends StatefulWidget {
  const Sunny({super.key});

  @override
  State<StatefulWidget> createState() => SunnyState();
}

class SunnyState extends State<Sunny> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  final Uri _url = Uri.parse('https://yandex.ru/pogoda/temperature');
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
                      child: DashedCircularProgressBar.aspectRatio(
                        valueNotifier: _valueNotifier,
                        aspectRatio: 2.1, // width ÷ height
                        progress: 34,
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
          const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Влажность: 10%',
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
