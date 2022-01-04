

import 'package:e_commerce_app/controller.dart';
import 'package:e_commerce_app/helper/style.dart';
import 'package:e_commerce_app/screens/basketPage/view/basketPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

PreferredSizeWidget header (BuildContext context,String name){
  return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: AppBar(
      centerTitle: true,
      title: name=="basket"?MyText("Sepet", 25, Colors.black):null,
      //leading: Icon(Icons.directions_railway_filled_rounded,color: Colors.black,),
      actionsIconTheme: IconThemeData(
    size: 30.0,
    color: Colors.black,
    opacity: 10.0
  ),
  leading: name=="basket"||name=="productDetail"?IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),
  onPressed: (){
    name=="basket"||name=="productDetail"? Navigator.pop(context):null;
  },):Icon(Icons.circle,color: Colors.black,size: 30,),
    backgroundColor: Colors.white,
    actions: [
       
     name!="basket"? Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>BasketPage()));
        },
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.search,size: 30,),onPressed: (){
              context.read<ProviderViewModel>().acKapa();
            },),
            Container(
             
              alignment: Alignment.center,
             
              child: Stack(
                children:[
                  Container(
                    width: 40,
                    child: Icon(
                      Icons.shopping_basket,
                ),
                  ),
               
                  Container(
                    
                   width: 15,
                   height: 15,
                   alignment: Alignment.center,
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.red),
                   child: MyTitleText(context.watch<ProviderViewModel>().getSepet.length.toString(),10,Colors.white),
                  
                       ),
               
                ]
      ),
            ),
          ],
        )
    )):Container(),
    ],
      ),
  );
}