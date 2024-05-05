import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:smart_save/constants/app_constant.dart';
import 'package:smart_save/model/product_model.dart';

class ApiServices {
  static const baseUrl = 'https://fakestoreapi.com';
  static const headers = {
    'Content-Type': 'application/json',
    'Connection': 'keep-alive'
  };

  Future<List<ProductModel>> getAllProducts() async {
    return http
        .get(
            Uri.parse(
              '$baseUrl/products',
            ),
            headers: headers)
        .then((data) {
      final products = <ProductModel>[];
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        for (var product in jsonData) {
          products.add(ProductModel.fromJson(product));
        }
      }
      return products;
    }).catchError((err) => print(err));
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
        "username": "mor_2314",
        "password": "83r5^_"
        // 'username': email, 'password': password
      };
      var bodyJson = jsonEncode(data);
      Response response = await post(Uri.parse('$baseUrl/auth/login'),
          headers: headers, body: bodyJson);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(data['token']);
        onSuccess(data['token'] != null);
        SharedPref().setToken(data['token']);
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

  Future<void> registration(String email, String password,
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
        SharedPref().setUserId(data['id']);
        int? userIdValue = await SharedPref().getUserId();
        print(userIdValue);
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
