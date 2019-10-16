import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
RoundIconButton({this.icon, this.func});
final IconData icon;
final Function func;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: () {
       func();
      },
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0
      ),
      shape: CircleBorder(),
      fillColor: Color(0XFF4c4f5e),
      
    );
  }
}