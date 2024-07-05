import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);


const kDefaultPaddin = 20.0;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class SharedPref {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void init() {
    _prefs = SharedPreferences.getInstance();
  }

  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("userId", user.userId!);
    prefs.setString("name", user.name!);
    prefs.setString("email", user.email!);
    // prefs.setString("phone", user.phone);
    // prefs.setString("type", user.type);
    prefs.setString("token", user.token!);
    prefs.setString("renewalToken", user.renewalToken!);

    print("object prefere");
    print(user.renewalToken);

    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int? userId = prefs.getInt("userId");
    String? name = prefs.getString("name");
    String? email = prefs.getString("email");
    // String phone = prefs.getString("phone");
    // String type = prefs.getString("type");
    String? token = prefs.getString("token");
    String? renewalToken = prefs.getString("renewalToken");

    return User(
        userId: userId,
        name: name,
        email: email,
        token: token,
        renewalToken: renewalToken);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("phone");
    prefs.remove("type");
    prefs.remove("token");
  }

  void setToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('Token', token);
  }



  Future<String?> getToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('Token');
  }


  void setBool(String data) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('isLoggedIn', true);
  }

  Future<bool?> getBool() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('isLoggedIn');
  }
  void setUserId(int userId) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt('UserId', userId);
  }

  Future<int?> getUserId() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt('UserId');
  }


}
// const token=prefs.setInt('token', "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjIsInVzZXIiOiJtb3JfMjMxNCIsImlhdCI6MTcxNDgxNDUzOX0.znvE7ftFtMBuD_GqgjD69XLug4WAcbVRen946eihWkA");
