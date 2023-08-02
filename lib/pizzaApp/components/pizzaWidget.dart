import 'package:flutter/material.dart';
import 'package:pizza/pizzaApp/models/pizzaModel.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class PizzaWidget extends StatelessWidget {
  Pizza pizza;

  PizzaWidget({Key? key, required this.pizza}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<Cart>();
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 20),
      child: Container(
        width: 330,
        height: 300,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.deepOrangeAccent.withOpacity(0.3),
                blurRadius: 24,
              )
            ],
            borderRadius: BorderRadius.circular(24),
            color: Colors.deepPurple[100]!.withOpacity(0.7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 300, height: 250, child: Image.asset(pizza.imagePath)),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              pizza.description,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pizza.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "\$${pizza.price}",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                    vm.addingCart(pizza);
                    vm.getPrice(pizza);
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(24),
                              topLeft: Radius.circular(24)),
                          color: Colors.deepOrangeAccent),
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
