import 'package:e_commerce_app/controller.dart';
import 'package:e_commerce_app/helper/appbar.dart';
import 'package:e_commerce_app/helper/style.dart';

import 'package:e_commerce_app/screens/basketPage/model/basketProduct.dart';
import 'package:e_commerce_app/screens/basketPage/model/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatefulWidget {
  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
   

  late ProviderViewModel _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=ProviderViewModel();
  }
  @override
  Widget build(BuildContext context) {
 List<BasketProduct> sepetList=context.watch<ProviderViewModel>().getSepet;
    return Scaffold(
      bottomSheet: myBottomSheet(context, sepetList),
        appBar: header(context, "basket"),
        body: Consumer<ProviderViewModel>(builder: (context, item, child) {
          print(item.getSepet.length);
          
          return Container(
            child: Column(
              children: [
              
            
                Container(
                  //  color: Colors.green,
                  height: MediaQuery.of(context).size.height * 3 / 4,
                  child: ListView.builder(
                      itemCount: item.getSepet.length,
                      itemBuilder: (context, index) {
                        return BasketProductWidget(item.getSepet[index]);
                      }),
                ),
              ],
            ),
          );
        }));
  }

  Stack myBottomSheet(BuildContext context, List<BasketProduct> sepetList) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
      Container(
      height:  MediaQuery.of(context).size.height/12,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(1),borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))),),
      Container(
        decoration: BoxDecoration(color: Colors.black.withOpacity(1),borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))),
        height: MediaQuery.of(context).size.height/13,
        width: double.infinity,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(child: MyTitleText(context.watch<ProviderViewModel>().sepetHesapla(sepetList).toString()+" \$", 25, Colors.white),),
            InkWell(
              onTap: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.arrow_right_alt_outlined,color: Colors.white,size: 30,),
                  MyText("Ödemeye Geç",20,Colors.white),
                ],
              ),
            ),
            
          ],
        )),
    
    ],);
  }
}




class BasketProductWidget extends StatelessWidget {
  BasketProduct sepetItem;
  BasketProductWidget(this.sepetItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          //color: Colors.red,
          borderRadius: BorderRadius.circular(10)),
      height: MediaQuery.of(context).size.height / 6,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width / 3,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.1),
            ),
            child: Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(sepetItem.product.link),
              )),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 3 / 5,
            //color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyText(sepetItem.product.productTitle, 15, Colors.black),
                MyText(
                    sepetItem.product.productCost.toString() + " \$", 17, Colors.black),
                Container(
                  //color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BasketCountWidget(sepetItem),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BasketCountWidget extends StatefulWidget {
 
  BasketProduct product;
  BasketCountWidget(this.product);

  @override
  _BasketCountWidgetState createState() => _BasketCountWidgetState();
}

class _BasketCountWidgetState extends State<BasketCountWidget> {
    
   late ProviderViewModel _controller;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=ProviderViewModel();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderViewModel>(builder: (context,item,child){
      return Container(
      width: MediaQuery.of(context).size.width * 1 / 5,

      // color: Colors.grey,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              item.urunAzalt(widget.product);
              print("azaltildi");
            },
            child: Container(
              height: 25,
              width: 25,
              //decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(width: 2)),
              child: Icon(Icons.remove),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          MyText(widget.product.count.toString(), 20, Colors.black),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              item.urunArttir(widget.product);
            },
            child: Container(
              //decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(width: 2)),
              child: MyText("+", 30, Colors.black),
            ),
          ),
        ],
      ),
    );
    });
  }
}
