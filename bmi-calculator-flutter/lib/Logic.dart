import 'package:flutter/material.dart';

class Logic extends StatelessWidget {
  final int weight;
  final int height;
  final double bmi;
  Logic(this.weight, this.height, this.bmi);

  String getbmi() {
    return bmi.toStringAsFixed(1);
  }

  String result() {
    if (bmi == 18.5) {
      return 'Underweight';
    } else if (bmi < 18.5) {
      return 'Underweight';
    } else if (18.5 < bmi && bmi < 24.9) {
      return 'Normal';
    } else if (24.9 == bmi) {
      return 'Normal';
    } else if (24.9 < bmi && bmi < 29) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  String message() {
    if (bmi == 18.5) {
      return 'You have to eat more';
    } else if (bmi < 18.5) {
      return 'You have to eat more';
    } else if (18.5 < bmi && bmi < 24.9) {
      return 'You are good,Keep it up';
    } else if (24.9 == bmi) {
      return 'You are good,Keep it up';
    } else if (24.9 < bmi && bmi < 29) {
      return 'Start exercising and avoid eating junk food ';
    } else {
      return 'Start exercising as soon as possible';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
