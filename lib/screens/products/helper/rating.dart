import 'package:flutter/material.dart';
import 'package:smart_save/constants/app_colors.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.star,
          color: Colors.deepOrange,
        ),
        Icon(
          Icons.star,
          color: Colors.deepOrange,
        ),
        Icon(
          Icons.star,
          color: Colors.deepOrange,
        ),
        Icon(
          Icons.star,
          color: Colors.deepOrange,
        ),
        Icon(
          Icons.star_border_outlined,
          color: Colors.deepOrange,
        )
      ],
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
          style: TextStyle(
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
