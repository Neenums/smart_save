import 'package:flutter/material.dart';
import 'package:smart_save/constants/app_style.dart';
class BottomNavigatorWidget extends StatelessWidget {
  const BottomNavigatorWidget({
    super.key, required this.onTap, required this.size, required this.iconData,required this.color,required this.label
  });

  final void Function() onTap;
  final double size;
  final IconData iconData;
  final Color color;
  final String label;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 55,
          height: size,
          child:Column(children: [

            Expanded(
              child: Icon(
              iconData,
              color:color,
                        ),

            ),
            Expanded(child:Text(label,style: iconTitle(),) ,),],)

        ));
  }
}