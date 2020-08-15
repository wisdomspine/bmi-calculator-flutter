import 'dart:math' as Math;

class Calculator {
  double height;
  double weight;

  Calculator({this.height, this.weight});

  double get bmi =>
      double.parse((weight / Math.pow(height / 100, 2)).toStringAsFixed(1));

  String get result {
    double bmi = this.bmi;
    if (bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String get interpretation {
    double bmi = this.bmi;
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more🎅';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight. Good job!✔';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more🍜';
    }
  }
}
