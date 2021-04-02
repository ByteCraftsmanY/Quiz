import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Components/Background.dart';
import 'package:quizapp/Components/Loader.dart';
import 'package:quizapp/Components/QuestionCard.dart';
import 'package:quizapp/Components/Timer.dart';
import 'package:quizapp/Components/WentWrong.dart';
import 'package:quizapp/Provider.dart';
import 'package:quizapp/Screens/Screen2.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    navigate() async {
      await Future.delayed(
        Duration(seconds: 2),
        () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Screen2(),
              ),
              (route) => false);
        },
      );
    }

    return FutureBuilder(
      future: Provider.of<MyProvider>(context, listen: false).gettingData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return WentWrong();
        if (snapshot.connectionState == ConnectionState.done) {
          return Consumer<MyProvider>(
            builder: (context, value, child) {
              return Scaffold(
                body: Stack(
                  alignment: Alignment.center,
                  children: [
                    Background(c1: 2, c2: 4),
                    Stack(
                      children: [
                        QuestionCard(
                          q: value.getObject,
                          count: value.counter,
                          rightans: value.userRightAnswer,
                          wrongans: value.userWrongAnswer,
                          length: value.length,
                          c1: value.c1,
                          c2: value.c2,
                          c3: value.c3,
                          c4: value.c4,
                          o1b: value.o1b,
                          o2b: value.o2b,
                          o3b: value.o3b,
                          o4b: value.o4b,
                          o1c: value.o1c,
                          o2c: value.o2c,
                          o3c: value.o3c,
                          o4c: value.o4c,
                          callback1: (bool check, String option) async {
                            value.colorChange(option, check);
                            if (value.counter + 1 == value.length)
                              await navigate();
                            value.changeQuestion();
                          },
                        ),
                        Timer(
                          function: () {
                            navigate();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }
        return Loader();
      },
    );
  }
}
