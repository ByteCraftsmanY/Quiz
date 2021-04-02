import 'package:flutter/material.dart';
import 'package:quizapp/Components/constant.dart';

class Background extends StatelessWidget {
  const Background({
    Key key,
    @required this.c1,
    @required this.c2,
  }) : super(key: key);

  final int c1;
  final int c2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: c1,
          child: Container(
            decoration: BoxDecoration(
              color: kTopBackColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ),
        Expanded(
          flex: c2,
          child: Container(
            color: kBottomBackColor,
            child: Column(
              children: [],
            ),
          ),
        ),
      ],
    );
  }
}
