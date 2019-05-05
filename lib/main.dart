import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new GridView.count(crossAxisCount: 4,
      children: <Widget>[
        Text("one"),
        Text("Two"),
        Text("Three"),
        Text("Four"),
        Text("one"),
        Text("Two"),
        Text("Three"),
        Text("Four"),
      ],), 
    ),
  );
}