import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/Question.dart/Questionsclass.dart';

class MyProvider extends ChangeNotifier {
  List<Question> list = [];
  int get length {
    return list.length;
  }

  int userRightAnswer = 0;
  int userWrongAnswer = 0;
  int counter = 0;
  Future<void> gettingData() async {
    QuerySnapshot qs =
        await FirebaseFirestore.instance.collection('Questions').get();
    for (var i in qs.docs) {
      // print(i.data());
      list.add(
        Question(
          question: i.data()['question'],
          option1: i.data()['option 1'],
          option2: i.data()['option 2'],
          option3: i.data()['option 3'],
          option4: i.data()['option 4'],
          ans: i.data()['ans'],
        ),
      );
    }
  }

  Question get getObject {
    return list[counter];
  }

  void onChange() {
    notifyListeners();
  }

  void onRightAns() {
    if (counter < length - 1) counter++;
    userRightAnswer++;
    notifyListeners();
  }

  void onWrongAns() {
    if (counter < length - 1) counter++;
    userWrongAnswer++;
    notifyListeners();
  }

  Color o1b = Colors.grey, // Color borderColor = Colors.grey;
      o2b = Colors.grey,
      o3b = Colors.grey,
      o4b = Colors.grey;
  Color o1c = Colors.white, // Color circleBackgroundColor = Colors.white;
      o2c = Colors.white,
      o3c = Colors.white,
      o4c = Colors.white;
  Widget c1 = Text(''),
      c2 = Text(''),
      c3 = Text(''),
      c4 = Text(''); // Widget checkout = Text('');
  void reset() {
    o1b = Colors.grey; // Color borderColor = Colors.grey;
    o2b = Colors.grey;
    o3b = Colors.grey;
    o4b = Colors.grey;
    o1c = Colors.white; // Color circleBackgroundColor = Colors.white;
    o2c = Colors.white;
    o3c = Colors.white;
    o4c = Colors.white;
    c1 = Text('');
    c2 = Text('');
    c3 = Text('');
    c4 = Text('');
    c1 = Text('');
    c2 = Text('');
    c3 = Text('');
    c4 = Text('');
  }

  void colorChange(String option, bool x) {
    if (x)
      userRightAnswer++;
    else {
      userWrongAnswer++;
      rightAnswer();
    }
    if (option == 'option1') {
      if (x) {
        c1 = Icon(
          Icons.done,
          color: Colors.white,
        );
        o1b = o1c = Colors.green;
      } else {
        c1 = Icon(
          Icons.close,
          color: Colors.white,
        );
        o1b = o1c = Colors.red;
      }
    } else if (option == 'option2') {
      if (x) {
        c2 = Icon(
          Icons.done,
          color: Colors.white,
        );
        o2b = o2c = Colors.green;
      } else {
        c2 = Icon(
          Icons.close,
          color: Colors.white,
        );
        o2b = o2c = Colors.red;
      }
    }
    if (option == 'option3') {
      if (x) {
        c3 = Icon(
          Icons.done,
          color: Colors.white,
        );
        o3b = o3c = Colors.green;
      } else {
        c3 = Icon(
          Icons.close,
          color: Colors.white,
        );
        o3b = o3c = Colors.red;
      }
    }
    if (option == 'option4') {
      if (x) {
        c4 = Icon(
          Icons.done,
          color: Colors.white,
        );
        o4b = o4c = Colors.green;
      } else {
        c4 = Icon(
          Icons.close,
          color: Colors.white,
        );
        o4b = o4c = Colors.red;
      }
    }
    notifyListeners();
  }

  void rightAnswer() {
    if (list[counter].option1 == list[counter].ans) {
      c1 = Icon(
        Icons.done,
        color: Colors.white,
      );
      o1b = o1c = Colors.green;
    } else if (list[counter].option2 == list[counter].ans) {
      c2 = Icon(
        Icons.done,
        color: Colors.white,
      );
      o2b = o2c = Colors.green;
    } else if (list[counter].option3 == list[counter].ans) {
      c3 = Icon(
        Icons.done,
        color: Colors.white,
      );
      o3b = o3c = Colors.green;
    } else {
      c4 = Icon(
        Icons.done,
        color: Colors.white,
      );
      o4b = o4c = Colors.green;
    }
  }

  void changeQuestion() {
    Future.delayed(
      Duration(seconds: 1),
      () {
        reset();
        counter++;
        notifyListeners();
      },
    );
  }

  void resetQuiz() {
    list.clear();
    counter = 0;
    userRightAnswer = userWrongAnswer = 0;
    reset();
    notifyListeners();
  }
}
