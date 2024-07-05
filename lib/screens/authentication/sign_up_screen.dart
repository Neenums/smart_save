
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_save/constants/app_colors.dart';
import 'package:smart_save/constants/app_strings.dart';
import 'package:smart_save/constants/app_style.dart';
import 'package:smart_save/provider/sign_up_provider.dart';
import 'package:smart_save/screens/authentication/helper/button.dart';
import 'package:smart_save/screens/authentication/helper/form_field.dart';
import 'package:smart_save/screens/authentication/helper/squre_tile.dart';
import 'package:email_validator/email_validator.dart';


class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController ;
  late TextEditingController nameController ;

  late TextEditingController passwordController ;

  late TextEditingController confirmPasswordController ;

  TextStyle defaultStyle = const TextStyle(color: Colors.grey, fontSize: 20.0);

  TextStyle linkStyle = const TextStyle(color: Colors.blue);
  @override
  void initState() {
    nameController=TextEditingController();
    emailController=TextEditingController();
    passwordController=TextEditingController();
    confirmPasswordController=TextEditingController();
    super.initState();
  }
@override
  void dispose() {
  nameController.dispose();
   emailController.dispose();
   passwordController.dispose();
   confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final formFieldHeight = height * 0.04;
    final spaceH = height * 0.04;
    final kPadding=width*0.07;
    return Scaffold(appBar: AppBar(leading: IconButton(icon: const
    Icon(Icons.arrow_back,color: primary,),
    onPressed: () {
      Navigator.pop(context);
    },),),
      body: SafeArea(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Consumer<SignUpProvider>(
        builder: (context, registration, child) {
      return Form(key: _formKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: formFieldHeight,),
                    Align(alignment: Alignment.center,
                      child: Text(
                        AppStrings.instance.appName,
                        style: const TextStyle(
                            color: primary, fontSize: 45, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: spaceH,),
                    Padding(padding: EdgeInsets.only(left:kPadding ),
                      child:  Text(
                        'Create your account',
                        style:subhead
                      ),
                    ),

                    const SizedBox(height: 25,),
                    AppFormField(controller: nameController, hintText: 'Name', obscureText: false,
                        validator: ( value){

                          if(value!.isNotEmpty){
                            return null;
                          }
                         else{
                            return 'Please enter name';
                          }
                        }),
                    const SizedBox(height: 10,),
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
                        }),
                    const SizedBox(height: 10,),
                    AppFormField(controller: passwordController, hintText: 'Password', obscureText: true,
                    validator: (pass){
                      if(pass!.isNotEmpty){
                        return null;
                      }
                      else{
                        return 'Please enter password';
                      }
                    },),
                    const SizedBox(height: 10,),
                    AppFormField(controller: confirmPasswordController, hintText: 'Confirm Password', obscureText: true,
                        validator: (confirmPass){
                       var enteredPass=passwordController.text;
                       var enteredConfirmPass=confirmPasswordController.text;
                       if (confirmPass == null || confirmPass.isEmpty) {
                         return 'Please enter confirm password';
                       }
                          else if(confirmPass!.isNotEmpty){
                            return null;
                          }
                          else if(enteredPass!=enteredConfirmPass){
                            return 'Passwords do not match..';
                          }
                        }),
                    const SizedBox(height: 15,),
                    AppTextButton(onTap: (){
                      if(!_formKey.currentState!.validate()) {
                        print('Invalid signup form');
                      }else{
                        registration.registration(nameController.text,
                            emailController.text, passwordController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Registration successfully completed.\n Please login to continue..')),
                        );


                      }
                    }, buttonText: 'Sign Up'),
                    SizedBox(height: formFieldHeight),
                     Align(alignment: Alignment.center,
                         child: Text('- Or sign in with -',style: subhead,)),
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

                  ],
                ));}
          )),
    ));
  }
}
