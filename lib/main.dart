import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import 'screens/InputPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0D22),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        textTheme: TextTheme(
          caption: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8D98),
          ),
          headline2: Theme.of(context).textTheme.headline2.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 50.0,
              ),
          bodyText1: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 22.0,
                color: Theme.of(context).primaryTextTheme.bodyText1.color,
              ),
          bodyText2: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 18.0,
                color: Theme.of(context).primaryTextTheme.bodyText1.color,
              ),
        ),
        sliderTheme: Theme.of(context).sliderTheme.copyWith(
              activeTrackColor: Colors.white,
              inactiveTrackColor: Color(0xFF8D8E98),
              thumbColor: kBottomContainerColor,
              overlayColor: kBottomContainerColor.withOpacity(.2),
              trackHeight: 1,
            ),
      ),
      home: InputPage(),
    );
  }
}
