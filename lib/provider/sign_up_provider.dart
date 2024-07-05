import 'package:flutter/material.dart';
import 'package:smart_save/constants/app_constant.dart';
import 'package:smart_save/services/api_services.dart';



class SignUpProvider extends ChangeNotifier{
  bool isSignUpSuccess=false;

  void registration(String name,String email,String password){
    ApiServices().registration(name,email, password,
        onSuccess: (isSuccess){
      isSignUpSuccess=isSuccess;

      notifyListeners();
      if(isSuccess){
        Navigator.pushReplacementNamed(navigatorKey.currentState!.context, "signin");
      }else{
        ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(SnackBar(content: Text("Registration is not completed")));
      }
    },onFailure: (message){
      ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(SnackBar(content: Text("$message")));
      notifyListeners();
    }
    );
  }
}