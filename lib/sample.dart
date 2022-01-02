
import 'package:e_commerce_app/controller.dart';
import 'package:e_commerce_app/helper/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SamplePage extends StatefulWidget {
  const SamplePage({ Key? key }) : super(key: key);


//PROVİDER YÖNETİMİNİ DENEMEK İÇİN OLUŞTURDUM SAYFAYI
  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ProviderViewModel>(builder: (context,item,child){
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                color: Colors.brown,
                height: MediaQuery.of(context).size.height/3,
                width: 300,
                child: MyText(item.counter.toString(), 30, Colors.black),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (){
                      item.azalt();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.green,
                      height: MediaQuery.of(context).size.height/7,
                      width: 100,
                      child: MyText("-", 60, Colors.black),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      item.arttir();
                      print(item.getSepet.length);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      height: MediaQuery.of(context).size.height/7,
                      width: 100,
                      child: MyText("+", 60, Colors.black),
                    ),
                  ),
                  
                  
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}