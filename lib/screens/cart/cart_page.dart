import 'package:flutter/material.dart';
import 'package:smart_save/constants/app_style.dart';
import 'package:smart_save/screens/cart/helper/promo_code.dart';

import '../../constants/app_colors.dart';
import '../authentication/helper/button.dart';
import 'helper/cart_card.dart';
import 'helper/checkout_card.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ CircleAvatar(
                radius: 30,
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
              ),   Stack(

                children: [

                  CircleAvatar(radius: 30,child: Icon(Icons.shopping_bag_outlined),),
                  Positioned(right: -1,
                      top: 0,
                      child: CircleAvatar(radius: 12,child: Text('3',style: TextStyle(color: Colors.white),),backgroundColor: primary,)),
                ],
              )],),
              Text('My Cart',style: appNameHead(),),
              SizedBox(height: 25,),
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Dismissible(
                      key: Key(1.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          // demoCarts.removeAt(index);
                        });
                      },
                      background: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE6E6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            const Spacer(),
                            // SvgPicture.asset("assets/icons/Trash.svg"),
                            Icon(Icons.delete)
                          ],
                        ),
                      ),
                      child: CartCard(),
                    ),
                  ),
                ),
              ),
              PromoCode(),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total (3 item)',
                    style: appStyle(20, Colors.black, FontWeight.bold),
                  ),
                  Text('\$500')
                ],
              ),
              SizedBox(height: 25,),
              AppTextButton(
                onTap: () {},
                buttonText: 'Proceed to checkout',
              ),
              SizedBox(height: 25,),
            ],
          ),
        ),
      ),
    );
  }
}
