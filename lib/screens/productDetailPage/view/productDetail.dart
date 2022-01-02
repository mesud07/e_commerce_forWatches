import 'package:e_commerce_app/controller.dart';
import 'package:e_commerce_app/helper/appbar.dart';
import 'package:e_commerce_app/helper/style.dart';
import 'package:e_commerce_app/screens/basketPage/model/basketProduct.dart';
import 'package:e_commerce_app/screens/basketPage/model/product.dart';
import 'package:e_commerce_app/screens/productDetailPage/model/colorModel.dart';
import 'package:e_commerce_app/screens/productDetailPage/model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  Product productItem;
  ProductDetailPage(this.productItem);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _counter=1;

  late ProviderViewModel _controller;
  late String _watchLink;
  late String _watchTitle;
  late String _watchDesc;
  late double _watchCost;
  static const Map<String, int> varyasyonlar = {
    "42mm": 42,
    "43mm": 43,
    "44mm": 44,
    "45": 45,
    "46mm": 46,
  };

  static const Map<String, Color> colorsMap = {
    "Kırmızı": Colors.red,
    "Beyaz": Colors.white,
    "Yeşil": Colors.green,
  };

  ProductModel secilenDeger = ProductModel("42mm", 42);
  ColorModel secilenRenk = ColorModel("Kırmızı", Colors.red);
  

  List<DropdownMenuItem<ProductModel>> varyasyonListDropDown = [];
  List<DropdownMenuItem<ColorModel>> colorListDropDown = [];

  void initState() {
    super.initState();
    _watchLink=widget.productItem.link;
    _watchTitle= widget.productItem.productTitle;
    _watchDesc=widget.productItem.productDesc;
    _watchCost=widget.productItem.productCost;

    List<ProductModel> varyasyonList = varyasyonlar.entries
        .map((entry) => ProductModel(entry.key, entry.value))
        .toList();

    List<ColorModel> colorList =
        colorsMap.entries.map((e) => ColorModel(e.key, e.value)).toList();

    setVaryasyonItems(varyasyonList);
    setRenkItems(colorList);

    _controller = ProviderViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, "productDetail"),
      body: Container(
        color: Colors.pinkAccent.withOpacity(0.05),
        child: Column(
          children: [
            DetailPageImage(
              height: MediaQuery.of(context).size.height * 5 / 12,
              width: double.infinity,
              link: _watchLink,
              backgroundColor: Colors.transparent,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 4 / 12,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                          margin: EdgeInsets.all(20),
                          child: MyTitleText(_watchTitle,20,Colors.black)),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.all(10),
                        child: Icon(
                          Icons.favorite_outline,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: MyText(_watchDesc, 17, Colors.black)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    
                    children: [
                      sizeDropDown(),
                     
                      Container(
      width: MediaQuery.of(context).size.width * 1 / 5,

      // color: Colors.grey,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
               setState(() {
                _counter--;
              });
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
          MyText(_counter.toString(), 20, Colors.black),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              setState(() {
                _counter++;
              });
            },
            child: Container(
              //decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(width: 2)),
              child: MyText("+", 30, Colors.black),
            ),
          ),
        ],
      ),
    ),
                      colorsDropDown(),
                    ],
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                
                context.read<ProviderViewModel>().addProduct(BasketProduct(widget.productItem,secilenDeger,secilenRenk,_counter));
                
                
              },
              child: Container(
                  //color: Colors.red,
                  height: MediaQuery.of(context).size.height * 1.5 / 12,
                  width: double.infinity,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText("Add to Cart- ", 20, Colors.black),
                        MyText("\$" + _watchCost.toString(), 22, Colors.brown),
                        
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Container sizeDropDown() {
    return Container(
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: Colors.grey)),

      margin: EdgeInsets.all(10),
      //color: Colors.red,
      child: DropdownButton<ProductModel>(
          underline: Container(
            height: 0,
            color: Colors.transparent,
          ),
          value: secilenDeger,
          items: varyasyonListDropDown,
          onChanged: (newValue) {
            print(newValue!.name);
            setState(() {
              secilenDeger = newValue;
            });
          }),
    );
  }

  Container colorsDropDown() {
    return Container(
      width: 150,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: Colors.grey)),
      //color: Colors.red,
      child: DropdownButton<ColorModel>(
          underline: Container(
            height: 0,
            color: Colors.transparent,
          ),
          value: secilenRenk,
          items: colorListDropDown,
          onChanged: (newValue) {
            print(newValue!.name);
            setState(() {
              secilenRenk = newValue;
            });
          }),
    );
  }

  setVaryasyonItems(List<ProductModel> varyasyonList) {
    for (ProductModel varyasyon in varyasyonList) {
      setState(() {
        varyasyonListDropDown.add(DropdownMenuItem<ProductModel>(
            value: varyasyon,
            child: Container(
              margin: EdgeInsets.all(5),
              child: Text(
                "Size : " + varyasyon.name,
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
            )));
      });
    }
  }

  setRenkItems(List<ColorModel> renkList) {
    for (ColorModel renk in renkList) {
      setState(() {
        colorListDropDown.add(DropdownMenuItem<ColorModel>(
            value: renk,
            child: Container(
                width: 75,
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("color :"),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: renk.color,
                          borderRadius: BorderRadius.circular(50)),
                    )
                  ],
                ))));
      });
    }
  }
}

class DetailPageImage extends StatelessWidget {
  const DetailPageImage({
    Key? key,
    required this.link,
    required this.height,
    required this.width,
    required this.backgroundColor,
  }) : super(key: key);

  final String link;
  final double height;
  final double width;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      //elevation: 100,
      color: backgroundColor,
      child: Container(
        height: height,
        width: width,
        decoration:
            BoxDecoration(image: DecorationImage(image: NetworkImage(link))),
      ),
    );
  }
}
