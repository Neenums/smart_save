import 'package:flutter/material.dart';
import 'package:smart_save/constants/app_colors.dart';

class AppTextButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
   const AppTextButton({super.key, required this.onTap,required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color:primary ,
          borderRadius: BorderRadius.circular(8),
        ),
        child:  Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}