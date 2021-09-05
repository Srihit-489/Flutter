import 'package:flutter/material.dart';
import 'InputPage.dart';
//import 'package:bmi_calculator/ResultPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0E031B),
        primaryColor: Color(0xFF0E031B),
      ),
      home: InputPage(),
    );
  }
}
