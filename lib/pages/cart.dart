import 'package:flutter/material.dart';

//Custom Package
import 'package:fashion/customClass/home.dart';
import 'package:fashion/pages/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new HomePage()));
            },
            child: new Text("Cart")),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),

      body: new CartProducts(),

      bottomNavigationBar: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            Expanded(
                child: new Row(
                  children: <Widget>[
                    Expanded(
                      flex:0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: new Text("Total : ".toUpperCase()),
                      ),
//                      child: new ListTile(
//                        title: new Text("Total : " +"     "+ "\$230",
//                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
////              subtitle: new Text("\$230"),
//                      ),
                    ),
                    Expanded(
//                        flex: 2,
                        child: new Text(
                          "\$230",
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
            ),
            Expanded(
                child: new MaterialButton(
              height: 71.0,
              onPressed: () {},
              child: new Text(
                "Check out".toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0
                ),
              ),
              color: Colors.red,
            ))
          ],
        ),
      ),
    );
  }
}
