import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_save/constants/app_colors.dart';
import 'package:smart_save/constants/app_strings.dart';
import 'package:smart_save/provider/mainscreen_provider.dart';
import 'package:smart_save/provider/product_provider.dart';
import 'package:smart_save/screens/authentication/login_screen.dart';
import 'package:smart_save/screens/products/product_screen.dart';
import 'package:smart_save/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark, );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainScreenNotifier()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child:  MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title:AppStrings().appName,
      theme: ThemeData(fontFamily: 'Railway',
        primaryColor: secondary,
        scaffoldBackgroundColor: Colors.white,


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,
            primary: Colors.white),
        useMaterial3: true,
      ),
      home:  SignIn()
    );
  }
}


