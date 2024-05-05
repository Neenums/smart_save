import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

TextStyle appStyle(double size,Color color,FontWeight fw){
  return GoogleFonts.raleway(fontSize:size,color:color,fontWeight:fw);
}

TextStyle appStyleHt(double size,Color color,FontWeight fw,double ht) {
  return GoogleFonts.raleway(
      fontSize: size, color: color, fontWeight: fw, height: ht);
}

  TextStyle appNameHead(){
    return GoogleFonts.raleway(fontSize:35,color:primary,fontWeight:FontWeight.w900,);
  }
TextStyle title=
   GoogleFonts.raleway(fontSize:20,color:Colors.black,fontWeight:FontWeight.bold,);

TextStyle subhead=GoogleFonts.raleway(fontSize:18,color:Colors.black,fontWeight:FontWeight.w500,);

TextStyle iconTitle
  = GoogleFonts.raleway(fontSize:14,color:Colors.grey[600],fontWeight:FontWeight.w500,);


TextStyle defaultStyle =  GoogleFonts.raleway(color: Colors.grey, fontSize: 20.0);

TextStyle linkStyle = GoogleFonts.raleway(color: Colors.blue);
TextStyle buttonStyle = GoogleFonts.raleway(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);