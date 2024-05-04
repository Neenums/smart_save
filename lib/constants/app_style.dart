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
    return GoogleFonts.raleway(fontSize:22,color:primary,fontWeight:FontWeight.w900,);
  }
TextStyle title(){
  return GoogleFonts.raleway(fontSize:20,color:Colors.black,fontWeight:FontWeight.w500,);
}
TextStyle subhead(){
  return GoogleFonts.raleway(fontSize:22,color:primary,fontWeight:FontWeight.w900,);
}
TextStyle iconTitle(){
  return GoogleFonts.raleway(fontSize:14,color:Colors.grey[600],fontWeight:FontWeight.w500,);
}