import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/pizzaApp/appPages/auth/repos/authBloc/auth_bloc.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();
String eror = "";
class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Добро пожаловать",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: ourTextFieldAuth(
              ErorText: "",
              TextHint: "Email",
              controller: emailController,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: ourTextFieldAuth(
              ErorText: eror,
              TextHint: "password",
              controller: passwordController,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSucces) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Вы вошли')));
                  Navigator.pushNamed(context, "/");
                } if (state is AuthEror) {

                  eror = "eror";
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Проверьте данные')));

                  setState(() {

                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Row(
                  children: [
                    SizedBox(
                      height: 36,
                      width: 100,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.deepOrangeAccent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(
                                color: Colors.deepOrange,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Войти',
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(
                              EnterLoginEvent(
                                  email: emailController.text,
                                  password: passwordController.text));
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 36,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "reg");
                        },
                        child: const Text(
                          "Регистрация",
                          style:
                              TextStyle(color: Colors.deepPurple, fontSize: 16),
                        ))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Восстановление",
                  style:
                      TextStyle(color: Colors.deepOrangeAccent, fontSize: 16),
                )),
          )
        ],
      ),
    );
  }
}

class ourTextFieldAuth extends StatelessWidget {
  final String TextHint;
  final String? ErorText;
  final TextEditingController controller;

  const ourTextFieldAuth({
    required this.TextHint,
    required this.controller,
     this.ErorText,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          errorText: ErorText,
          hintText: TextHint,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  color: Colors.deepPurple,
                  width: 2.0,
                  style: BorderStyle.solid)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  color: Colors.deepPurple,
                  width: 2.0,
                  style: BorderStyle.solid)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          isCollapsed: true),
      controller: controller,
    );
  }
}
