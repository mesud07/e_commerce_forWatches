import 'package:e_commerce_app/screens/basketPage/model/product.dart';
import 'package:e_commerce_app/screens/productDetailPage/view/productDetail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KayanButton extends StatefulWidget {
  final String text;
  final int index;
  KayanButton(this.text,this.index);


  @override
  _KayanButtonState createState() => _KayanButtonState();
}

class _KayanButtonState extends State<KayanButton> {

    Color backColor = Colors.black.withOpacity(0.02);
  @override
  Widget build(BuildContext context) {
    
  
  return Container(
                        
                        //color: Colors.red,
                        constraints: BoxConstraints(
                          minWidth: MediaQuery
                              .of(context)
                              .size
                              .width / 6,
                        ),
                        margin: EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            
                              padding: EdgeInsets.only(left: 10, right: 10),


                              decoration: BoxDecoration(
                                color: backColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1,
                                    color: Colors.grey.withOpacity(0.5)),
                              ),
                              child: Center(child: Text(widget.text,
                                style: GoogleFonts.poppins(fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),))),
                        ),


                      );
  }
}


class ProductContainer extends StatelessWidget {
  
  Product productItem;
  //
  Color anaContainerColor = Colors.black.withOpacity(0.02);


  ProductContainer(this.productItem);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailPage(productItem)));
      },
      child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.only(top:5),
                            decoration: BoxDecoration(color: anaContainerColor,borderRadius: BorderRadius.circular(10)),
                            
                            width: MediaQuery.of(context).size.width*2/6,
                            child: Column(
                              children: [ 
                                Container(
                                  height: MediaQuery.of(context).size.height/8,
                                 
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(productItem.link))),
                                ),
          
                                Container(child: Center(child: Text(productItem.productTitle,style: GoogleFonts.poppins(fontSize: 14),)),),
          
                                Container(child: Center(child: Text(productItem.productCost.toString()+" \$",style: GoogleFonts.poppins(color: Colors.brown,fontSize: 15),)),),
          
          
          
                              ],
                            ),
                          ),
    );
  }
}

