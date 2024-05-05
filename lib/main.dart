import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:provider/provider.dart';
import 'package:smart_save/constants/app_colors.dart';
import 'package:smart_save/constants/app_constant.dart';
import 'package:smart_save/constants/app_strings.dart';
import 'package:smart_save/provider/cart_provider.dart';
import 'package:smart_save/provider/login_provider.dart';
import 'package:smart_save/provider/mainscreen_provider.dart';
import 'package:smart_save/provider/product_provider.dart';
import 'package:smart_save/provider/sign_up_provider.dart';
import 'package:smart_save/screens/authentication/login_screen.dart';
import 'package:smart_save/screens/products/homepage.dart';
import 'package:smart_save/screens/products/product_screen.dart';
import 'package:smart_save/screens/splash_screen.dart';

late final Box box;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter("Boxes");
  await Hive.openBox('products_box');
  box = Hive.box('products_box');
  SharedPref().init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainScreenNotifier()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        routes: {
          'mainscreen':(context)=>MainScreen(),
          'signin':(context)=>SignIn(),
        },
        title: AppStrings().appName,
        theme: ThemeData(
          fontFamily: 'Raleway',
          primaryColor: secondary,
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple, primary: Colors.white),
          useMaterial3: true,
        ),
        home: SignIn());
  }
}
