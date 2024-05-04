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
  late final TabController tabController =
      TabController(length: 3, vsync: this);
  List menShoeData = [];
  List womenShoeData = [];
  List kidsShoeData = [];
  List dinningTableData = [];
@override
  void initState() {

    super.initState();
    final products=Provider.of<ProductProvider>(context,listen: false);
    products.getProductData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.instance.appName,
              style: appStyleHt(28, Colors.black, FontWeight.bold, 1.2),
            ),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            backgroundColor: Colors.white,
          ),
          drawer: Drawer(
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.32,
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                                    Text('sort',
                                        style: appStyle(20, Colors.black54,
                                            FontWeight.w700)),
                                    Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.black,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),

                          Consumer<ProductProvider>(
                            builder: (context,item,child) {
                              return item.loading?CircularProgressIndicator():
                              TabBar(
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
                                  labelStyle:
                                      appStyle(22, Colors.black, FontWeight.w500),
                                  tabs: const [
                                    Tab(
                                      text: 'Men Shoes',
                                    ),
                                    Tab(
                                      text: 'Women Shoes',
                                    ),
                                    Tab(
                                      text: 'Kids Shoes',
                                    )
                                  ]);
                            }
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15),
                  child: Consumer<ProductProvider>(
                    builder: (context,item,child) {
                      return TabBarView(controller: tabController, children: [
                        Column(
                          children: [
                            Expanded(
                              child: GridView.builder(
                                itemBuilder: (cxt, int index) {
                                 var  products=item.productData[index];
                                  menShoeData = productData
                                      .where(
                                          (element) => element.pCategory == 'Sofa')
                                      .toList();
                                  return ItemCard(product: item.productData[index], press:()=> Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductDetailScreen(
                                                        tagId: menShoeData[index].pId,
                                                        image: menShoeData[index].image,
                                                        title: menShoeData[index].pName,
                                                      ))));

                                },
                                itemCount: item.productData.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2, childAspectRatio: .75,mainAxisSpacing: 20,crossAxisSpacing: 20),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.405,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (cxt, int index) {
                                  womenShoeData = productData
                                      .where((element) =>
                                          element.pCategory == 'Women_Shoe')
                                      .toList();
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailScreen(
                                                    tagId: womenShoeData[index].pId,
                                                    image:
                                                        womenShoeData[index].image,
                                                    title:
                                                        womenShoeData[index].pName,
                                                  )));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black38,
                                                blurRadius: .3,
                                                spreadRadius: 1)
                                          ]),
                                      margin: EdgeInsets.all(8),
                                      height: MediaQuery.of(context).size.height *
                                          0.405,
                                      width:
                                          MediaQuery.of(context).size.width * 0.6,
                                      child: ProductCard(
                                          menShoeData[index].pName,
                                          menShoeData[index].pCategory,
                                          menShoeData[index].pId,
                                          menShoeData[index].image,
                                          menShoeData[index].rate),
                                    ),
                                  );
                                },
                                itemCount: 6,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.409,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (cxt, int index) {
                                  kidsShoeData = productData
                                      .where((element) =>
                                          element.pCategory == 'Kid_Shoe')
                                      .toList();
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailScreen(
                                                    tagId: kidsShoeData[index].pId,
                                                    image:
                                                        kidsShoeData[index].image,
                                                    title:
                                                        kidsShoeData[index].pName,
                                                  )));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black38,
                                                blurRadius: .3,
                                                spreadRadius: 1)
                                          ]),
                                      margin: EdgeInsets.all(8),
                                      height: MediaQuery.of(context).size.height *
                                          0.405,
                                      width:
                                          MediaQuery.of(context).size.width * 0.6,
                                      child: ProductCard(
                                          menShoeData[index].pName,
                                          menShoeData[index].pCategory,
                                          menShoeData[index].pId,
                                          menShoeData[index].image,
                                          menShoeData[index].rate),
                                    ),
                                  );
                                },
                                itemCount: 6,
                              ),
                            ),
                          ],
                        )
                      ]);
                    }
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
