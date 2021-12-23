

import 'package:e_commerce_app/helper/appbar.dart';
import 'package:e_commerce_app/helper/style.dart';
import 'package:e_commerce_app/screens/productDetailPage/model/colorModel.dart';
import 'package:e_commerce_app/screens/productDetailPage/model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailPage extends StatefulWidget {



  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
    String watchTitle ="Classic Roselyn Mawes";
    String watchDesc="With classic feature wuch the slim vause, details in rase gold or silver , and our heritage strap ruby red classic";
    int cost=199;
      static const Map<String,int> varyasyonlar={
    
      "42mm":42,
      "43mm": 43,
      "44mm": 44,
      "45": 45,
      "46mm" : 46,
      };

      static const Map<String,Color> colorsMap={
    
      "Kırmızı":Colors.red,
      "Beyaz": Colors.white,
      "Yeşil": Colors.green,
      };

    ProductModel secilenDeger=ProductModel("42mm",42);
    ColorModel secilenRenk = ColorModel("Kırmızı",Colors.red);
    String link = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Arcadia_watch_c_1950.png/946px-Arcadia_watch_c_1950.png";


    List<DropdownMenuItem<ProductModel>> varyasyonListDropDown = [];
    List<DropdownMenuItem<ColorModel>> colorListDropDown = [];


    
   void initState() {
    super.initState();
  List<ProductModel> varyasyonList =
  varyasyonlar.entries.map( (entry) =>ProductModel(entry.key,entry.value)).toList();

  List<ColorModel> colorList =colorsMap.entries.map((e) => ColorModel(e.key, e.value)).toList();

  setVaryasyonItems(varyasyonList);
  setRenkItems(colorList);

  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: Container(
        color: Colors.pinkAccent.withOpacity(0.05),
        child: Column(
          children: [
            Material(
             //elevation: 100,
              color: Colors.transparent,
              child: Container(
                height: MediaQuery.of(context).size.height*5/12,
                width: double.infinity,
                
                decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(link))),
            
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*4/12,
              width: double.infinity,
             
              decoration: BoxDecoration(
                 color: Colors.white,
                borderRadius: BorderRadius.circular(40),

              ),

              child: Column(
                children: [Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(watchTitle,style:GoogleFonts.poppins(fontSize:25,fontWeight: FontWeight.bold))), 
                  Container(
                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1),borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(10),
                    
                    child: Icon(Icons.favorite_outline,color: Colors.pinkAccent,),),
                ],),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(watchDesc,
                            style:GoogleFonts.poppins(fontSize:17,color: Colors.black)),
                          ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   sizeDropDown(),
                   colorsDropDown(),
                  ],)],
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                //color: Colors.red,
                height: MediaQuery.of(context).size.height*1.5/12,
                width: double.infinity,
                child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText("Add to Cart- ",20,Colors.black),
                    MyText("\$"+cost.toString(), 22, Colors.brown)
                  ],
                ),)),
            ),
          ],
        ),
      ),
      
    );
  }

  Container sizeDropDown() {
    return Container(
                  width: 110,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(width: 1,color: Colors.grey)),

                  margin: EdgeInsets.all(10),
                  //color: Colors.red,
                  child: DropdownButton<ProductModel>(
                    underline: Container(
                       height: 0,
                       color: Colors.transparent,
                    ),
                    value: secilenDeger,
                    items: varyasyonListDropDown,
                     onChanged: (newValue){
                       print(newValue!.name);
                       setState(() {
                      secilenDeger=newValue;
                         
                       });
                    }),
                );
  }

  Container colorsDropDown() {
    return Container(
                   width: 150,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(width: 1,color: Colors.grey)),
                  //color: Colors.red,
                  child: DropdownButton<ColorModel>(
                    underline: Container(
                       height: 0,
                       color: Colors.transparent,
                    ),
                    value: secilenRenk,
                    items: colorListDropDown,
                     onChanged: (newValue){
                       print(newValue!.name);
                       setState(() {
                      secilenRenk=newValue;
                         
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
                      "Size : "+varyasyon.name,
                      style: TextStyle(fontSize: 13,color: Colors.black),
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
                        decoration: BoxDecoration(color: renk.color,
                        borderRadius: BorderRadius.circular(50)),
                        )
                    ],)
                  )));
            });
          }

  }


}

