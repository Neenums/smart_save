import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_save/constants/app_colors.dart';
import 'package:smart_save/constants/app_strings.dart';
import 'package:smart_save/constants/app_style.dart';
import 'package:smart_save/provider/product_provider.dart';
import 'package:smart_save/screens/products/helper/item_card.dart';
import 'package:smart_save/screens/products/product_card.dart';
import 'package:smart_save/screens/products/product_detail.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  late TabController tabController;



  @override
  void initState() {
    super.initState();
    final products = Provider.of<ProductProvider>(context, listen: false);
    products.getProductData();
    // products.getCategories();
    // tabController = TabController(length:4?? products!.categories!.length??4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: background,
          appBar: AppBar(

            title: Center(
              child: Text(
                AppStrings.instance.appName,
                style:appNameHead()
              ),
            ),

            backgroundColor: background,
          ),

          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Consumer<ProductProvider>(
                builder: (context, item, child) {
                  return item.loading
                      ? const Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: CircularProgressIndicator(color: Colors.blue,)),
                        ],
                      )
                      :
                  Consumer<ProductProvider>(
                      builder: (context, item, child) {
                        return Column(
                          children: [
                            Expanded(
                              child: GridView.builder(
                                itemBuilder: (cxt, int index) {
                                  return ItemCard(
                                      productImage: 'assets/images/laptop.png',
                                      product: item.productData[index],
                                       favoritePress:()=>{},
                                      press: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailScreen(
                                                    product:
                                                    item.productData[index],
                                                    productImage:
                                                    'assets/images/laptop.png',
                                                  ))));
                                },
                                itemCount: item.productData.length,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.75,
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                }),
            // Stack(
            //   children: [
            //     Container(
            //       height: MediaQuery.of(context).size.height * 0.32,
            //       padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            //       child: Container(
            //         padding: const EdgeInsets.fromLTRB(8, 0, 0, 15),
            //         child: SizedBox(
            //           width: MediaQuery.of(context).size.width,
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Text('Our Product',
            //                         style: appStyle(
            //                             24, Colors.black, FontWeight.bold)),
            //                     Row(
            //                       children: [
            //                         Text('sort by',
            //                             style: appStyle(20, Colors.black54,
            //                                 FontWeight.w700)),
            //                         const Icon(
            //                           Icons.keyboard_arrow_down_outlined,
            //                           color: Colors.black,
            //                         )
            //                       ],
            //                     )
            //                   ],
            //                 ),
            //               ),
            //
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //
            //   ],
            // ),
          )),
    );
  }
}
