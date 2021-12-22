
import 'package:flutter/material.dart';

PreferredSizeWidget header (){
  return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: AppBar(
      //leading: Icon(Icons.directions_railway_filled_rounded,color: Colors.black,),
      actionsIconTheme: IconThemeData(
    size: 30.0,
    color: Colors.black,
    opacity: 10.0
  ),
    backgroundColor: Colors.white,
    actions: [
       
      Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: () {},
        child: Icon(
            Icons.shopping_basket,
        ),
      )
    ),
    ],
      ),
  );
}