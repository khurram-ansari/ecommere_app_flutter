import 'package:flutter/material.dart';
import 'package:ecommereapp/pageController.dart';
import 'package:ecommereapp/pages/Search_product.dart';
import 'package:custom_navigator/custom_navigator.dart';
import 'package:ecommereapp/colors.dart';
void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor:mainColor,
//        primaryColor: mainColor,
        fontFamily: 'Montserrat',
      ),
      home: Homepage(),
    );
  }
}

