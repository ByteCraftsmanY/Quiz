import 'package:flutter/material.dart';
import 'package:quizapp/Components/constant.dart';
import 'package:quizapp/Question.dart/Questionsclass.dart';
import 'OptionButton.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    @required this.q,
    this.count,
    this.rightans,
    this.wrongans,
    this.length,
    this.callback1,
    this.o1b,
    this.o2b,
    this.o4b,
    this.o3b,
    this.o1c,
    this.o2c,
    this.o4c,
    this.o3c,
    this.c1,
    this.c2,
    this.c3,
    this.c4,
  }) : super(key: key);
  final Color o1b;
  final Color o2b;
  final Color o4b;
  final Color o3b;
  final Color o1c;
  final Color o2c;
  final Color o4c;
  final Color o3c;
  final Widget c1;
  final Widget c2;
  final Widget c3;
  final Widget c4;
  final Question q;
  final int count;
  final int rightans;
  final int wrongans;
  final int length;
  final Function callback1;
  @override
  Widget build(BuildContext context) {
    // void changeQuestion() async {
    //   Future.delayed(
    //     Duration(seconds: 2),
    //     () {},
    //   );
    // }

    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 150, bottom: 30),
          child: Material(
            shadowColor: kTopBackColor,
            elevation: 20,
            color: Colors.transparent,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          rightans.toString(), /////////////RIGHT Answer counter
                          style: kRWTextStyle.copyWith(color: Colors.green),
                        ),
                        margin: EdgeInsets.only(left: 15),
                      ),
                      Container(
                        child: Text(
                          wrongans
                              .toString(), //////////////Wring Answer counter
                          style: kRWTextStyle.copyWith(color: Colors.red),
                        ),
                        margin: EdgeInsets.only(right: 15),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Question ${count + 1} / $length', //////////////////Quserk Number
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    q.question,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        Option(
          borderColor: o1b,
          checkout: c1,
          circleBackgroundColor: o1c,
          option: q.option1, //widget.list[counter].option1,
          fun: () {
            if (q.option1 == q.ans)
              callback1(true, 'option1');
            else
              callback1(false, 'option1');
          },
        ),
        Option(
          borderColor: o2b,
          checkout: c2,
          circleBackgroundColor: o2c,
          option: q.option2, // widget.list[counter].option2,
          fun: () {
            if (q.option2 == q.ans)
              callback1(true, 'option2');
            else
              callback1(false, 'option2');
          },
        ),
        Option(
          borderColor: o3b,
          checkout: c3,
          circleBackgroundColor: o3c,
          option: q.option3, // widget.list[counter].option2,
          fun: () {
            if (q.option3 == q.ans)
              callback1(
                true,
                'option3',
              );
            else
              callback1(false, 'option3');
          },
        ),
        Option(
          borderColor: o4b,
          checkout: c4,
          circleBackgroundColor: o4c,
          option: q.option4, // widget.list[counter].option2,
          fun: () {
            if (q.option4 == q.ans)
              callback1(true, 'option4');
            else
              callback1(false, 'option4');
          },
        ),
      ],
    );
  }
}

///Change QUestion function
// if (counter == length - 1)
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => Screen2(),
//     ),
//   );
