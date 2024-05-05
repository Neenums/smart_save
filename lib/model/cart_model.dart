import 'dart:convert';
/// userId : 5
/// date : "2020-02-03"
/// products : [{"productId":5,"quantity":1},{"productId":1,"quantity":5}]

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));
String cartModelToJson(CartModel data) => json.encode(data.toJson());
class CartModel {
  CartModel({
      num? userId, 
      String? date, 
      List<Products>? products,}){
    _userId = userId;
    _date = date;
    _products = products;
}

  CartModel.fromJson(dynamic json) {
    _userId = json['userId'];
    _date = json['date'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  num? _userId;
  String? _date;
  List<Products>? _products;
CartModel copyWith({  num? userId,
  String? date,
  List<Products>? products,
}) => CartModel(  userId: userId ?? _userId,
  date: date ?? _date,
  products: products ?? _products,
);
  num? get userId => _userId;
  String? get date => _date;
  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['date'] = _date;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// productId : 5
/// quantity : 1

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      num? productId, 
      num? quantity,}){
    _productId = productId;
    _quantity = quantity;
}

  Products.fromJson(dynamic json) {
    _productId = json['productId'];
    _quantity = json['quantity'];
  }
  num? _productId;
  num? _quantity;
Products copyWith({  num? productId,
  num? quantity,
}) => Products(  productId: productId ?? _productId,
  quantity: quantity ?? _quantity,
);
  num? get productId => _productId;
  num? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['quantity'] = _quantity;
    return map;
  }

}