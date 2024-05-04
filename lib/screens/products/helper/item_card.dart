import 'package:flutter/material.dart';
import 'package:smart_save/constants/app_colors.dart';
import 'package:smart_save/constants/app_constant.dart';

import '../../../model/product_model.dart';



class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product, required this.press});

  final ProductModel product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              width: 200,

              padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(

border: Border(bottom: BorderSide(color: Colors.white)),
                color: secondary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Stack(children: [
                  Image.asset('assets/images/shirt.png'),
                  Positioned(
                      right: -10,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border_outlined),
                      ))
                ]),
              ),
            ),
          ),
          Container(
            width: 200,
            decoration: BoxDecoration(

              color: secondary,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
                  child: Text(

                    product.title!,
                    style: TextStyle(color: kTextLightColor),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "\$${product.price!}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
