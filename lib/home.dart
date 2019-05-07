import 'package:flutter/material.dart';

// Stateless Widget
//class HomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Colors.white,
//      child: new Column(
//        children: <Widget>[
//          Text("Stateless Widget"),
//          Icon(Icons.person)
//        ],
//      ),
//    );
//  }
//}

//Stateful Widget
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Text("Stateful Widget"),
          Icon(Icons.person)
        ],
      ),
    );
  }
}

