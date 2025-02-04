import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_save/constants/app_colors.dart';
import 'package:smart_save/constants/app_constant.dart';
import 'package:smart_save/provider/favorite_provider.dart';
import 'package:smart_save/screens/products/helper/rating.dart';

import '../../../model/product_model.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key,
    required this.product,
    required this.productImage,
    required this.press,
     required this.favoritePress,

  });

  final ProductModel product;
  final String productImage;
  final VoidCallback press;
  final  void Function() favoritePress;



  @override
  Widget build(BuildContext context) {
    final provider=FavoriteProvider.of(context);
    return GestureDetector(
      onTap: press,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)),
        child: Container(
          decoration:BoxDecoration(
              color: Colors.white,borderRadius: BorderRadius.circular(15)),
          child: Stack(
            alignment: Alignment.bottomCenter,


            children: <Widget>[
              Align(alignment: Alignment.topCenter,
                child: Stack(
                    children: [
                      // Image.asset(
                      //   productImage, fit: BoxFit.contain, height: 200,),
                      Image.network(product.thumbnail!),
                      Positioned(
                          right: -10,

                          child: IconButton(
                            onPressed: () {
                             provider.toggleFavorite(product);

                            },
                            icon:provider.isExist(product) ?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border_outlined),
                          ))
                    ]),
              ),
              Container(padding: const EdgeInsets.all(3),

                decoration:  BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color:Colors.grey.shade300)),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
                      child: Text(


                        product.title!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: kTextLightColor),
                      ),
                    ),
                     ProductRating(rating:product!.rating),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "\$${product.price!}.00",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
