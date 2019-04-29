import 'package:flutter/material.dart';

void main(){
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Container(
          color: Colors.greenAccent,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: new Column(
//              child: new Row(
              children: <Widget>[
                Text("One"),
                Text("Two"),
                Text("Three"),
              ],
            ),
          ),
      ),
    )
  );
}