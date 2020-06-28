import 'package:flutter/material.dart';
class BlankCatCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Container(

        width: MediaQuery.of(context).size.width*0.3,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20)
    ) )) ;

  }
}
