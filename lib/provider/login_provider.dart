import 'package:flutter/material.dart';
import 'package:smart_save/constants/app_constant.dart';
import 'package:smart_save/services/api_services.dart';



class LoginProvider extends ChangeNotifier{
  bool isLoginSuccess=false;

  void login(String email,String password){
    ApiServices().login(email, password,onSuccess: (isSuccess){
      isLoginSuccess=isSuccess;

      notifyListeners();
      if(isSuccess){
        Navigator.pushReplacementNamed(navigatorKey.currentState!.context, "mainscreen");
      }else{
        ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(SnackBar(content: Text("Password Incorrect")));
      }
    },onFailure: (message){
      ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(SnackBar(content: Text("$message")));
      notifyListeners();
    });
  }


}