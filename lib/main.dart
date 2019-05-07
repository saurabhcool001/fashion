import 'package:flutter/material.dart';
import 'package:fashion/home.dart';

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    )
  );
}

//class HomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Colors.white,
//      child: Column(
//        children: <Widget>[
//          Text("Hey"),
//          Icon(Icons.person),
//        ],
//      ),
//    );
//  }
//}
