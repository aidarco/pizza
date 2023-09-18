import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/pizzaApp/appPages/HomePage.dart';
import 'package:pizza/pizzaApp/appPages/auth/authPage.dart';
import 'package:pizza/pizzaApp/appPages/auth/regPage.dart';
import 'package:pizza/pizzaApp/appPages/auth/repos/authBloc/auth_bloc.dart';
import 'package:pizza/pizzaApp/appPages/auth/repos/authRepo.dart';
import 'package:pizza/pizzaApp/appPages/auth/repos/bloc/reg_bloc.dart';
import 'package:pizza/pizzaApp/appPages/auth/repos/registrationRepo.dart';
import 'package:pizza/pizzaApp/appPages/introPage.dart';
import 'package:pizza/pizzaApp/models/cart.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepo(),
        ),
        RepositoryProvider(
          create: (context) => LoginRepo(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                RegBloc(repo: RepositoryProvider.of<AuthRepo>(context)),
          ),
          BlocProvider(
            create: (context) => AuthBloc(repo: RepositoryProvider.of<LoginRepo>(context)),
          ),
        ],
        child: ChangeNotifierProvider(
          create: (context) => Cart(),
          builder: (context, child) =>
              MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    appBarTheme: AppBarTheme(backgroundColor: Colors.cyan)),
                routes: {
                  // "runs": (context) => MarqueeWidgetDemo(),
                  "auth": (context) => Auth(),
                  "/": (context) => IntroPage(),
                  "home": (context) => HomePage(),
                  "reg": (context) => Reg(),

                },
                initialRoute: "auth",

              ),
        ),
      ),
    );
  }
}