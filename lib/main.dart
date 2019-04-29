import 'package:flutter/material.dart';

void main(){
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Container(
        color: Colors.greenAccent,
        child: new Center(
          child: Text("Hello!!!"),
        ),
      ),
    )
  );
}