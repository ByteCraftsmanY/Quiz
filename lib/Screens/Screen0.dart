import 'package:flutter/material.dart';
import 'Screen1.dart';

class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      body: Center(
        child: OutlinedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.resolveWith((states) => 10),
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.redAccent),
          ),
          onPressed: () {
            print('Push');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Screen1(),
              ),
            );
          },
          child: Text(
            'Let\'s Start',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
