import 'package:flutter/material.dart';
import 'package:smart_save/constants/app_colors.dart';

import '../../../constants/app_style.dart';

class AppTextButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  bool isPadding;
  bool isMargining;
  bool custom;

    AppTextButton({super.key, required this.onTap,required this.buttonText,this.isPadding=true,this.isMargining=true,this.custom=false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:isPadding?  EdgeInsets.all(25):EdgeInsets.all(12),
        margin:  EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color:primary ,
          borderRadius: BorderRadius.circular(8),
        ),
        child:
            Center(
              child: Text(
                buttonText,
                style:custom?const TextStyle(fontSize: 16,color: Colors.white): buttonStyle,
              ),
            ),


      ),
    );
  }
}
class AppButtonWithIcon extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  final Widget? widget;
  const AppButtonWithIcon({super.key, required this.onTap,required this.buttonText,this.widget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(height: 50,
        // padding: const EdgeInsets.all(25),
        // margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color:primary ,
          borderRadius: BorderRadius.circular(8),
        ),
        child:  Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget!,
            SizedBox(width: 20,),
            Center(
              child: Text(
                buttonText,
                style: buttonStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}