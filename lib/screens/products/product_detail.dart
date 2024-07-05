import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:smart_save/constants/app_colors.dart';
import 'package:smart_save/constants/app_style.dart';
import 'package:smart_save/main.dart';
import 'package:smart_save/model/product_model.dart';
import 'package:smart_save/provider/cart_provider.dart';
import 'package:smart_save/screens/authentication/helper/button.dart';
import 'package:smart_save/screens/cart/cart_page.dart';
import 'package:smart_save/screens/products/helper/rating.dart';
import 'package:smart_save/screens/products/helper/rating_review_card.dart';
import 'package:smart_save/screens/products/helper/specification_card.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.productImage,
  });

  final ProductModel product;
  final String productImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<CartProvider>(builder: (context, item, child) {
          return Hero(
              tag: Key(product.id.toString()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: [
                         Positioned(
                          right: 10,
                          child: CircleAvatar(
                              backgroundColor: background,
                              radius: 30,
                              child: IconButton(
                                icon:const Icon(Icons.shopping_cart_outlined),
                                color: Colors.black, onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                              },
                              )),
                        ),
                        Center(
                            child: Image.network(
                          product.thumbnail!,
                          height: 150,
                          width: 300,
                        )),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: background,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(50))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Expanded(
                              child: ListView(
                            shrinkWrap: true,
                            children: [
                                const SizedBox(
                                  height: kDefaultFontSize,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(flex:5,
                                      child: Text(

                                        product.title!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: title.copyWith(fontSize: 18)
                                      ),
                                    ),
                                    Expanded(flex: 3,
                                      child: Align(alignment: Alignment.centerRight,
                                        child: Text(
                                          '\$${product.price}.00',
                                          style: appStyle(
                                              18, primary, FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                 Row(mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ProductRating(rating: product.rating,),
                                  ],
                                ),
                                 SizedBox(height: kDefaultFontSize,),
                                Text("Description", style:
                                appStyle(18, Colors.black38, FontWeight.w500),),
                              const SizedBox(
                                height: 8,
                              ),
                                Text(
                                  product.description!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                  style:
                                      appStyle(16, Colors.black87, FontWeight.w500),
                                ),
                              const SizedBox(
                                height: 15,
                              ),

                              Text("Specifications", style:
                              appStyle(18, Colors.black38, FontWeight.w500),),
                              const SizedBox(
                                height: 8,
                              ),
                              Specification(dimensions: product.dimensions),
                              const SizedBox(
                                height: 15,
                              ),

                              Text("Rating & Reviews", style:
                              appStyle(18, Colors.black38, FontWeight.w500),),
                              const SizedBox(
                                height: 15,
                              ),
                              ReviewCard(reviews: product!.reviews,)
                            ],
                          )),
                            AppButtonWithIcon(onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(duration: const Duration(seconds: 1),
                                    backgroundColor:
                                    const Color(0xFF6699CC).withOpacity(.9),
                                    behavior:
                                    SnackBarBehavior
                                        .floating,
                                    width: 200,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            20)),
                                    content:  Center(
                                      child: Column(
                                        children: [
                                          Image.asset("assets/images/success.png",width: 50),
                                          const SizedBox(height: 10,),
                                          const Text(
                                            "Added To Cart",
                                            style: TextStyle(
                                                color: Colors
                                                    .white70,
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                fontSize:
                                                18),
                                          ),
                                        ],
                                      ),
                                    ),

                                  )
                              );
                             var  cartProducts={
                               "image":
                               product.thumbnail,
                               "name":
                              product.title,
                               "id": product
                                   .id,
                               "price":
                              product
                                   .price,
                               "qty": 1
                             };
                              box.put(product.id,cartProducts);
                             Provider.of<CartProvider>(
                                 context,
                                 listen: false)
                                 .fetchCart(context);

                            },
                              buttonText: 'Add to Cart',widget: Stack(fit:StackFit.loose,
                              clipBehavior: Clip.none,
                              children: [

                                const Center(
                                  child: Icon(
                                      Icons.shopping_cart_outlined,color: Colors.white,size: 30,),
                                ),
                                Visibility(
                                  visible: (item.result?.length)!=null&& (item.result?.length)>0,
                                  child: Positioned(right: -10,
                                      top: -12,
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.white,
                                        child: Text((item.result?.length)==null?"":
                                          '${item.result.length}', style: const TextStyle(color: primary),),
                                      )),
                                ),
                              ],
                            ),),
                        ],
                        // children: [


                        //   const SizedBox(
                        //     height: 15,
                        //   ),
                        //    Text('Size',style:subhead ,),
                        //   const SizedBox(
                        //     height: 15,
                        //   ),
                        //   Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Row(
                        //         children: [
                        //           ForSize(
                        //             size: 'S',
                        //           ),
                        //           ForSize(
                        //             size: 'M',
                        //             isSelected: true,
                        //           ),
                        //           ForSize(
                        //             size: 'L',
                        //           ),
                        //         ],
                        //       ),
                        //       ForColor()
                        //     ],
                        //   ),
                        //   const SizedBox(
                        //     height: 40,
                        //   ),
                        //   AppButtonWithIcon(onTap: () {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //         SnackBar(duration: const Duration(seconds: 1),
                        //           backgroundColor:
                        //           const Color(0xFF6699CC).withOpacity(.9),
                        //           behavior:
                        //           SnackBarBehavior
                        //               .floating,
                        //           width: 200,
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius:
                        //               BorderRadius
                        //                   .circular(
                        //                   20)),
                        //           content:  Center(
                        //             child: Column(
                        //               children: [
                        //                 Image.asset("assets/images/success.png",width: 50),
                        //                 const SizedBox(height: 10,),
                        //                 const Text(
                        //                   "Added To Cart",
                        //                   style: TextStyle(
                        //                       color: Colors
                        //                           .white70,
                        //                       fontWeight:
                        //                       FontWeight
                        //                           .bold,
                        //                       fontSize:
                        //                       18),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //
                        //         )
                        //     );
                        //    var  cartProducts={
                        //      "image":
                        //      productImage,
                        //      "name":
                        //     product.title,
                        //      "id": product
                        //          .id,
                        //      "price":
                        //     product
                        //          .price,
                        //      "qty": 1
                        //    };
                        //     box.put(product.id,cartProducts);
                        //    Provider.of<CartProvider>(
                        //        context,
                        //        listen: false)
                        //        .fetchCart(context);
                        //
                        //   },
                        //     buttonText: 'Add to Cart',widget: Stack(fit:StackFit.loose,
                        //     clipBehavior: Clip.none,
                        //     children: [
                        //
                        //       const Center(
                        //         child: Icon(
                        //             Icons.shopping_cart_outlined,color: Colors.white,size: 30,),
                        //       ),
                        //       Visibility(
                        //         visible: (item.result?.length)!=null,
                        //         child: Positioned(right: -10,
                        //             top: -12,
                        //             child: CircleAvatar(
                        //               radius: 12,
                        //               backgroundColor: Colors.white,
                        //               child: Text((item.result?.length)==null?"":
                        //                 '${item.result.length}', style: const TextStyle(color: primary),),
                        //             )),
                        //       ),
                        //     ],
                        //   ),),
                        //   const SizedBox(
                        //     height: 30,
                        //   )
                        // ],
                      ),
                    ),
                  ),
                ],
              ));
        }),
      ),
    );
  }
}
