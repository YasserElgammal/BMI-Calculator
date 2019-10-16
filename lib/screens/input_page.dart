import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constans.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/squere_content.dart';
import 'package:bmi_calculator/components/reuseable_code.dart';
import 'package:bmi_calculator/components/round_icon.dart';
import 'package:bmi_calculator/calculate_brain.dart';

enum GenderType { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColor = inactiveColor;
  // Color femaleCardColor = inactiveColor;
  GenderType selectedGender;
  int heightNumber = 180;
  int weight = 60;
  int age = 19;

//    void updateGender(GenderType selectedType) {

//   if(selectedType == GenderType.Male){
//    if (maleCardColor == inactiveColor){
//      maleCardColor = activeColor;
//      femaleCardColor = inactiveColor;
//    }else{
//      maleCardColor = inactiveColor;
//    }
//   }

// if(selectedType == GenderType.Female){
//    if (femaleCardColor == inactiveColor){
//      femaleCardColor = activeColor;
//      maleCardColor = inactiveColor;
//    }else{
//      femaleCardColor = inactiveColor;
//    }
// }
//   }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('BMI CALCULATOR'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Reuseable(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.Male;
                        });
                      },
                      colour: selectedGender == GenderType.Male
                          ? activeColor
                          : inactiveColor,
                      cardChild: SquereContent(
                        iconGender: FontAwesomeIcons.mars,
                        typeGender: "Male",
                      ),
                    )),
                    Expanded(
                        child: Reuseable(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.Female;
                        });
                      },
                      colour: selectedGender == GenderType.Female
                          ? activeColor
                          : inactiveColor,
                      cardChild: SquereContent(
                        iconGender: FontAwesomeIcons.female,
                        typeGender: "Female",
                      ),
                    ))
                  ],
                ),
              ),
              Expanded(
                child: Reuseable(
                  colour: activeColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Height",
                        style: labelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text("$heightNumber", style: weightTextMiddle),
                          Text("CM")
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x35EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 25.0),
                        ),
                        child: Slider(
                          value: heightNumber.toDouble(),
                          min: 120.0,
                          max: 200.0,
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              heightNumber = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Reuseable(colour: activeColor,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Weight", style: labelTextStyle,),
                        Text("$weight", style: weightTextMiddle ,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          func: 
                          (){
                            setState(() {
                             weight == 250? weight = 250: weight++; 
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          func: (){
                            setState(() {
                            //  weight--;
                             weight == 0? weight = 0: weight--; 
                            });
                          },
                        ),
                      ],
                    )
                  ],
                  
                ),
                
                ),
              ),
              Expanded(
                child: Reuseable(colour: activeColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Age", style: labelTextStyle),
                    Text("$age", style: weightTextMiddle ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          func: 
                          (){
                            setState(() {
                             age == 100? age = 100: age++; 
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          func: 
                          (){
                            setState(() {
                             age == 0? age = 0: age--; 
                            });
                          },
                        ),                        
                      ],
                    )
                  ],
                ),
                ),
              ),
            ],
          )),
           BottomButton(
             func:
             (){
             CalculateBrain calc = CalculateBrain(heightNumber, weight);

              Navigator.push(context,
              MaterialPageRoute(
              builder: (context) => ResultPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              )
              )
              );
             },
             buttonTitle: "Calculate",
           )
        ],
      ),
    );
  }
}



