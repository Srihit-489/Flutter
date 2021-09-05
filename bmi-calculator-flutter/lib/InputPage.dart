import 'package:bmi_calculator/Mycontainer.dart';
import 'package:bmi_calculator/ResultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constants.dart';
import 'Logic.dart';
import 'dart:math';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 50;
  int age = 18;
  Color maleCardColor = kactiveCardColor;
  Color femaleCardColor = kinactiveCardColor;

  @override
  Widget build(BuildContext context) {
    void setactive(Gender input) {
      if (input == Gender.Male) {
        femaleCardColor = kinactiveCardColor;
        maleCardColor = kactiveCardColor;
      } else {
        femaleCardColor = kactiveCardColor;
        maleCardColor = kinactiveCardColor;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Mycontainer(
                        onpress: () {
                          setState(() {
                            setactive(Gender.Male);
                          });
                        },
                        colour: maleCardColor,
                        mychild: Column(
                          children: [
                            Icon(
                              FontAwesomeIcons.mars,
                              color: Colors.white,
                              size: 80,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Male', style: kcommonTexting)
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Mycontainer(
                        onpress: () {
                          setState(() {
                            setactive(Gender.Female);
                          });
                        },
                        colour: femaleCardColor,
                        mychild: Column(
                          children: [
                            Icon(
                              FontAwesomeIcons.venus,
                              size: 80,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Female',
                              style: kcommonTexting,
                            )
                          ],
                        ),
                      ))
                ],
              )),
          Expanded(
              flex: 1,
              child: Mycontainer(
                colour: kmycolor,
                mychild: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: kcommonTexting,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(), style: kBoldtexting),
                          Text('CM', style: kcommonTexting)
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 10),
                            overlayColor: Color(0x29EB1555),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25)),
                        child: Slider(
                          value: height.toDouble(),
                          min: 50,
                          max: 250,
                          onChanged: (double newvalue) {
                            setState(() {
                              height = newvalue.round();
                              print(newvalue);
                            });
                          },
                          inactiveColor: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Mycontainer(
                        colour: kmycolor,
                        mychild: Column(
                          children: [
                            Text('WEIGHT', style: kcommonTexting),
                            Text(weight.toString(), style: kBoldtexting),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyroundButton(
                                  icon: FontAwesomeIcons.minus,
                                  onpress: () {
                                    setState(() {
                                      weight = weight - 1;
                                    });
                                  },
                                ),
                                SizedBox(width: 20),
                                MyroundButton(
                                  icon: Icons.add,
                                  onpress: () {
                                    setState(() {
                                      weight = weight + 1;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Mycontainer(
                          colour: kmycolor,
                          mychild: Column(
                            children: [
                              Text('AGE', style: kcommonTexting),
                              Text(age.toString(), style: kBoldtexting),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyroundButton(
                                    icon: FontAwesomeIcons.minus,
                                    onpress: () {
                                      setState(() {
                                        age = age - 1;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 20),
                                  MyroundButton(
                                    icon: Icons.add,
                                    onpress: () {
                                      setState(() {
                                        age = age + 1;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          )))
                ],
              )),
          GestureDetector(
            onTap: () {
              setState(() {
                double calculated = weight / pow(height / 100, 2);
                Logic bmi = Logic(weight, height, calculated);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        bmi.message(),
                        bmi.result(),
                        bmi.getbmi(),
                      );
                    },
                  ),
                );
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: 80,
              width: double.infinity,
              color: Colors.red[600],
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyroundButton extends StatelessWidget {
  final Function onpress;
  final IconData icon;
  MyroundButton({this.icon, this.onpress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      elevation: 6,
      child: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
      shape: CircleBorder(),
      fillColor: Colors.red,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
