import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//Custom Package
import 'package:fashion/customClass/category_horizontal_listview.dart';
import 'package:fashion/customClass/recent_product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      height: 250.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("images/c1.jpg"),
          AssetImage("images/m1.jpeg"),
          AssetImage("images/m2.jpg"),
          AssetImage("images/w1.jpeg"),
          AssetImage("images/w3.jpeg"),
          AssetImage("images/w4.jpeg"),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        autoplayDuration: Duration(milliseconds: 1000),
        dotSize: 5.0,
        indicatorBgPadding: 6.0,
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red,
            centerTitle: true,
            title: Text("Fashion App"),
            actions: <Widget>[
              new IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {})
            ]),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text("Saurabh"),
                accountEmail: Text("parmarsaurabh@gmail.com"),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white, size: 50),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.red),
              ),

              //Body part of navigation list
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Home"),
                  leading: Icon(Icons.home, color: Colors.red,),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("My Account"),
                  leading: Icon(Icons.person, color: Colors.red,),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("My Orders"),
                  leading: Icon(Icons.shopping_basket, color: Colors.red,),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Categories"),
                  leading: Icon(Icons.dashboard, color: Colors.red,),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Favorites"),
                  leading: Icon(Icons.favorite, color: Colors.red,),
                ),
              ),

              Divider(),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Settings"),
                  leading: Icon(Icons.settings),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.help),
                ),
              ),
            ],
          ),
        ),
        body: new ListView(
          children: <Widget>[
            //Image Carousel
            imageCarousel,

            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text("Categories"),
            ),

            //Category List in Horizontal
            CategoryHorizontalList(),

            new Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 8.0),
              child: new Text("Recent Product"),
            ),

            //Recent Product List
            Container(
              height: 320.0,
              child: RecentProduct(),
            ),
          ],
        ));
  }
}
