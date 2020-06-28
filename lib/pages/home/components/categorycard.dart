import 'package:flutter/material.dart';
import 'package:ecommereapp/models/category.dart';
import 'package:flutter/cupertino.dart' as prefix0;
class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(

        width: MediaQuery.of(context).size.width*0.3,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 70,
              height: 70,
//			  				color: Colors.blue,
              child: prefix0.Image.network(category.image,fit: prefix0.BoxFit.cover),
            ),
            Text(category.category,style: prefix0.TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
          ],
        ),

      ),
    );
  }
}

