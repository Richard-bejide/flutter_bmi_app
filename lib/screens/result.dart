import 'package:flutter_bmi_app/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/screens/home.dart';
import 'package:flutter_bmi_app/components/reusable_card.dart';

class ResultPage extends StatefulWidget {
  final double bmi;
  final selectedGender;
  ResultPage({this.bmi, this.selectedGender});
  @override
  _ResultPageState createState() => _ResultPageState();
} //ResultPage

class _ResultPageState extends State<ResultPage> {
  double bmi;
  var selectedGender;

  void initState() {
    super.initState();
    bmi = widget.bmi;
    selectedGender = widget.selectedGender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Result',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Raleway', fontSize: 24.0)),
          elevation: 6.0,
        ),
        body: SafeArea(
            child: ListView(children: <Widget>[
          Expanded(
            child: ReusableCard(
                containerColor: kActiveCardColor,
                cardChild: Column(children: <Widget>[
                  SizedBox(height: 28.0),

                  getStatus(), //getStatus
                  Text(
                    '${(bmi).toStringAsFixed(2)}',
                    style: kBmiTextStyle,
                  ),
                  SizedBox(height: 36.0),
                  getImageStatus(),
                  SizedBox(height: 67.0),

                  Center(child: getAdvice()),

                  SizedBox(height: 29.0),

                  Text(
                    'Normal BMI range is:  18.5 - 25kg/m2',
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 28.0),
                ])),
          ),
        ])));
  } //

  Text getAdvice() {
    if (bmi > 25) {
      return Text(
          'You have a higher than normal body weight.Try to exercise more!',
          style: kLabelTextStyle,
          textAlign: TextAlign.center); //Advice
    } else if (bmi >= 18.5) {
      return Text('You have a nomal body weight.Good job!',
          style: kLabelTextStyle); //Advice
    } else {
      return Text(
          'You have a lower than normal body weight.Try to eat more nutritious meals!',
          style: kLabelTextStyle,
          textAlign: TextAlign.center); //Advice
    }
  } //getAdvice

  Text getStatus() {
    if (bmi > 30) {
      return Text('OBESE ',
          style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20.0,
              color: getStatusColor(),
              fontWeight: FontWeight.bold)); //Advice
    } else if (bmi > 25) {
      return Text('OVERWEIGHT ',
          style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20.0,
              color: getStatusColor(),
              fontWeight: FontWeight.bold)); //Advice
    } else if (bmi >= 18.5) {
      return Text('NORMAL',
          style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20.0,
              color: getStatusColor(),
              fontWeight: FontWeight.bold)); //Advice
    } else {
      return Text('UNDERWEIGHT',
          style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20.0,
              color: getStatusColor(),
              fontWeight: FontWeight.bold)); //Advice
    }
  }

  Image imageName(String name) {
    return Image.asset('assets/images/$name.png', height: 200.0, width: 120.0);
  }

  Image getImageStatus() {
    if (selectedGender == Gender.male) {
      if (bmi > 30) {
        return (imageName('male4'));
      } else if (bmi > 25) {
        return (imageName('male3'));
      } else if (bmi >= 18.5) {
        return (imageName('male2'));
      } else {
        return (imageName('male1'));
      }
    } else if (selectedGender == Gender.female) {
      if (bmi > 30) {
        return (imageName('female4'));
      } else if (bmi > 25) {
        return (imageName('female3'));
      } else if (bmi >= 18.5) {
        return (imageName('female2'));
      } else {
        return (imageName('female1'));
      }
    }
  }

  Color getStatusColor() {
    if (bmi > 30) {
      return Colors.red;
    } else if (bmi > 25) {
      return Colors.orange;
    } else if (bmi >= 18.5) {
      return Colors.green;
    } else {
      return Colors.lightBlue;
    }
  }
} //_ResultPageState
