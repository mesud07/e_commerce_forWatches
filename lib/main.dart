import 'package:e_commerce_app/screens/basketPage/view/basketPage.dart';
import 'package:e_commerce_app/screens/homePage/homepage.dart';
import 'package:e_commerce_app/screens/productDetailPage/view/productDetail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      theme: ThemeData(
        
      
        primarySwatch: Colors.blue,
      ),
      home: ProductDetailPage(),
    );
  }
}

