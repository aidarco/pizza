import 'package:flutter/material.dart';
import 'package:pizza/pizzaApp/appPages/HomePahe.dart';
import 'package:pizza/pizzaApp/appPages/introPage.dart';
import 'package:pizza/pizzaApp/models/cart.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context,child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colors.cyan)),
        routes: {
          // "runs": (context) => MarqueeWidgetDemo(),

          "/": (context) => IntroPage(),
          "home": (context) => HomePage(),

        },
        initialRoute: "/",

      ),
    );
  }
}