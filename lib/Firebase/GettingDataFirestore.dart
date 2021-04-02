import 'package:cloud_firestore/cloud_firestore.dart';
import '../Question.dart/Questionsclass.dart';

Future<List<Question>> getData() async {
  List<Question> q = [];
  QuerySnapshot qs =
      await FirebaseFirestore.instance.collection('Questions').get();
  for (var i in qs.docs)
    q.add(
      Question(
        question: i.data()['question'],
        option1: i.data()['option 1'],
        option2: i.data()['option 2'],
        option3: i.data()['option 3'],
        option4: i.data()['option 4'],
        ans: i.data()['ans'],
      ),
    );
  return q;
}
