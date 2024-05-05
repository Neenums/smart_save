import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:provider/provider.dart';
import 'package:smart_save/constants/app_constant.dart';
import 'package:smart_save/constants/app_style.dart';
import 'package:smart_save/provider/cart_provider.dart';
import 'package:smart_save/screens/cart/helper/promo_code.dart';

import '../../constants/app_colors.dart';
import '../../main.dart';
import '../authentication/helper/button.dart';
import '../products/helper/rating.dart';
import 'helper/cart_card.dart';
import 'helper/plus_minus_button.dart';


class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var result;
  var subTotal = 0.0;
  @override
  void initState() {

    Provider.of<CartProvider>(context, listen: false).fetchCart(context);
    getBox();
    super.initState();
  }

  getBox() async {
    result = await box.values.toList();
    double Subtotal = 0;
    for (int i = 0; i < result.length; i++) {
      var subs = (result[i]["qty"] * result[i]["price"]);
      Subtotal = Subtotal + subs;
    }
    subTotal = Subtotal;
    print(Subtotal);
    print(result);

  }

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: background,

      body: SafeArea(
        child: Consumer<CartProvider>(
        builder: (context, item, child) {
          return
            item.result?.length == 0 || item.result == null
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child:
                Image.asset("assets/images/empty-cart.png", width: 300),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Cart is Empty",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              )
            ],
          ):
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ CircleAvatar(
                      backgroundColor: primary,
                      radius: 22,
                      child: Center(
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,color: Colors.white,)),
                      ),
                    ),
                      Stack(fit:StackFit.loose,
                              clipBehavior: Clip.none,
                      children: [

                        const CircleAvatar(backgroundColor: Colors.white,
                          radius: 22, child: Center(
                          child: Icon(
                              Icons.shopping_bag_outlined,color: Colors.black,),
                        ),),
                        Positioned(right: -10,
                            top: -10,
                            child: CircleAvatar(radius: 12,
                              child: Text(
                                '${item.result.length}', style: const TextStyle(color: Colors.white),),
                              backgroundColor: primary,)),
                      ],
                    )
                    ],),
                ),
                const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('My Cart', style: appNameHead().copyWith(fontSize: 26,fontWeight: FontWeight.w600),),
                ),
                const SizedBox(height: 15,),
                Expanded(
                  child: ListView.builder(
                    itemCount: item.result.length,
                    itemBuilder: (context, index) =>
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Dismissible(
                            key: UniqueKey(),
                            direction: DismissDirection.endToStart,
                            onDismissed: (DismissDirection endToStart) {
                              box.deleteAt(index);
                              cartProvider
                                  .fetchCart(context);
                              double Subtotal = 0;
                              result = box.values.toList();
                              for (int i = 0;
                              i < result.length;
                              i++) {
                                var subs = (result[i]
                                ["qty"] *
                                    result[i]["price"]);
                                Subtotal =
                                    Subtotal + subs;
                              }
                              setState(() {
                                subTotal = Subtotal;
                              });
                            },
                            background: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Row(
                                children: [
                                  Spacer(),
                                  // SvgPicture.asset("assets/icons/Trash.svg"),
                                  Icon(Icons.delete,color: Colors.white,)
                                ],
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 88,
                                      child: AspectRatio(
                                        aspectRatio: 0.88,
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: background,
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Image.asset(
                                              cartProvider.result[index]['image']),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Container(color: Colors.white,
                                        child: Stack(
                                          children: [
                                             Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text((item.result[index]['name']).toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  // cartProvider.result[index]['image'],
                                                  style: subhead.copyWith(fontSize: 16,fontWeight: FontWeight.bold),
                                                  maxLines: 2,
                                                ),
                                                const SizedBox(height: 8),
                                                const Row(mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                     ProductRating(),
                                                  ],
                                                ),
                                                const SizedBox(height: 8),
                                                Text.rich(
                                                  TextSpan(

                                                    text:  "\$${item.result[index]["price"]}.00",
                                                    style: subhead.copyWith(fontWeight: FontWeight.w500,fontSize: 16),

                                                  ),
                                                ),
                                                const SizedBox(height: 30,)

                                              ],
                                            ),
                                            Positioned(
                                                bottom: -1, right: 15, child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        right: 10.0),
                                                    child: SizedBox(
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                          .22,
                                                      child: Container(
                                                        padding: EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: Colors.black12),
                                                            borderRadius: BorderRadius.circular(25,)),
                                                        child: InputQty(
                                                          minVal: 1,
                                                          onQtyChanged: (val) async {
                                                            await box.put(
                                                                result[index]["id"], {
                                                              "image": result[index]
                                                              ["image"],
                                                              "name": result[index]
                                                              ["name"],
                                                              "id": result[index]
                                                              ["id"],
                                                              "price": result[index]
                                                              ["price"],
                                                              "qty": val,
                                                            });
                                                            await cartProvider.fetchCart(context);
                                                        
                                                            double Subtotal = 0;
                                                            for (int i = 0;
                                                            i < cartProvider.result.length;
                                                            i++) {
                                                              var subs = (cartProvider.result[i]
                                                              ["qty"] *
                                                                  cartProvider.result[i]["price"]);
                                                              Subtotal =
                                                                  Subtotal + subs;
                                                            }
                                                            setState(() {
                                                              subTotal = Subtotal;
                                                            });
                                                            print(Subtotal);
                                                          },
                                                          qtyFormProps: const QtyFormProps(
                                                              enableTyping: false),
                                                        
                                                          decoration:
                                                          const QtyDecorationProps(
                                                        
                                                            isBordered: false,
                                                            minusBtn: Icon(
                                                              Icons.remove,
                                                              color:
                                                              Color(0xFF002D80),
                                                            ),
                                                            plusBtn: Icon(Icons.add,
                                                                color: Color(
                                                                    0xFF002D80)),
                                                          ),
                                                          initVal: (cartProvider
                                                              .result[index]["qty"]).toInt(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
                const PromoCode(),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total (${item.result.length} item)',
                      style: appStyle(20, Colors.black, FontWeight.bold),
                    ),
                     Text( "\$ ${subTotal}0",style: title,)
                  ],
                ),
                const SizedBox(height: 25,),
                AppTextButton(
                  onTap: () async {
                    const CircularProgressIndicator();
                    if (subTotal != 0) {
                      if (cartProvider.isConnected ==
                          true) {
                        await cartProvider.placeOrder(
                            result,
                            ((subTotal) * (5 / 100)),
                            subTotal +
                                ((subTotal) * (5 / 100)),context);
                        showDialog<void>(
                          barrierDismissible: false,
                          context: context,
                          builder:
                              (BuildContext context) {
                            return AlertDialog(
                              content: Wrap(
                                  children: [Column(
                                    children: [
                                      const SizedBox(height: 15,),
                                      Center(child: Image.asset("assets/images/success.png",width: 70)),
                                      const SizedBox(height: 15,),
                                      const Center(
                                        child: Text(
                                          "Order Placed Successfully",style: TextStyle(fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),]

                              ),
                              actions: <Widget>[
                                TextButton(
                                  style: TextButton
                                      .styleFrom(
                                    textStyle:
                                    Theme.of(context)
                                        .textTheme
                                        .labelLarge,
                                  ),
                                  child: const Text('OK',style: TextStyle(color: Colors.black),),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop();
                                    cartProvider.fetchCart(context);
                                    box.clear();
                                    Navigator.pushReplacementNamed(navigatorKey.currentState!.context, 'mainscreen');

                                  },
                                ),
                              ],
                            );
                          },
                        );
                        cartProvider.fetchCart(context);
                      }
                      // else {
                      //   await apis.put(
                      //       Random().nextInt(9000), {
                      //     "result": result,
                      //     "total": subTotal +
                      //         ((subTotal) * (5 / 100))
                      //   });
                      //   box.clear();
                      //   var api =
                      //   await apis.values.toList();
                      //   showDialog<void>(
                      //     barrierDismissible: false,
                      //     context: context,
                      //     builder:
                      //         (BuildContext context) {
                      //       return AlertDialog(
                      //         title: const Text('Queue'),
                      //         content: Text(
                      //           "Your Order will Be Placed Once"
                      //               "Network gets Connected",
                      //         ),
                      //         actions: <Widget>[
                      //           TextButton(
                      //             style: TextButton
                      //                 .styleFrom(
                      //               textStyle:
                      //               Theme.of(context)
                      //                   .textTheme
                      //                   .labelLarge,
                      //             ),
                      //             child: const Text('OK'),
                      //             onPressed: () {
                      //               Navigator.of(context)
                      //                   .pop();
                      //               Provider.of<ProductsProvider>(
                      //                   context,
                      //                   listen: false)
                      //                   .toggleHome();
                      //             },
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   );
                      //   print(api);
                      // }
                    } else
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                          content: Text(
                              "Please add products to cart")));
                  },
                  buttonText: 'Proceed to checkout',

                ),
                const SizedBox(height: 25,),
              ],
            ),
          );
        }
        ),
      ),
    );
  }
}
