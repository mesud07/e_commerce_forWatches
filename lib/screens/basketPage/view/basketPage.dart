import 'package:e_commerce_app/controller.dart';
import 'package:e_commerce_app/helper/appbar.dart';
import 'package:e_commerce_app/helper/style.dart';
import 'package:e_commerce_app/sample.dart';
import 'package:e_commerce_app/screens/basketPage/model/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatefulWidget {
  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context, "basket"),
        body: Consumer<ProviderViewModel>(builder: (context, item, child) {
          print(item.getSepet.length);
          print("Counter"+item.counter.toString());
          return Container(
            child: Column(
              children: [
               
                Container(
                  //  color: Colors.green,
                  height: MediaQuery.of(context).size.height * 3 / 4,
                  child: ListView.builder(
                      itemCount: item.counter,
                      itemBuilder: (context, index) {
                        return Text(index.toString());
                      }),
                )
              ],
            ),
          );
        }));
  }
}




class BasketProductWidget extends StatelessWidget {
  Product sepetItem;
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
                image: NetworkImage(sepetItem.link),
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
                MyText(sepetItem.productTitle, 18, Colors.black),
                MyText(
                    sepetItem.productCost.toString() + " \$", 17, Colors.black),
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
  Product product;
  BasketCountWidget(this.product);

  @override
  _BasketCountWidgetState createState() => _BasketCountWidgetState();
}

class _BasketCountWidgetState extends State<BasketCountWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1 / 5,

      // color: Colors.grey,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
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
          MyText(widget.product.pruductCount.toString(), 20, Colors.black),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              //decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(width: 2)),
              child: MyText("+", 30, Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
