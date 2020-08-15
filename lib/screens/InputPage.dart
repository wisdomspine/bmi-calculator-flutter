import 'package:bmi_calculator/Calculator.dart';
import 'package:bmi_calculator/Gender.dart';
import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/screens/ResultPage.dart';
import 'package:bmi_calculator/components/RoundIconButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/GenderWidget.dart';
import '../components/ReusableCard.dart';
import '../constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  final Calculator calculator = Calculator(height: 180, weight: 60);
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      updateColor(Gender.MALE);
                    },
                    color: gender == Gender.MALE
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: GenderWidget(
                      gender: "MALE",
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      updateColor(Gender.FEMALE);
                    },
                    color: gender == Gender.FEMALE
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: GenderWidget(
                      gender: "FEMALE",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "${calculator.height}",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        "cm",
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  Slider(
                    value: calculator.height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newHeight) {
                      setState(() {
                        calculator.height = newHeight.roundToDouble();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              "${calculator.weight}",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text("kg")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  --calculator.weight;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  ++calculator.weight;
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
                  child: ReusableCard(
                    color: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          "$age",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  --age;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  ++age;
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
            ),
          ),
          BottomButton(
            text: "CALCULATE",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ResultPage(
                    calculator: calculator,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void updateColor(Gender gender) {
    this.gender = gender;
    setState(() {});
  }
}
