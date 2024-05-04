import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_save/constants/app_colors.dart';
import 'package:smart_save/constants/app_style.dart';
import 'package:smart_save/screens/authentication/helper/button.dart';
import 'package:smart_save/screens/products/helper/rating.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen(
      {super.key,
      required this.tagId,
      required this.image,
      required this.title});

  final String tagId;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Hero(
            tag: tagId,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(flex: 2,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 10,
                        child: CircleAvatar(
                            radius: 30,
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )),
                      ),
                      Image.asset(image),
                    ],
                  ),
                ),
                Expanded(flex: 4,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: secondary,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(35),
                            topLeft: Radius.circular(35))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: kDefaultFontSize,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Olive Zip-Front \n Jacket',
                                style: appStyle(
                                    22, Colors.grey.shade500, FontWeight.w600),
                              ),
                              Text(
                                '\$18.00',
                                style: appStyle(
                                    18, Colors.grey.shade500, FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: kDefaultFontSize,
                        ),
                       Rating(),
                        SizedBox(
                          height: 15,
                        ),
                        Expanded(
                                child: Text(
                                  'Must-have for those seeking a warm and inviting wooden touch in their homes. Crafted from solid sheesham wood, this dining set exudes a casual  ',
                                  style: appStyle(
                                      16, Colors.black87, FontWeight.w500),
                                ),
                              ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Size'),
                        SizedBox(
                          height: 15,
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              children: [
                                ForSize(
                                  size: 'S',
                                ),
                                ForSize(
                                  size: 'M',
                                  isSelected: true,
                                ),
                                ForSize(
                                  size: 'L',
                                ),
                              ],
                            ),
                            ForColor()
                          ],
                        ),
                        SizedBox(height: 40,),
                     AppTextButton(onTap: (){}, buttonText: 'Add to Cart'),
SizedBox(height: 30,)
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
