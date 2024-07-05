import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_save/constants/app_colors.dart';
import 'package:smart_save/constants/app_strings.dart';
import 'package:smart_save/services/api_services.dart';

import '../constants/app_constant.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}




class _SplashPageState extends State<SplashPage> {
  bool _doLogin = false;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () => checkUserIsLogged());
  }


void checkUserIsLogged() async {
  final prefs = await SharedPreferences.getInstance();
  if ((prefs.getBool('isLoggedIn') != null)) {
    setState(() {
      _doLogin = true;
    });


    ApiServices().login(
        prefs.getString('username')!, prefs.getString('password')!,
        onSuccess: (value) {
          Navigator.pushReplacementNamed(navigatorKey.currentState!.context, "mainscreen");
        },
        onFailure: (value) {
          Navigator.pushReplacementNamed(navigatorKey.currentState!.context, "signin");
        });
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: primary,
        body: SafeArea(
      child: Center(
          child:
          Text(AppStrings.instance.appName,style: TextStyle(color: Colors.white,fontSize: 45,fontWeight: FontWeight.bold),)),
    ));
  }
}
