import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_save/provider/mainscreen_provider.dart';
import 'package:smart_save/screens/products/helper/botton_navigator.dart';
import 'package:smart_save/screens/products/product_detail.dart';
import 'package:smart_save/screens/products/product_screen.dart';
import 'package:smart_save/screens/profile/profile_page.dart';

import '../cart/cart_page.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = [ProductScreen(), ProductScreen(),ProfilePage(),CartScreen()];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        builder: (context, mainScreenNotifier, child) {
      return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: pageList[mainScreenNotifier.pageIndex],
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            // margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavigatorWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 0;
                  },
                  size: 42,
                  iconData: mainScreenNotifier.pageIndex == 0
                      ? Icons.home
                      : Icons.home_outlined,
                  color: mainScreenNotifier.pageIndex == 0
                      ? Colors.black
                      : Colors.grey,
                  label: 'Home',
                ),

                BottomNavigatorWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 1;
                  },
                  size: 42,
                  iconData: mainScreenNotifier.pageIndex == 1
                      ? Icons.favorite_border_outlined
                      : Icons.favorite_border_outlined,
                  color: mainScreenNotifier.pageIndex == 1
                      ? Colors.black
                      : Colors.grey,
                  label: 'Wishlist',
                ),
                BottomNavigatorWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 2;
                  },
                  size: 42,
                  iconData: mainScreenNotifier.pageIndex == 2
                      ? Icons.person
                      : Icons.person_outline,
                  color: mainScreenNotifier.pageIndex == 2
                      ? Colors.black
                      : Colors.grey,
                  label: 'Profile',
                ),
                BottomNavigatorWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 3;
                  },
                  size: 42,
                  iconData: mainScreenNotifier.pageIndex == 3
                      ? Icons.shopping_cart
                      : Icons.shopping_cart_outlined,
                  color: mainScreenNotifier.pageIndex == 3
                      ? Colors.black
                      : Colors.grey,
                  label: 'Cart',
                ),

              ],
            ),
          ),
        ),
      );
    });
  }
}
