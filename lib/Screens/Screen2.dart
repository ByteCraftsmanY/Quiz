import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Components/Background.dart';
import 'package:quizapp/Components/InfoShow.dart';
import 'package:quizapp/Components/constant.dart';
import 'package:quizapp/Provider.dart';
import 'package:quizapp/Screens/Screen0.dart';
import 'package:quizapp/Screens/Screen1.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(c1: 1, c2: 1),
          Consumer<MyProvider>(
            builder: (context, value, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    height: 120,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Your Score',
                            style: TextStyle(
                                color: kTopBackColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w700),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '${value.userRightAnswer * 10}',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: kTopBackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'pt',
                                style: TextStyle(
                                  color: kTopBackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 20,
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 20),
                                  child: Infoshow(
                                    color: kTopBackColor,
                                    data:
                                        '${((value.counter) / (value.length)) * 100} %',
                                    lebal: 'Completion',
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, right: 20),
                                  child: Infoshow(
                                    color: kTopBackColor,
                                    data: '${(value.length)}',
                                    lebal: 'Total Question',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 20),
                                  child: Infoshow(
                                    color: Colors.green,
                                    data: '${value.userRightAnswer}',
                                    lebal: 'Correct',
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, right: 70),
                                  child: Infoshow(
                                    color: Colors.red.shade900,
                                    data: '${(value.userWrongAnswer)}',
                                    lebal: 'Wrong',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          value.resetQuiz();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Screen0(),
                              ),
                              (route) => false);
                        },
                        icon: Icon(
                          Icons.home,
                          size: 40,
                          color: Colors.black,
                        ),
                        label: Text(
                          '',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          value.resetQuiz();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Screen1(),
                              ),
                              (route) => false);
                        },
                        icon: Icon(
                          Icons.replay,
                          size: 40,
                          color: Colors.green,
                        ),
                        label: Text(
                          '',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
