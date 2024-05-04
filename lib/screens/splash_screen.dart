import 'package:flutter/material.dart';
import 'package:smart_save/constants/app_colors.dart';
import 'package:smart_save/constants/app_strings.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
