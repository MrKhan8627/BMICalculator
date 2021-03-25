
import 'package:bmi_calculators/components/buttons.dart';
import 'package:bmi_calculators/components/constants.dart';
import 'package:bmi_calculators/components/resuable_card.dart';
import 'package:flutter/material.dart';


import 'input_page.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult, @required this.resultText, @required this.resultInterpretation});

  final String bmiResult;
  final String resultText;
  final String resultInterpretation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('BMI CALCULATOR'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Your Result',
                    style: kTitleTextStyle,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: ResuableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText,
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmiResult, 
                        style: kBMITextStyle),
                        Text(
                          resultInterpretation,
                          style: kResultBodyTextStyle,
                          textAlign: TextAlign.center
                        )
                    ],
                  ),
                ),
              ),
              BottomButton(buttonTitle: 'Re-Calculate', onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ));
      },)
            ],
          )),
    );
  }
}
