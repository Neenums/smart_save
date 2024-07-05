import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_save/constants/app_constant.dart';
import 'package:smart_save/constants/app_url.dart';
import 'package:smart_save/model/product_model.dart';

import '../model/user_model.dart';

class ApiServices {

  static const baseUrl = 'https://dummyjson.com';
  String url = "https://dummyjson.com/products";
  static const headers = {
     'Content-Type': 'application/json',
    // 'Connection': 'keep-alive'
  };

  Future<List<ProductModel>> getProducts() async {
     String url = "https://dummyjson.com/products";
    // String url = "https://api.escuelajs.co/api/v1/products";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.body);
    try {
      if (response.statusCode == 200) {
        var data = (jsonDecode(response.body)["products"] as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
        return data;
      } else
        throw "Something";
    } catch (e) {
      print(e.toString());
    }
    throw "Something";
  }

  Future<List<ProductModel>> getAllProducts() async {
    return http
        .get(
            Uri.parse(
              '$baseUrl/products',
            ),
            // headers: headers
    )
        .then((data) {
      final products = <ProductModel>[];
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        for (var product in jsonData) {
          products.add(ProductModel.fromJson(product));
        }
      }
      return products;
    }).catchError((err) {
      return err;
    });
  }

  Future<List<String>> getAllCategories() async {
    return http
        .get(Uri.parse('$baseUrl/products/categories'), headers: headers)
        .then((data) {
      final categories = <String>[];
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        for (var category in jsonData) {
          categories.add(category);
        }
      }
      return categories;
    }).catchError((err) => print(err));
  }

  Future<void> login(String email, String password,
      {required void Function(bool) onSuccess,
      required void Function(String) onFailure}) async {
    try {
      Map<String, String> data = {

        "email": email,
        "password": password
      // "email": "john@mail.com",
      //   "password": "changeme"
      };
      var bodyJson = jsonEncode(data);
      Response response = await post(Uri.parse(AppUrl.login),
          headers: headers, body: bodyJson);

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', email);
        await prefs.setString('password', password);

        await prefs.setBool('isLoggedIn', true);
        print(data['access_token']);
        onSuccess(data['access_token'] != null);
        SharedPref().setToken(data['access_token']);
        String? tokenValue = await SharedPref().getToken();
        print(tokenValue);
        print('successfully');
      } else {
        onFailure(response.body.toString());
        print('failed');
      }
    } catch (e) {
      onFailure(e.toString());
      print(e.toString());
    }
  }



  Future<User> registration(String name,String email, String password,
      {required void Function(bool) onSuccess,
      required void Function(String) onFailure}) async {
    try {


      Map<String, String> data = {
        // "name":name,
        // "email": email,
        // "password": password,
        // "avatar": "https://picsum.photos/800",
          "name": name,
          "email": email,
          "password": password,
          "avatar": "https://picsum.photos/800"
      };
      var bodyJson = jsonEncode(data);
      Response response = await post(Uri.parse(AppUrl.register),
          headers: headers, body: bodyJson);

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());
        print(data);


User user=User.fromJson(data);

print(user.toString());
        SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setString('title', data['name']!);
       prefs.setString('email', user.email!);
        print(data['id']);
       onSuccess(data['id']!=null);
       SharedPref().saveUser(user);

        SharedPref().setUserId(data['id']);
        int? userIdValue = await SharedPref().getUserId();
        print(userIdValue);
        print('successfully');
        return user;
      } else {
        onFailure(response.body.toString());
        print('failed');
      }
    } catch (e) {
      onFailure(e.toString());
      print(e.toString());
    }throw "Not found";
  }




  Future<void> getAllCartItems(String email, String password,
      {required void Function(bool) onSuccess,
        required void Function(String) onFailure}) async {
    try {
      Map<String, String> data = {
        'username': email,
        'password': password,
      };
      var bodyJson = jsonEncode(data);
      Response response = await post(Uri.parse('$baseUrl/users'),
          headers: headers, body: bodyJson);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(data['id']);
        onSuccess(data['id']!=null);
        print('successfully');
      } else {
        onFailure(response.body.toString());
        print('failed');
      }
    } catch (e) {
      onFailure(e.toString());
      print(e.toString());
    }
  }
  Future<void> deleteCart(String email, String password,
      {required void Function(bool) onSuccess,
        required void Function(String) onFailure}) async {
    try {
      Map<String, String> data = {
        'username': email,
        'password': password,
      };
      var bodyJson = jsonEncode(data);
      Response response = await post(Uri.parse('$baseUrl/users'),
          headers: headers, body: bodyJson);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(data['id']);
        onSuccess(data['id']!=null);
        print('successfully');
      } else {
        onFailure(response.body.toString());
        print('failed');
      }
    } catch (e) {
      onFailure(e.toString());
      print(e.toString());
    }
  }
  Future<void> addedToCart(String email, String password,
      {required void Function(bool) onSuccess,
        required void Function(String) onFailure}) async {
    try {
      Map<String, String> data = {
        'username': email,
        'password': password,
      };
      var bodyJson = jsonEncode(data);
      Response response = await post(Uri.parse('$baseUrl/carts'),
          headers: headers, body: bodyJson);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(data['id']);
        onSuccess(data['id']!=null);
        print('successfully');
      } else {
        onFailure(response.body.toString());
        print('failed');
      }
    } catch (e) {
      onFailure(e.toString());
      print(e.toString());
    }
  }
  Future<void> updateCart(String email, String password,
      {required void Function(bool) onSuccess,
        required void Function(String) onFailure}) async {
    try {
      Map<String, String> data = {
        'username': email,
        'password': password,
      };
      var bodyJson = jsonEncode(data);
      Response response = await post(Uri.parse('$baseUrl/users'),
          headers: headers, body: bodyJson);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(data['id']);
        onSuccess(data['id']!=null);
        print('successfully');
      } else {
        onFailure(response.body.toString());
        print('failed');
      }
    } catch (e) {
      onFailure(e.toString());
      print(e.toString());
    }
  }
  Future<void> getUser(String email, String password,
      {required void Function(bool) onSuccess,
        required void Function(String) onFailure}) async {
    try {
      Map<String, String> data = {
        'username': email,
        'password': password,
      };
      var bodyJson = jsonEncode(data);
      Response response = await post(Uri.parse('$baseUrl/users'),
          headers: headers, body: bodyJson);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(data['id']);
        onSuccess(data['id']!=null);
        print('successfully');
      } else {
        onFailure(response.body.toString());
        print('failed');
      }
    } catch (e) {
      onFailure(e.toString());
      print(e.toString());
    }
  }

}
