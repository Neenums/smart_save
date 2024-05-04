import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_save/constants/app_colors.dart';
import 'package:smart_save/constants/app_strings.dart';
import 'package:smart_save/screens/authentication/helper/button.dart';
import 'package:smart_save/screens/authentication/helper/form_field.dart';
import 'package:smart_save/screens/authentication/helper/squre_tile.dart';
import 'package:smart_save/screens/authentication/sign_up_screen.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
  TextStyle linkStyle = TextStyle(color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final formFieldHeight = height * 0.10;
    final spaceH = height * 0.04;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
            child: Column(
          children: [
            SizedBox(height: formFieldHeight,),
            Text(
              AppStrings.instance.appName,
              style: TextStyle(
                  color: primary, fontSize: 45, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: spaceH,),
            Text(
              'Login to your account',
              style: TextStyle(
                  color: heading, fontSize: 14, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 25,),
            AppFormField(controller: emailController, hintText: 'Email', obscureText: false),
            SizedBox(height: 10,),
            AppFormField(controller: passwordController, hintText: 'Password', obscureText: true),
            SizedBox(height: 15,),
          AppTextButton(onTap: (){}, buttonText: 'SignIn'),
            SizedBox(height: formFieldHeight),
            Text('- Or sign in with -'),
            SizedBox(height: spaceH),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                SquareTile(imagePath: AppStrings.instance.google_logo),
                   SizedBox(width: 10,),
                SquareTile(imagePath: AppStrings.instance.facebook_logo),
                SizedBox(width: 10,),
                SquareTile(imagePath:AppStrings.instance.twitter_logo )
              ],
            ),
            SizedBox(height: formFieldHeight,),
          RichText(
            text: TextSpan(
              style: defaultStyle,
              children: <TextSpan>[
                TextSpan(text: 'Dont have any account'),
                TextSpan(
                    text: 'Sign Up',
                    style: linkStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(context, MaterialPageRoute(builder: (cntx)=>SignUp()));
                      }),

              ],
            ),
          )
          ],
        )),
      )),
    );
  }
}
