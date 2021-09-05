import 'package:bmi_calculator/Constants.dart';
//import 'package:bmi_calculator/InputPage.dart';
import 'package:bmi_calculator/Mycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.message, this.result, this.calculator);
  final String message;
  final String result;
  final String calculator;

  Color getResultColor() {
    if (result == 'Underweight') {
      return Colors.orange;
    } else if (result == 'Normal') {
      return Colors.green;
    } else if (result == 'Overweight') {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: Text('Your Result', style: kBoldtexting)),
          Expanded(
            flex: 8,
            child: Mycontainer(
              colour: kmycolor,
              mychild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        result,
                        style: kcommonTexting.copyWith(
                            color: getResultColor(),
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ),
                  SizedBox(width: double.infinity),
                  Expanded(
                      flex: 5,
                      child: Center(
                        child: Text(
                          calculator,
                          style: kBoldtexting2,
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: Text('Normal Range is 18.5 to 24.9',
                        style: kcommonTexting.copyWith(color: Colors.green)),
                  ),
                  Expanded(
                      flex: 1,
                      child: Text(
                        message,
                        style: kcommonTexting,
                      ))
                ],
              ),
            ),
          ),
          Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Mycontainer(
                  colour: Colors.red,
                  mychild: Center(
                      child: Text(
                    'RE-CALCULATE',
                    style: kcommonTexting.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
                ),
              ),
              flex: 2)
        ],
      ),
    );
  }
}
