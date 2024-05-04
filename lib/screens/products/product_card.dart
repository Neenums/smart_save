

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_save/constants/app_style.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      this.productName, this.category, this.productId, this.image, this.price,
      {super.key});

  final String productName;
  final String productId;
  final String image;
  final String price;
  final String category;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(mainAxisAlignment:MainAxisAlignment.end,children: [Icon(Icons.favorite_border,color: Colors.black,)],),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(widget.image,height:200 ,width: 200,),
        ),
        Container(),
        Flexible(child: Text(widget.productName,style: appStyle(20, Colors.black, FontWeight.bold),)),
        Flexible(child: Text(widget.category,style: appStyle(15, Colors.grey, FontWeight.w500),)),
        Flexible(child: Text("\$"+widget.price,style: appStyle(20, Colors.black, FontWeight.bold),))
      ],
    );
  }
}

class ProductModel {
  late String pName;
  late String pId;
  late String pCategory;
  late String rate;
  late String image;

  ProductModel(this.pId, this.pName, this.pCategory, this.rate, this.image);
}

List<ProductModel> productData = [
  ProductModel(
      '1', 'Sofa', 'Sofa', '236.00', 'assets/images/twitter.png'),
  ProductModel(
      '2', 'Sofa', 'Sofa', '236.00', 'assets/images/twitter.png'),
  ProductModel(
      '3', 'Sofa', 'Sofa', '236.00', 'assets/images/twitter.png'),
  ProductModel(
      '4', 'Sofa', 'Sofa', '236.00', 'assets/images/twitter.png'),
  ProductModel(
      '5', 'Chair', 'Chair', '236.00', 'assets/images/twitter.png'),
  ProductModel(
      '6', 'Chair', 'Chair', '236.00', 'assets/images/twitter.png'),
  ProductModel(
      '7', 'Chair', 'Chair', '236.00', 'assets/images/fur6.PNG'),
  ProductModel(
      '8', 'Chair', 'Chair', '236.00', 'assets/images/fur8.PNG'),
  ProductModel(
      '9', 'Chair', 'Chair', '236.00', 'assets/images/fur2.2.png'),
  ProductModel(
      '10', 'Chair', 'Chair', '236.00', 'assets/images/fur1.3.png'),
  ProductModel(
      '11', 'Table', 'Table', '236.00', 'assets/images/fur10.PNG'),
  ProductModel(
      '12', 'Table', 'Table', '236.00', 'assets/images/fur11.PNG'),
  ProductModel(
      '13', 'Table', 'Table', '236.00', 'assets/images/fur12.PNG'),
  ProductModel(
      '14', 'Table', 'Table', '236.00', 'assets/images/fur13.PNG'),
  ProductModel(
      '15', 'Table', 'Table', '236.00', 'assets/images/fur14.PNG'),
  ProductModel(
      '16', 'Dinning Table', 'Dinning Table', '236.00', 'assets/images/fur16.PNG'),
  ProductModel(
      '17', 'Dinning Table', 'Dinning Table', '236.00', 'assets/images/fur17.PNG'),
  ProductModel(
      '18', 'Dinning Table', 'Dinning Table', '236.00', 'assets/images/fur18.PNG'),
  ProductModel(
      '18', 'Dinning Table', 'Dinning Table', '236.00', 'assets/images/fur19.PNG'),
  ProductModel(
      '18', 'Dinning Table', 'Dinning Table', '236.00', 'assets/images/fur20.PNG'),
  ProductModel(
      '18', 'Dinning Table', 'Dinning Table', '236.00', 'assets/images/fur15.PNG'),

];
