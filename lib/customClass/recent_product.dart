import 'package:flutter/material.dart';

//Custom Package
import 'package:fashion/pages/product_details.dart';

class RecentProduct extends StatefulWidget {
  @override
  _RecentProductState createState() => _RecentProductState();
}

class _RecentProductState extends State<RecentProduct> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "old_price": 200,
      "price": 170,
    },
    {
      "name": "Jeans",
      "picture": "images/products/pants2.jpeg",
      "old_price": 190,
      "price": 150,
    },
    {
      "name": "Shoe",
      "picture": "images/products/shoe1.jpg",
      "old_price": 80,
      "price": 75,
    },
    {
      "name": "Flower dress",
      "picture": "images/products/skt1.jpeg",
      "old_price": 120,
      "price": 80,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
            productName: product_list[index]['name'],
            productPicture: product_list[index]['picture'],
            productOldPrice: product_list[index]['old_price'],
            productPrice: product_list[index]['price'],
          );
        });
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldPrice;
  final productPrice;

  SingleProduct({
    this.productName,
    this.productPicture,
    this.productOldPrice,
    this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: productName,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ProductDetails(
                    productDetailsName: productName,
                    productDetailsPicture: productPicture,
                    productDetailsOldPrice: productOldPrice,
                    productDetailsPrice: productPrice,
                  ))),
              child: GridTile(
                footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        productName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "\$$productPrice",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      subtitle: Text(
                        "\$$productOldPrice",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    )),
                child: Image.asset(
                  productPicture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
    );
  }
}
