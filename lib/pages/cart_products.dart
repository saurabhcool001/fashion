import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var cartProductList = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 85,
      "size": "7",
      "color": "black",
      "quantity": 1,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "price": 50,
      "size": "5",
      "color": "red",
      "quantity": 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: cartProductList.length,
        itemBuilder: (context, index) {
          return new SingleCartProduct(
            cartProductName: cartProductList[index]["name"],
            cartProductPicture: cartProductList[index]["picture"],
            cartProductPrice: cartProductList[index]["price"],
            cartProductSize: cartProductList[index]["size"],
            cartProductColor: cartProductList[index]["color"],
            cartProductQuantity: cartProductList[index]["quantity"],
          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProductName,
      cartProductPicture,
      cartProductPrice,
      cartProductSize,
      cartProductColor,
      cartProductQuantity;

  const SingleCartProduct(
      {Key key,
      this.cartProductName,
      this.cartProductPicture,
      this.cartProductPrice,
      this.cartProductSize,
      this.cartProductColor,
      this.cartProductQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
        child: new ListTile(
          //Leading Section
          leading: new Image.asset(
            cartProductPicture,
            fit: BoxFit.contain,
            width: 80.0,
            height: 80.0,
          ),

          //Title Section
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
            child: new Text(cartProductName),
          ),

          //SubTitle Section
          subtitle: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  //For Product Size
                  Expanded(
                      flex: 2,
                      child: new Row(
                        children: <Widget>[
                          Expanded(
                            child: new Text("Size : "),
                            flex: 0,
                          ),
                          Expanded(
                            child: new Text(
                              cartProductSize,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      )),

                  //For Product Color
                  Expanded(
                    flex: 5,
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: new Text("Color : "),
                        ),
                        Expanded(
                          child: new Text(
                            cartProductColor,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //For Product Price
              new Container(
                alignment: Alignment.topLeft,
                child: new Text(
                  "\$$cartProductPrice",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          trailing: new Column(
            children: <Widget>[
              new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
              new Text("$cartProductQuantity"),
              new IconButton(
                  icon: Icon(Icons.arrow_drop_down), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
