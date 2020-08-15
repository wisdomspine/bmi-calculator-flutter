import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String text;

  final void Function() onTap;

  const BottomButton({@required this.text, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 25.0),
        ),
        margin: EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
        color: kBottomContainerColor,
      ),
    );
  }
}
