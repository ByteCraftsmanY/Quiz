import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Components/Loader.dart';
import 'package:quizapp/Components/WentWrong.dart';
import 'package:quizapp/Provider.dart';

import 'Screens/Screen0.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Initial());
}

class Initial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return WentWrong();
        if (snapshot.connectionState == ConnectionState.done)
          return ChangeNotifierProvider(
            create: (context) => MyProvider(),
            child: MaterialApp(
              home: Screen0(),
            ),
          );
        return Loader();
      },
    );
  }
}
