import 'package:flutter/material.dart';

int fontSize = 0;
double letterSpacing = 0.5;
Color colorTheme = Colors.red;

const textInputDecoration = InputDecoration(
  errorStyle: TextStyle(fontSize: 14.0),
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 2.0),
  ),
);
/*
dynamic layout = new Column(
  children: <Widget>[
    Text(
      'Police Act 1990',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
    SizedBox(height: 15),
    Text(
      'Total questions : 50 ',
      style: TextStyle(
        fontSize: 18,
      ),
      textAlign: TextAlign.center,
    ),
    SizedBox(height: 15),
    Text(
      'Level : Junior ',
      style: TextStyle(
        fontSize: 18,
      ),
    ),
  ],
);
*/
