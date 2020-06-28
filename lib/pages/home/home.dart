import 'dart:convert';
import 'dart:ui';
import 'package:ecommereapp/models/product.dart';
import 'package:ecommereapp/pages/home/components/blankprodcard.dart';
import 'package:ecommereapp/pages/home/components/productcard.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ecommereapp/pages/home/components/blankcategorycard.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:io';
import 'package:ecommereapp/models/category.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:ecommereapp/colors.dart';
import 'package:ecommereapp/widgets/Header.dart';
import 'package:ecommereapp/pages/home/components/categorycard.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:ecommereapp/api.dart';
class Home extends StatefulWidget {
	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


	final SwiperController swiperController = SwiperController();




	@override
	Widget build(BuildContext context) {
		Size screensize=MediaQuery.of(context).size;
		return ListView(
			children: <Widget>[
				Header(),
				Padding(
					padding: EdgeInsets.only(top: screensize.height*0.001,left: screensize.width*0.04,bottom:screensize.height*0.03 ),
					child: Text("Featured Products",style: prefix1.TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35)),
				),
				Container(
//	            color: Colors.red,
					height: screensize.height*0.35,
					child: FutureBuilder(
						future: api().getfeaturedProd(),
					  builder:(BuildContext context , AsyncSnapshot snapshot){
							if(snapshot.data==null){
								return  Shimmer.fromColors(
										baseColor: secondColor,
										highlightColor: Color(0xff385e98),
										child: ListView(
											scrollDirection: Axis.horizontal,
											children: <Widget>[
												BlankProdCard(),
												BlankProdCard(),
												BlankProdCard(),
											],
										)
								);
						}
							else{
								return 	Swiper(

									itemBuilder: (BuildContext context, int index) {
										return ProductCard(
											prod: snapshot.data[index],
										);
									},
									itemCount: snapshot.data.length,
									scale: 0.8,
									controller: swiperController,
									viewportFraction: 0.6,
									loop: false,
									fade: 0.5,
								) ;

		}
		}


					),
				),
				Padding(
					padding: EdgeInsets.only(top: screensize.height*0.03,bottom: screensize.height*0.03,left: screensize.width*0.04,right: screensize.width*0.04),
					child:Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						crossAxisAlignment: CrossAxisAlignment.end,
						children: <Widget>[ Text("Categories",style: prefix1.TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35))
							,
							Text("See All",style: prefix1.TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),
						],
					),
				),
				Container(
					height: screensize.height*0.16,

//					color: Colors.red,
					child: FutureBuilder(
						future: api().getcat(),
					  builder: (BuildContext context , AsyncSnapshot snapshot){
							if (snapshot.data==null){
								return Shimmer.fromColors(
									baseColor: secondColor,
									highlightColor: Color(0xff385e98),
								  child: ListView(
										scrollDirection: Axis.horizontal,
										children: <Widget>[
											BlankCatCard(),
											BlankCatCard(),
											BlankCatCard(),
										],
									)
								);
							} else{
							return ListView.builder(
								scrollDirection: Axis.horizontal,
								itemCount: snapshot.data.length,
								itemBuilder: (BuildContext context,int index){
									return CategoryCard(category: snapshot.data[index]);
								},
							);
						}
							},
					),
				)

			],
		);
	}

}


