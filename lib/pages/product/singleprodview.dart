import 'package:ecommereapp/colors.dart';
import 'package:ecommereapp/pages/product/widgets/CustomBottomNavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      bottomNavigationBar:CartCustomBottomNav(),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Product details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.4,
                child: Image.asset("images/products/shoes.png"),

              )
            ],
          ),
        ),
      ),
    );
  }
}
