import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';

class Humidaty extends StatefulWidget {
  const Humidaty({super.key});

  @override
  State<StatefulWidget> createState() => HumidatyState();
}

class HumidatyState extends State<Humidaty> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.3,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.grey.shade800),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
              width: 200,
              child: DashedCircularProgressBar.aspectRatio(
                aspectRatio: 1.0,
                valueNotifier: _valueNotifier,
                progress: 37,
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
                                    fontWeight: FontWeight.w300,
                                    fontSize: 60),
                              ),
                              const Text(
                                'Влажность',
                                style: TextStyle(
                                    color: Color(0xffeeeeee),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ],
                          )),
                ),
              )),
          const SizedBox(
            width: 10,
          ),
          const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Влажность: 10%',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const Text(
                  'Ощущается: 5°',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ])
        ]));
  }
}
