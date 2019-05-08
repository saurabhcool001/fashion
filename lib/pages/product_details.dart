import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final productDetailsName,
      productDetailsPicture,
      productDetailsOldPrice,
      productDetailsPrice;

  const ProductDetails(
      {Key key,
      this.productDetailsName,
      this.productDetailsPicture,
      this.productDetailsOldPrice,
      this.productDetailsPrice})
      : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("Fashion App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
              onPressed: () {}
          ),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {}
              )
        ],
      ),

      body: Hero(
        tag: widget.productDetailsName,
        child: new ListView(
          children: <Widget>[
            new Container(
              height: 300.0,
              child: Container(
                color: Colors.white,
                child: GridTile(
                  //To access base class variable use "widget.___"
                    child: Image.asset(widget.productDetailsPicture),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
