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
    return DashedCircularProgressBar.aspectRatio(
      aspectRatio: 1, // width ÷ height
      valueNotifier: _valueNotifier,
      progress: 40,
      maxProgress: 150,
      corners: StrokeCap.butt,
      foregroundColor: Colors.lightGreenAccent,
      backgroundColor: const Color(0xffeeeeee),
      foregroundStrokeWidth: 16,
      backgroundStrokeWidth: 16,
      animation: true,
      child: Center(
        child: ValueListenableBuilder(
          valueListenable: _valueNotifier,
          builder: (_, double value, __) => Text(
            '${value.toInt()} км/ч',
            style: const TextStyle(
                color: Colors.green, fontWeight: FontWeight.w300, fontSize: 40),
          ),
        ),
      ),
    );
  }
}
