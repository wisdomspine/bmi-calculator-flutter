import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;

  const RoundIconButton({Key key, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints(
        minWidth: 34,
        minHeight: 34,
        maxHeight: 48,
        maxWidth: 48,
      ),
      child: Icon(icon),
    );
  }
}
