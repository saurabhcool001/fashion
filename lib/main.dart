import 'package:flutter/material.dart';

//Custom Package
import 'package:fashion/customClass//home.dart';
import 'package:fashion/pages/login.dart';

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
//      home: HomePage()
    home: Login()
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
