import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Winds extends StatefulWidget {
  const Winds({super.key});

  @override
  State<StatefulWidget> createState() => WindsState();
}

class WindsState extends State<Winds> {
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
          const SizedBox(
            width: 10,
          ),
          const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Скорость: 10%',
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
