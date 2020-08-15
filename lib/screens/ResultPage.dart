import 'package:bmi_calculator/Calculator.dart';
import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/ReusableCard.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final Calculator calculator;

  const ResultPage({Key key, this.calculator});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Your Result",
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(fontSize: 50.0),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    calculator.result,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Color(0xFF72D275)),
                  ),
                  Text(
                    calculator.bmi.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontSize: 100.0),
                  ),
                  Column(
                    children: [
                      Text(
                        "Normal BMI range:",
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text("18.5- 25.0 kg/m\u00B2")
                    ],
                  ),
                  Text(
                    calculator.interpretation,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
              text: "RE-CALCULATE",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
