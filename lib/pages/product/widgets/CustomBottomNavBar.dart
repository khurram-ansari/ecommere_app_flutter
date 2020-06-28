import 'package:ecommereapp/colors.dart';
import 'package:flutter/material.dart';
class CartCustomBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: secondColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
            onPressed: (){},
            padding: EdgeInsets.only(top: 15,bottom: 15,left: 50,right: 50),
            color: thirdcolor,
            child: Text("Buy now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.all(0),
            onPressed: (){},
            color: thirdcolor,
            child: Container(
              width: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 8,
                      child: Text("Add to cart",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15))),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
//                          fontSize: 15
                      ),
//                        textAlign: TextAlign.center,
                      autofocus: false,
                      initialValue: '1',
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 14,bottom: 14,left: 5),
                          fillColor: mainColor,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.red
                              ),
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topRight: Radius.circular(10))
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      height: 65,
      width: MediaQuery.of(context).size.width,
    );
  }
}
