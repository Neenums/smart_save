import 'package:flutter/material.dart';
import 'package:smart_save/constants/app_colors.dart';

class PlusMinusButtons extends StatelessWidget {
  final VoidCallback deleteQuantity;
  final VoidCallback addQuantity;
  final String text;
  const PlusMinusButtons(
      {Key? key,
        required this.addQuantity,
        required this.deleteQuantity,
        required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: secondary,borderRadius: BorderRadius.circular(40)),
      child: Row(
        children: [
          IconButton(onPressed: deleteQuantity, icon: const Icon(Icons.remove)),
          Text(text),
          IconButton(onPressed: addQuantity, icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}