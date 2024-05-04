import 'package:flutter/material.dart';
import 'package:smart_save/constants/app_style.dart';

import '../../constants/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Text(
              'Profile',
              style: appNameHead(),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  )
                ],
              ),
            ),
            ProfileMenu(menuName: 'My account',press: (){},icon: Icons.person_2_outlined,),
            ProfileMenu(menuName: 'Notification',press: (){},icon: Icons.notifications_active_outlined,),
            ProfileMenu(menuName: 'Settings',press: (){},icon: Icons.settings_rounded),
            ProfileMenu(menuName: 'Logout',press: (){},icon: Icons.logout),
          ],
        )));
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,required this.menuName,required this.press,required this.icon
  });
final String menuName;
final VoidCallback press;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
          onPressed: press,
          style: ElevatedButton.styleFrom(fixedSize: Size(width,80),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon,  color: Colors.grey,
                size: 30,),
              SizedBox(width: 20,),
              Expanded(
                  child: Text(
                menuName,
                style: appStyle(18, primary, FontWeight.w500),
              )),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
                size: 30,
              )
            ],
          )),
    );
  }
}
