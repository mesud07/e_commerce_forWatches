
import 'package:e_commerce_app/helper/appbar.dart';
import 'package:e_commerce_app/helper/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String link = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Arcadia_watch_c_1950.png/946px-Arcadia_watch_c_1950.png";
  String watchTitle ="Arcadia";
  int watchPrice = 455;
  List kayanListButtons = ["Rating","Trending","Popular","Select For You"];
 
 
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    //physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context,index){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        
                  ProductContainer(watchTitle,link,watchPrice),
                  ProductContainer(watchTitle,link,watchPrice),

                        
                      ],
                    );
                  }),
                )
        
            ],),
        ),),
    );
  }
}