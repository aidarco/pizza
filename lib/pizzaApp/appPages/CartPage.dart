import 'package:flutter/material.dart';
import 'package:pizza/pizzaApp/models/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<Cart>();
    return Column(
      children: [
        userPizzaCart(vm: vm),
        const SizedBox(
          height: 16,
        ),
        if (vm.getUserCart().isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100]!.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepOrangeAccent.withOpacity(0.3),
                      blurRadius: 8,
                    )
                  ],
                ),
                child: Center(
                    child: Text(
                  "Сумма: ${vm.Price.toString()}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ))),
          ),
      ],
    );
  }
}

class userPizzaCart extends StatelessWidget {
  const userPizzaCart({
    super.key,
    required this.vm,
  });

  final Cart vm;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: vm.userCart.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100]!.withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepOrangeAccent.withOpacity(0.3),
                      blurRadius: 8,
                    )
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      vm.userCart[index].imagePath,
                      width: 150,
                      height: 250,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            vm.userCart[index].name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            softWrap: true,
                          ),
                          SizedBox(height: 10),
                          Text("\$" + vm.userCart[index].price.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              softWrap: true),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
