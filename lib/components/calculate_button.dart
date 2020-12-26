import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/components/constants.dart';

class CalculateButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  CalculateButton({@required this.onPressed, @required this.text});
  @override
  Widget build(BuildContext context) {
    return (GestureDetector(
        onTap: onPressed,
        child: Container(
          color: kBottomContainerColor,
          width: double.infinity,
          height: kBottomContainerHeight,
          child: Center(
            child: Text(text, style: kLargeButtonTextStyle),
          ),
        )));
  }
}
