import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_save/model/product_model.dart';

class ApiServices {
  static const baseUrl = 'https://fakestoreapi.com';
  static const headers = {'Content-type': 'application/json'};

  Future<List<ProductModel>> getAllProducts() async
  {
    return http
        .get(Uri.parse('$baseUrl/products',), headers: headers)
        .then((data) {
          final products=<ProductModel>[];
          if(data.statusCode==200){
           final  jsonData=json.decode(data.body);
           for(var product in jsonData){
             products.add(ProductModel.fromJson(product));
           }
          }
          return products;

      }).catchError((err)=>print(err));
        }
  Future<List<String>> getAllCategories() async
  {
    return http
        .get(Uri.parse('$baseUrl/products/categories'), headers: headers)
        .then((data) {
      final categories=<String>[];
      if(data.statusCode==200){
        final  jsonData=json.decode(data.body);
        for(var category in jsonData){
          categories.add(category);
        }
      }
      return categories;

    }).catchError((err)=>print(err));
  }


}
