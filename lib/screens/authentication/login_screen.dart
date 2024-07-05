import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_save/constants/app_colors.dart';
import 'package:smart_save/constants/app_strings.dart';
import 'package:smart_save/constants/app_style.dart';
import 'package:smart_save/provider/login_provider.dart';
import 'package:smart_save/screens/authentication/helper/button.dart';
import 'package:smart_save/screens/authentication/helper/form_field.dart';
import 'package:smart_save/screens/authentication/helper/squre_tile.dart';
import 'package:smart_save/screens/authentication/sign_up_screen.dart';
import 'package:email_validator/email_validator.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController emailController;

  late TextEditingController passwordController ;


  final _loginFormKey = GlobalKey<FormState>();
  @override
  void initState() {
   emailController=TextEditingController();
   passwordController=TextEditingController();
    super.initState();
  }
@override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final formFieldHeight = height * 0.10;
    final spaceH = height * 0.02;
   final  kPadding=width*0.2;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
        child:
          Consumer<LoginProvider>(
        builder: (context, signInData, child) {
          return  Form(key: _loginFormKey,
              child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               SizedBox(height: formFieldHeight,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: kPadding),
                child: Text(
                  AppStrings.instance.appName,
                  style: const TextStyle(
                      color: primary, fontSize: 45, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: spaceH,),
               Padding(
                 padding: const EdgeInsets.all(25.0),
                 child: Text(
                   textAlign: TextAlign.start,
                  'Login to your account',
                  style:subhead
                  // TextStyle(
                  //     color: heading, fontSize: 14, fontWeight: FontWeight.bold),
                               ),
               ),

              // const SizedBox(height: 25,),
              AppFormField(controller: emailController, hintText: 'Email', obscureText: false,
                  validator: ( value){
                    bool isValid=EmailValidator.validate(emailController.text);
                    if(isValid==true){
                      return null;
                    }
                    else if(value!.isEmpty){
                      return 'Please enter email';
                    }else{
                      return 'Please enter valid email';
                    }
                  }
              ),
              const SizedBox(height: 10,),
              AppFormField(controller: passwordController, hintText: 'Password', obscureText: true,
                  validator: (pass){
                    if(pass!.isNotEmpty){
                      return null;
                    }
                    else{
                      return 'Please enter password';
                    }
                  }),
              const SizedBox(height: 15,),
            AppTextButton(onTap: (){
              if (_loginFormKey.currentState!.validate()) {
                signInData.login(emailController.text,passwordController.text);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logined  successfully..')),
                );
              }else{
                print('Invalid login form');
              }
              // context.read<LoginProvider>().login();
            }, buttonText: 'Sign In'),
              SizedBox(height: formFieldHeight),
              Align(alignment: Alignment.center,
                  child:  Text('- Or sign in with -',style: subhead,)),
              SizedBox(height: spaceH),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  SquareTile(imagePath: AppStrings.instance.google_logo),
                     const SizedBox(width: 10,),
                  SquareTile(imagePath: AppStrings.instance.facebook_logo),
                  const SizedBox(width: 10,),
                  SquareTile(imagePath:AppStrings.instance.twitter_logo )
                ],
              ),
              SizedBox(height: formFieldHeight,),
            Align(alignment:Alignment.center,
              child: RichText(
                text: TextSpan(
                  style: defaultStyle,
                  children: <TextSpan>[
                    const TextSpan(text: 'Dont have any account ? '),
                    TextSpan(
                        text: 'Sign Up',
                        style: linkStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context, MaterialPageRoute(builder: (cntx)=>SignUp()));
                          }),

                  ],
                ),
              ),
            )
            ],
          ));}
        ),
      )),
    );
  }
}
