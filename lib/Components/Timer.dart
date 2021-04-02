import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/Components/constant.dart';

class Timer extends StatelessWidget {
  final Function function;
  const Timer({Key key, @required this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 160, top: 110),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        height: 90,
        width: 90,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircularCountDownTimer(
            initialDuration: 0,
            width: 20,
            height: 20,
            duration: 60,
            fillColor: kTopBackColor,
            ringColor: Colors.white,
            isReverse: true,
            autoStart: true,
            strokeCap: StrokeCap.round,
            isReverseAnimation: false,
            onComplete: function, ////Completion
          ),
        ),
      ),
    );
  }
}
