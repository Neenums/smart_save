import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_save/constants/app_constant.dart';
import 'package:smart_save/constants/app_style.dart';
import 'package:smart_save/model/user_model.dart';
import 'package:smart_save/screens/authentication/helper/button.dart';
import 'package:smart_save/screens/products/homepage.dart';

import '../../constants/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   String name="";
   String email="";
  @override
  void initState() {
   getUserData();

    super.initState();
  }
  Future<void> getUserData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
     name=prefs.getString('title')!;
    email=prefs.getString('email')!;
     print(name);
    print(email);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
            child: Column(
          children: [
            Text(
              'Profile',
              style: appNameHead(),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
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
            SizedBox(height: 10,),
             Text(name??"",style: TextStyle(fontSize: 16,color: primary),),
            SizedBox(height: 10,),
            Text(email??"",style: TextStyle(fontSize: 16,color: primary),),
            SizedBox(height: 10,),
            ProfileMenu(menuName: 'My account',press: (){},icon: Icons.person_2_outlined,),
            ProfileMenu(menuName: 'Notification',press: (){},icon: Icons.notifications_active_outlined,),
            ProfileMenu(menuName: 'Settings',press: (){},icon: Icons.settings_rounded),
            ProfileMenu(menuName: 'Logout',press: (){
              showDialog(context: context, builder: (cntx){return AlertDialog(title: const Text("Are you sure want to logout?",style: TextStyle(fontSize: 16),),
              actions:[ Row(children: [
                AppTextButton(onTap: (){
                Navigator.pop(cntx);
              }, buttonText: "No",isMargining: false,isPadding: false,custom: true,), AppTextButton(onTap: ()async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  var status = prefs.setBool('isLoggedIn',false) ;
                  print(status);
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');

                }, buttonText: "Yes",isMargining: false,isPadding: false,custom: true,),],)]);});
            },icon: Icons.logout),
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
          onPressed: press,
          style: ElevatedButton.styleFrom(fixedSize: Size(width,50),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon,  color: Colors.grey,
                size: 20,),
              const SizedBox(width: 20,),
              Expanded(
                  child: Text(
                menuName,
                style: appStyle(18, primary, FontWeight.w500),
              )),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
                size: 20,
              )
            ],
          )),
    );
  }
}
