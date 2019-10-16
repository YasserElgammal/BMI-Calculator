import 'package:bmi_calculator/components/reuseable_code.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constans.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultPage extends StatelessWidget {

final String bmiResult;
final String resultText;
final String interpretation;

  const ResultPage({this.bmiResult, this.resultText, this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Result Screen"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Your Result",
                  style: kTitleResult,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Reuseable(
                colour: activeColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: kTxtResult,
                    ),
                    Text(bmiResult, style: kTxtLargeResult),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(interpretation,textAlign: TextAlign.center ,style: TextStyle(fontSize: 20.0,)),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTitle: "Re-calculate",
              func: () {
                Navigator.pop(context, "/");
              },
            )
          ],
        ));
  }
}
