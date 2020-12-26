import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function counter;
  RoundIconButton({@required this.icon, @required this.counter});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
        size: 18.0,
      ),
      onPressed: counter,
      elevation: 8.0,
      constraints: BoxConstraints.tightFor(
        width: 35.0,
        height: 35.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
