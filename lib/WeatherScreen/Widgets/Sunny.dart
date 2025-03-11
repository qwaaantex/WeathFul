import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Sunny extends StatefulWidget {
  const Sunny({super.key});

  @override
  State<StatefulWidget> createState() => SunnyState();
}

class SunnyState extends State<Sunny> {
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
        child: Row(children: [
          SizedBox(
              width: 200,
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
