import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:smart_save/services/api_services.dart';

import '../model/product_model.dart';

class ProductProvider extends ChangeNotifier{
 List<ProductModel>  productData=[];
 List<ProductModel>  favoriteProducts=[];
 List<String> categories=[];
 List<ProductModel> electronics=[];
 List<ProductModel> jewelary=[];
 List<ProductModel> menCloth=[];
 List<ProductModel> womenCloth=[];
  bool loading =false;
 // Future<void>getCategories() async{
 //   loading =true;
 //
 //   categories=await ApiServices().getAllCategories();
 //   loading =false;
 //   notifyListeners();
 // }

 void saveFavorites() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   List<String> favoriteIds = productData
       .where((product) => product.isFavorite!)
       .map((product) => product.id.toString())
       .toList();
   await prefs.setStringList('favoriteIds', favoriteIds);
 }
 void toggleFavorite(int productId) {
   final productIndex = productData.indexWhere((product) => product.id == productId);
   if (productIndex != -1) {
     productData[productIndex].isFavorite = productData[productIndex].isFavorite;
     notifyListeners();
     saveFavorites();
   }
 }
 void loadFavorites() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   List<String>? favoriteIds = prefs.getStringList('favoriteIds');
   if (favoriteIds != null) {
     favoriteProducts = productData.map((product) {
       if (favoriteIds.contains(product.id.toString())) {
         product.isFavorite = true;
       }
       return product;
     }).toList();
     notifyListeners();
   }
 }
  Future<void>getProductData() async{
    loading =true;

    productData=await ApiServices().getProducts();




   Future.forEach(productData, (element) async{
     if(element.category=="men's clothing"){
        menCloth.add(element);
     }else if(element.category=="jewelery"){
       jewelary.add(element);
     }else if(element.category=="electronics"){
       electronics.add(element);
     }else{womenCloth.add(element);}
   });
    loading =false;
    notifyListeners();
  }

}