import 'package:flutter/material.dart';

const kBottomContainerHeight = 80.0;

const kActiveCardColour = Colors.transparent;
const kInactiveCardColour = Colors.transparent ;
const kActiveColour = Color(0xFFFFFFFF);
const kAppcolor = Color(0xFFFFFFFF);
const kBottoncolor = Color(0xFF02102A);
const kblack=Colors.black;

const kLabelTextStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.white, fontWeight: FontWeight.bold);
const kEdit = TextStyle(
  fontSize: 15.0,
  color: Colors.black, fontWeight: FontWeight.bold);
const kDetail= TextStyle(
color: Colors.black,
fontSize: 22,
fontWeight: FontWeight.bold,
);
const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,

);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);
Appbare(String title, {required List<Widget> actions}){
  return AppBar(
    title: Text(title,style: kLabelTextStyle,),
    backgroundColor: Colors.lightBlue.shade900,
    actions:actions,
  );
}

