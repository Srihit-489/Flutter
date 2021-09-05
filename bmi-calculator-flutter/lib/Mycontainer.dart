import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mycontainer extends StatelessWidget {
  final Color colour;
  final Widget mychild;
  final Function onpress;

  Mycontainer({@required this.colour, this.mychild, this.onpress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: mychild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: colour),
      ),
    );
  }
}
