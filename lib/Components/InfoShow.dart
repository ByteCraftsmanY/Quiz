import 'package:flutter/material.dart';

class Infoshow extends StatelessWidget {
  const Infoshow({
    Key key,
    this.data,
    this.lebal,
    this.color,
  }) : super(key: key);
  final String data;
  final String lebal;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      textBaseline: TextBaseline.ideographic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Icon(
          Icons.info,
          color: color,
          size: 10,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          textBaseline: TextBaseline.ideographic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '$data',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(lebal),
          ],
        ),
      ],
    );
  }
}
