import 'package:flutter/widgets.dart';
import 'package:smart_save/model/product_model.dart';
import 'package:smart_save/services/api_services.dart';

class ProductProvider extends ChangeNotifier{
 List<ProductModel>  productData=[];
 List<String> categories=[];
 List<ProductModel> electronics=[];
 List<ProductModel> jewelary=[];
 List<ProductModel> menCloth=[];
 List<ProductModel> womenCloth=[];
  bool loading =false;
 Future<void>getCategories() async{
   loading =true;

   categories=await ApiServices().getAllCategories();
   loading =false;
   notifyListeners();
 }
  Future<void>getProductData() async{
    loading =true;

    productData=await ApiServices().getAllProducts();
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