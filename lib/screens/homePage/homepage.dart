
import 'package:e_commerce_app/controller.dart';
import 'package:e_commerce_app/helper/appbar.dart';
import 'package:e_commerce_app/helper/widgets.dart';
import 'package:e_commerce_app/screens/basketPage/model/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List kayanListButtons = ["Rating","Trending","Popular","Select For You"];
  late List allProducts;
  late List _foundProduct;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allProducts=products;
    _runFilter("");
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context,"homePage"),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
               context.watch<ProviderViewModel>().searchOnGet==true? Container(
                 margin: EdgeInsets.only(right:50,left: 50,top: 50,bottom: 30),
                 child: TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                    labelText: 'İstediğin saati ara', suffixIcon: Icon(Icons.search)),
            ),
               ):Container(),
              Container(
                margin: EdgeInsets.only(top:20,left: 10,right: 10,bottom: 20),
                child: Text("Discover our exclusice watches",style: GoogleFonts.poppins(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),)),
              
              //Üst kayan list
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                itemCount: kayanListButtons.length,
                itemBuilder: (context,index)=>KayanButton(kayanListButtons[index],index)),),

                
                Container(

                  //Eğer yükseklik vermezsen sayfa tamamen aşağı doğru kayar fakat verirsen
                  //sadece o container içinde kayar
                  height: MediaQuery.of(context).size.height*2/3,
                  width: double.infinity,
                  child: GridView.count(crossAxisCount: 2,
                  shrinkWrap: true,
                  children: List.generate(_foundProduct.length, (index) => ProductContainer(_foundProduct[index])),
            
             )
                )
        
            ],),
        ),),
    );
  }




  void _runFilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = allProducts;
    } else {
      results = allProducts
          .where((place) =>
          place.productTitle.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundProduct = results;
    });
  }
}