import 'package:e_commerce_app/helper/style.dart';
import 'package:flutter/material.dart';
class BasketPage extends StatefulWidget {


  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: MyText("My Cart", 20, Colors.black),),
        body: Container(
          child: Column(
            children: [
              Container(
                color: Colors.green,
                height: MediaQuery.of(context).size.height*3/4,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context,index){
                  return BasketProductWidget();
                }),
              )
            ],
          ),
        ),
    );
  }
}

class BasketProductWidget extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.red),
      height: MediaQuery.of(context).size.height/6,
      width: double.infinity,
    );
  }
}