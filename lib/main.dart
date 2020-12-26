import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/screens/home.dart';

void main() => runApp(BmiCalculator());

class BmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BMI Calculator',
        home: Home(),
        theme: ThemeData(
          accentColor: Color(0xFF0A0E21),
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
        ));
  }
}
