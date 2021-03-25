import 'package:bmi_calculators/components/buttons.dart';
import 'package:bmi_calculators/components/constants.dart';
import 'package:bmi_calculators/components/icon_Contents.dart';
import 'package:bmi_calculators/components/resuable_card.dart';
import 'package:bmi_calculators/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculators/screens/calculation_class.dart';

enum Gender {
  male,
  female,
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender selectedGender;
  int height = 175;
  int weight = 50;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: ResuableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContents(
                    icon: FontAwesomeIcons.mars,
                    lable: 'Male',
                  )),
            ),
            Expanded(
              child: ResuableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour: selectedGender == Gender.female
                    ? kActiveCardColor
                    : kInactiveCardColor,
                cardChild: IconContents(
                  icon: FontAwesomeIcons.venus,
                  lable: 'Female',
                ),
              ),
            )
          ],
        )),
        Expanded(
          child: ResuableCard(
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLableTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text('cm', style: kLableTextStyle)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0XFF8D8E98),
                      thumbColor: kBottomContainerColor,
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 20.0)),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: ResuableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('WEIGHT', style: kLableTextStyle),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(width: 10.0),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ResuableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('AGE', style: kLableTextStyle),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                age--;
                              });
                            }),
                        SizedBox(width: 10.0),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                age++;
                              });
                            })
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
        BottomButton(
          buttonTitle: 'Calculate',
          onTap: () {
            CalculateFunction calc =
                CalculateFunction(height: height, weight: weight);

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    resultInterpretation: calc.getInterpretation(),
                  ),
                ));
          },
        )
      ]),
    ));
  }
}
