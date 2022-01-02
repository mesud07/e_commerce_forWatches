

import 'package:e_commerce_app/screens/basketPage/view/basketPage.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget header (BuildContext context,String name){
  return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: AppBar(
      //leading: Icon(Icons.directions_railway_filled_rounded,color: Colors.black,),
      actionsIconTheme: IconThemeData(
    size: 30.0,
    color: Colors.black,
    opacity: 10.0
  ),
  leading: name=="basket"||name=="productDetail"?IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),
  onPressed: (){
    name=="basket"||name=="productDetail"? Navigator.pop(context):null;
  },):null,
    backgroundColor: Colors.white,
    actions: [
       
     name!="basket"? Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>BasketPage()));
        },
        child: Icon(
            Icons.shopping_basket,
        ),
      )
    ):Container(),
    ],
      ),
  );
}