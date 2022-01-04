import 'package:e_commerce_app/helper/appbar.dart';
import 'package:e_commerce_app/helper/widgets.dart';
import 'package:e_commerce_app/screens/basketPage/model/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class FilterPage extends StatefulWidget {
  const FilterPage({ Key? key }) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
 
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    
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
              Container(
                margin: EdgeInsets.only(top:20,left: 10,right: 10,bottom: 20),
                child: Text("Trending",style: GoogleFonts.poppins(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),)),
              
              //Üst kayan list
              

               
                Container(

                  //Eğer yükseklik vermezsen sayfa tamamen aşağı doğru kayar fakat verirsen
                  //sadece o container içinde kayar
                  height: MediaQuery.of(context).size.height*2/3,
                  width: double.infinity,
                  child: GridView.count(crossAxisCount: 2,
                  shrinkWrap: true,
                  children: List.generate(products.length, (index) => ProductContainer(products[index])),
            
             )
                )
        
            ],),
        ),),
    );
  }

   
}