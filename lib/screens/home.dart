import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bmi_app/components/gender_column.dart';
import 'package:flutter_bmi_app/components/reusable_card.dart';
import 'package:flutter_bmi_app/components/constants.dart';
import 'package:flutter_bmi_app/components/round_icon_button.dart';
import 'package:flutter_bmi_app/components/calculate_button.dart';
import 'dart:math';
import 'package:flutter_bmi_app/screens/result.dart';

enum Gender { male, female }

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
} // Home

class _HomeState extends State<Home> {
  double bmi;
  Gender selectedGender; //null
  int height = 170;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Raleway', fontSize: 24.0)),
        elevation: 6.0,
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: ReusableCard(
            containerColor: kActiveCardColor,
            cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: kNumberTextStyle),
                        Text('cm', style: kLabelTextStyle),
                      ]),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 13.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 24.0),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },

                        min: minimumHeight,
                        max: maximumHeight,
                        // divisions: ,
                      )),
                ]),
          )),
          Expanded(
              child: ReusableCard(
            containerColor: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Weight', style: kLabelTextStyle),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(weight.toString(), style: kNumberTextStyle),
                      Text('kg', style: kLabelTextStyle),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          counter: () {
                            setState(() {
                              if (weight > 1) {
                                weight--;
                              }
                            });
                          }),
                      SizedBox(width: 10.0),
                      RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          counter: () {
                            setState(() {
                              weight++;
                            });
                          })
                    ]),
              ],
            ),
          )),
          Expanded(
              child: ReusableCard(
                  containerColor: kActiveCardColor,
                  cardChild: Column(children: <Widget>[
                    Text('Select gender', style: kLabelTextStyle),
                    SizedBox(height: 2.0),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: ReusableCard(
                            containerColor: (selectedGender == Gender.male)
                                ? kInactiveCardColor
                                : kActiveCardColor,
                            /*Tenary operator: (if the male card has not
                       been tapped yet or if the female card has been tapped 
                       the default maleCardColor is set to inactiveCardColor
                        because the value of selectedGender will not be set
                         to Gender.male)*/
                            cardChild: GenderColumn(
                                genderIcon: FontAwesomeIcons.mars,
                                genderText: 'Male'),
                            onPress: () {
                              setState(() {
                                selectedGender = Gender.male;
                              });
                            },
                          )),
                          Expanded(
                              child: ReusableCard(
                            containerColor: (selectedGender == Gender.female)
                                ? kInactiveCardColor
                                : kActiveCardColor,
                            /*Tenary operator: (if the female card has not
                     been tapped yet or if the male card has been tapped 
                     the default femaleCardColor is set to inactiveCardColor
                      because the value of selectedGender will not be set
                       to Gender.female)*/
                            cardChild: GenderColumn(
                                genderIcon: FontAwesomeIcons.venus,
                                genderText: 'Female'),
                            onPress: () {
                              setState(() {
                                selectedGender = Gender.female;
                              });
                            },
                          )),
                        ],
                      ),
                    )
                  ]))),
          CalculateButton(
            onPressed: () {
              if (selectedGender == Gender.male ||
                  selectedGender == Gender.female) {
                setState(() {
                  bmi = weight / pow((height / 100), 2);
                  //debugPrint('Bmi value: $bmi');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                              bmi: bmi, selectedGender: selectedGender)));
                });
              }
            },
            text: 'Calculate',
          )
        ],
      )),
    );
  } //build

} //_HomeState
