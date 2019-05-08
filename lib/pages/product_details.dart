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
                child: GridTile(
                  child: Container(
                    color: Colors.white,
                  //To access base class variable use "widget.___"
                    child: Image.asset(widget.productDetailsPicture),
                ),
                  footer: new Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: new Text(widget.productDetailsName,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                      title: new Row(
                        children: <Widget>[
                          Expanded(
                              child: new Text("\$${widget.productDetailsOldPrice}",
                              style: new TextStyle(color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 14.0),)
                          ),
                          Expanded(child: new Text("\$${widget.productDetailsPrice}",
                          style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16.0),)
                          )
                        ],
                      ),
                    ),
                  ),
              ),
            ),

            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    onPressed: (){},
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: new Text("Size")),
                        Expanded(child: new Icon(Icons.arrow_drop_down)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: (){},
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: new Text("Color")),
                        Expanded(child: new Icon(Icons.arrow_drop_down)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: (){},
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: new Text("Qty")),
                        Expanded(child: new Icon(Icons.arrow_drop_down)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            //Buy Button
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                      onPressed: (){},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: new Text("BUY NOW"),
                  ),
                ),
                
                new IconButton(icon: Icon(Icons.add_shopping_cart), color: Colors.red, onPressed: (){}),
                new IconButton(icon: Icon(Icons.favorite_border), color: Colors.red, onPressed: (){})
              ],
            ),

          ],
        ),
      ),
    );
  }
}
