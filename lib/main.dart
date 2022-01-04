import 'package:e_commerce_app/controller.dart';

import 'package:e_commerce_app/screens/basketPage/view/basketPage.dart';
import 'package:e_commerce_app/screens/homePage/homepage.dart';
import 'package:e_commerce_app/screens/productDetailPage/view/productDetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value:ProviderViewModel()),
      ],
      child: MyApp(),
    ),
  );
  
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
      
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

