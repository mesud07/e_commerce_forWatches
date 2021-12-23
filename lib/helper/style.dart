import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


TextStyle styleOfBottomWidget = GoogleFonts.poppins(fontSize:20,);

MyText(String text,double size,Color color,){
  return Text(text,style: GoogleFonts.poppins(fontSize: size,color: color));
}