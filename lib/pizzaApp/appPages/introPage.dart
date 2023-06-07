import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[100]?.withOpacity(0.5),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //our logo
            Container(
              height: 280,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/images/пиццылого.png"))),
            ),
            const SizedBox(
              height: 34,
            ),
            //title
            const Text(
              "Just eat that",
              style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),

            //describe
            SizedBox(height: 18),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Delicious pizza that you love cooked with love for love for every day",
                style: TextStyle(
                    color: Colors.deepOrangeAccent.withOpacity(0.8),
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 48,
            ),

            //button
            GestureDetector(
              onTap: () => Navigator.of(context).pushReplacementNamed("home"),
              child: Container(
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent.withOpacity(0.9),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Eat now",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
