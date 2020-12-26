import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/components/constants.dart';

class GenderColumn extends StatelessWidget {
  final genderIcon;
  final genderText;

  GenderColumn({this.genderIcon, this.genderText});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 59.0,
          color: Colors.white,
        ),
        SizedBox(height: 11.0),
        Text(genderText, style: kLabelTextStyle),
      ],
    );
  } //build
} //ReusableColumn
