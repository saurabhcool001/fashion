import 'package:flutter/material.dart';

class CategoryHorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      height: 80.0,
    height: 60.0,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation: 'images/cats/accessories.png',
            imageCaption: 'Accessories',
          ),
          Category(
            imageLocation: 'images/cats/dress.png',
            imageCaption: 'Dress',
          ),
          Category(
            imageLocation: 'images/cats/formal.png',
            imageCaption: 'Formal',
          ),
          Category(
            imageLocation: 'images/cats/informal.png',
            imageCaption: 'Informal',
          ),
          Category(
            imageLocation: 'images/cats/jeans.png',
            imageCaption: 'Jeans',
          ),
          Category(
            imageLocation: 'images/cats/shoe.png',
            imageCaption: 'Shoe',
          ),
          Category(
            imageLocation: 'images/cats/tshirt.png',
            imageCaption: 'Shirt',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  const Category({this.imageLocation, this.imageCaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: new Container(
          width: 80.0,
          child: new ListTile(
            title: Image.asset(
              imageLocation,
//              width: 80.0,
//              height: 50.0,
            ),
            subtitle: new Container(
              alignment: Alignment.topCenter,
                //If you wanna add text of categories then uncomment it
//              padding: EdgeInsets.only(top: 8.0),
//              child: Text(imageCaption, style: TextStyle(fontSize: 12.0),),
            ),
          ),
        ),
      ),
    );
  }
}
