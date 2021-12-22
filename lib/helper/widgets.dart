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
  
  final String watchTitle;
  final String link;
  final int watchPrice;
  //
  Color anaContainerColor = Colors.black.withOpacity(0.02);


  ProductContainer(this.watchTitle,this.link,this.watchPrice);
  @override
  Widget build(BuildContext context) {
    return Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.only(top:5),
                          decoration: BoxDecoration(color: anaContainerColor,borderRadius: BorderRadius.circular(10)),
                          height: MediaQuery.of(context).size.height/4,
                          width: MediaQuery.of(context).size.width*2/5,
                          child: Column(
                            children: [ 
                              Container(
                                height: MediaQuery.of(context).size.height/6,
                                width: MediaQuery.of(context).size.width*2/5,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(link))),
                              ),
        
                              Container(child: Center(child: Text(watchTitle,style: GoogleFonts.poppins(fontSize: 20),)),),
        
                              Container(child: Center(child: Text(watchPrice.toString()+" \$",style: GoogleFonts.poppins(color: Colors.brown,fontSize: 18),)),),
        
        
        
                            ],
                          ),
                        );
  }
}

