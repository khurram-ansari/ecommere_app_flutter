import 'package:ecommereapp/colors.dart';
import 'package:ecommereapp/models/product.dart';
import 'package:ecommereapp/pages/product/singleprodview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:intl/intl.dart';
import 'package:badges/badges.dart';

var  formatCurrency = new NumberFormat.simpleCurrency();
class ProductCard extends StatelessWidget {
  final Product prod;
  

  const ProductCard({Key key, this.prod}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_){
          return SingleProductView();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child:(prod.onsale)? _SaleProdCard(context) : _RegularProdCard(context)
      ),
    );
  }
  Widget _RegularProdCard(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      
        child: Container(

          width: MediaQuery.of(context).size.width*0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              Container(
                width:  MediaQuery.of(context).size.width*0.3,
                child: Image.network(prod.image,fit: BoxFit.cover),
              ),
              Text(prod.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
              Text('${formatCurrency.format(prod.price)}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))

            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),color: Colors.white
          ),

        ),
      
    );
  }
  Widget _SaleProdCard(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Badge(

        badgeColor: secondColor,
        badgeContent: Text("Sale",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        padding: EdgeInsets.all(20),
        child: Container(

          width: MediaQuery.of(context).size.width*0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              Container(
                width:  MediaQuery.of(context).size.width*0.3,
                child: Image.network(prod.image,fit: BoxFit.cover),
              ),
              Text(prod.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
              Text('${formatCurrency.format(prod.saleprice)}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
              Text('${formatCurrency.format(prod.regularprice)}',style: TextStyle(decoration: TextDecoration.lineThrough,fontWeight: FontWeight.bold,fontSize: 12,color: Colors.grey)),

            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),color: Colors.white
          ),

        ),
      ),
    );
  }
}
