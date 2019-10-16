import 'package:flutter/material.dart';
import 'package:bmi_calculator/constans.dart';

      
class SquereContent extends StatelessWidget {
  SquereContent({this.iconGender,this.typeGender});
final IconData iconGender;
final String typeGender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconGender,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
      Text(typeGender,
      style: labelTextStyle
      )
      ],
    );
  }
}