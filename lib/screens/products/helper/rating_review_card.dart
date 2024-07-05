import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:smart_save/constants/app_colors.dart';


import '../../../model/review.dart';

class ReviewCard extends StatelessWidget {
  late List<Review>? reviews;

  ReviewCard({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(fit: FlexFit.loose,
          child: ListView.builder(
            itemCount: reviews!.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
           itemBuilder: (BuildContext context, int index ) {
             return
          
               Card(elevation: 0,
                 margin: const EdgeInsets.all(3),
                 child: Padding(
                   padding: const EdgeInsets.only(left: 8,top: 5),
                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     Row(children: [
                        CircleAvatar(
                         backgroundColor: Colors.grey.shade300,
                         child: const Icon(Icons.person_outline_outlined),),
                       const SizedBox(width: 10,),
                       Text((reviews?[index])!.reviewerName.toString())
                     ],),
                       const SizedBox(height: 5,),
                       ReadMoreText(reviews![index].comment.toString()),
                     const SizedBox(height: 5,),
                     RatingBarIndicator(
                       rating: double.parse((reviews?[index]!.rating).toString()),

                       itemBuilder: (context, index) =>
                       const Icon(
                         Icons.star,
                         color: primary,
                       ),
                       itemCount: 5,
                       itemSize: 20.0,
                       unratedColor: Colors.grey.withAlpha(50),
                       direction: Axis.horizontal,
                     ),

                   const SizedBox(height: 15,)
                   ],),
                 ),
               );
          
           }
          ),
        ),
      ],
    );
  }
}
