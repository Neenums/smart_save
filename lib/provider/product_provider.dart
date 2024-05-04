import 'package:flutter/widgets.dart';
import 'package:smart_save/model/product_model.dart';
import 'package:smart_save/services/api_services.dart';

class ProductProvider extends ChangeNotifier{
 List<ProductModel>  productData=[];
  bool loading =false;
  Future<void>getProductData() async{
    loading =true;

    productData=await ApiServices().getAllProducts();
    loading =false;
    notifyListeners();
  }
}