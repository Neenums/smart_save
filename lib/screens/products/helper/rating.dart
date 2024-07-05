import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_save/constants/app_colors.dart';

class ProductRating extends StatelessWidget {
  num? rating;
   ProductRating( {super.key,required this.rating
  });

  @override
  Widget build(BuildContext context) {
    return  RatingBarIndicator(
      rating: double.parse((rating).toString()),

      itemBuilder: (context, index) =>
      const Icon(
        Icons.star,
        color: primary,
      ),
      itemCount: 5,
      itemSize: 20.0,
      unratedColor: Colors.grey.withAlpha(50),
      direction: Axis.horizontal,
    );
  }
}

class ForSize extends StatelessWidget {
  ForSize(
      {super.key,
      required this.size,

      this.isSelected = false});

  final String size;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CircleAvatar(
        radius: 25,
        backgroundColor: !isSelected ? Colors.white70 : primary,
        child: Text(
          size,
          style: GoogleFonts.raleway(
              fontWeight: FontWeight.bold,
              color: !isSelected ? Colors.black45 : Colors.white),
        ),
      ),
    );
  }
}
class ForColor extends StatelessWidget {
  ForColor(
      {super.key,
       });



  @override
  Widget build(BuildContext context) {
    return Container(height: 50,
      width: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.black12)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Icon(Icons.circle,color: Colors.blueAccent,size: 30,),Icon(Icons.circle,color: Colors.black,size: 30),Icon(Icons.check_circle_outline_outlined,color: Colors.grey,size: 30)],

    ));
  }
}
