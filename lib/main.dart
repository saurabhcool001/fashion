import 'package:flutter/material.dart';

//Custome Package
import 'package:fashion/customClass//home.dart';

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
