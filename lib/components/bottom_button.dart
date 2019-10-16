import 'package:flutter/material.dart';

import 'package:bmi_calculator/constans.dart';
class BottomButton extends StatelessWidget {

final Function func;
final String buttonTitle;

  BottomButton({this.func, this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func ,
        child: Container(
        
        color: bottomColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomHeight,
        child: 
        Center(
          child: Text(
            "$buttonTitle" , style: TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold)
          ),
        ),
      ),
    );
  }
}