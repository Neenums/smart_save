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
    products.getCategories();
    tabController = TabController(length:4?? products!.categories!.length??4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: background,
          appBar: AppBar(
            leading: Icon(Icons.border_all_outlined,color: Colors.black,),
            title: Center(
              child: Text(
                AppStrings.instance.appName,
                style:appNameHead()
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ],
            backgroundColor: background,
          ),

          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.32,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 15),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Our Product',
                                    style: appStyle(
                                        24, Colors.black, FontWeight.bold)),
                                Row(
                                  children: [
                                    Text('sort by',
                                        style: appStyle(20, Colors.black54,
                                            FontWeight.w700)),
                                    const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.black,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Consumer<ProductProvider>(
                              builder: (context, item, child) {
                            return item.loading
                                ? const CircularProgressIndicator()
                                : DefaultTabController(
                                  length: 4,
                                  child: TabBar(
                                  
                                      dividerColor: Colors.transparent,
                                      tabAlignment: TabAlignment.start,
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      controller: tabController,
                                      isScrollable: true,
                                      labelColor: Colors.white,
                                      indicatorColor: Colors.transparent,
                                      indicator: BoxDecoration(
                                          color: primary,
                                          borderRadius: BorderRadius.circular(8)),
                                      unselectedLabelColor: Colors.grey.shade500,
                                      labelStyle: appStyle(
                                          22, Colors.black, FontWeight.w500),
                                      tabs: item.categories
                                          .map((e) => Tab(
                                                text: e,
                                              ))
                                          .toList()),
                                );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15),
                  child: Consumer<ProductProvider>(
                      builder: (context, item, child) {
                    return TabBarView(controller: tabController,
                        children: [
                      Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              itemBuilder: (cxt, int index) {
                                return ItemCard(
                                    productImage: 'assets/images/laptop.png',
                                    product: item.electronics[index],
                                    press: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailScreen(
                                                  product:
                                                      item.electronics[index],
                                                  productImage:
                                                      'assets/images/laptop.png',
                                                ))));
                              },
                              itemCount: item.electronics.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.75,
                                     ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              itemBuilder: (cxt, int index) {
                                return ItemCard(
                                    productImage: 'assets/images/jewelary.png',
                                    product: item.jewelary[index],
                                    press: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailScreen(
                                                  product: item.jewelary[index],
                                                  productImage:
                                                      'assets/images/jewelary.png',
                                                ))));
                              },
                              itemCount: item.jewelary.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: .75,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              itemBuilder: (cxt, int index) {
                                return ItemCard(
                                    productImage: 'assets/images/shirt.png',
                                    product: item.menCloth[index],
                                    press: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailScreen(
                                                  product: item.menCloth[index],
                                                  productImage:
                                                      'assets/images/shirt.png',
                                                ))));
                              },
                              itemCount: item.menCloth.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: .75,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              itemBuilder: (cxt, int index) {
                                return ItemCard(
                                    productImage:
                                        'assets/images/women.png',
                                    product: item.womenCloth[index],
                                    press: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailScreen(
                                                  product:
                                                      item.womenCloth[index],
                                                  productImage:
                                                      'assets/images/women-cloth.png',
                                                ))));
                              },
                              itemCount: item.womenCloth.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: .75,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20),
                            ),
                          ),
                        ],


                      )
                    ]);
                  }),
                ),
              ],
            ),
          )),
    );
  }
}
