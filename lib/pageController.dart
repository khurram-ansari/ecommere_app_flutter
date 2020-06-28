import 'package:flutter/material.dart';
import 'package:ecommereapp/pages/Search_product.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ecommereapp/pages/Cart.dart';
import 'package:ecommereapp/pages/home/home.dart';
import 'package:ecommereapp/colors.dart';

class Homepage extends StatefulWidget {

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


int currentPage=0;
List<Widget> pages=[
  Home(),
  searchprod,
  cartpage,
];
  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
        backgroundColor: mainColor,
       body: _getPage(currentPage),
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: secondColor,
//          activeColor: mainColor,

          color: Colors.white,
//          top:0,
          items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.shopping_cart, title: 'Cart'),
          ],
          //optional, default as 0
          onTap: (int i) {
            setState(() {
              currentPage=i;
            });
          },
    )
      );

  }

  _getPage(int index) {
      return pages[index];
  }


}
