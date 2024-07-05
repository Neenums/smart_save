import 'package:flutter/material.dart';


import '../../../model/dimensions.dart';
class Specification extends StatelessWidget {
  Dimensions? dimensions;
   Specification({super.key,this.dimensions});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(child: Column(

      children: [
        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [const Text("Width :"),Text(dimensions!.width.toString())],),
        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [const Text("Height :"),Text(dimensions!.height.toString())],),
        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [const Text("Depth :"),Text(dimensions!.depth.toString())],),
      ],
    ));
  }
}
