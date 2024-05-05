
import 'package:flutter/material.dart';

import '../main.dart';

class CartProvider extends ChangeNotifier {
  bool isConnected = true;
  int? response;
  var result;

  Future<void> fetchCart(context) async {
    // await Provider.of<Loader_Provider>(context,listen: false).loadingAction(true);
    this.result = await box.values.toList();
    if (this.result != null)
      // await Provider.of<Loader_Provider>(context,listen: false).loadingAction(false);
      notifyListeners();
  }

  Future<void> placeOrder(result, tax, amount, context) async {
    Map<String, dynamic> order = {
      "Products": result,
      "tax": tax,
      "price": amount,
    };
    // await FirebaseFirestore.instance.collection("Orders").doc().set(order);
    box.clear();
    // await Provider.of<Loader_Provider>(context,listen: false).loadingAction(false);
    notifyListeners();
  }
}
