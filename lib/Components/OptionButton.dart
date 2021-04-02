import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final Color borderColor;
  final Widget checkout;
  final Color circleBackgroundColor;
  final String option;
  final Function fun;

  const Option(
      {Key key,
      @required this.borderColor,
      @required this.checkout,
      @required this.circleBackgroundColor,
      @required this.option,
      @required this.fun})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: GestureDetector(
        onTap: fun,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor),
          ),
          margin: EdgeInsets.only(top: 20, left: 40, right: 40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(option),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: circleBackgroundColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: borderColor,
                    ),
                  ),
                  child: FittedBox(
                    child: checkout,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
