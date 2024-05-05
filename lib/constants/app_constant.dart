import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);

const kDefaultPaddin = 20.0;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class SharedPref {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void init() {
    _prefs = SharedPreferences.getInstance();
  }

  void setToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('Token', token);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('Token');
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
