import 'package:flutter/material.dart';
import 'package:pizza/pizzaApp/models/cart.dart';
import 'package:pizza/pizzaApp/models/pizzaModel.dart';
import 'package:provider/provider.dart';

import '../components/pizzaWidget.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<Cart>();
    return Column(
      children:  [
        const SizedBox(height: 12,),
        const SearchTextField(),
        const SizedBox(height: 14,),
        Text("Tasty and like at home... With love", style:  TextStyle(fontSize: 20, color: Colors.deepOrangeAccent[100]),),
        const SizedBox(height: 28,),
        const TextMostPopularPizzas(),
        const SizedBox(height: 24,),
        pizzaListView(vm: vm),
        SizedBox(height: 25,),
        Divider(
          color: Colors.deepOrangeAccent.shade200,

        )
      ],
    );
  }
}

class pizzaListView extends StatelessWidget {
  const pizzaListView({
    super.key,
    required this.vm,
  });

  final Cart vm;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(

      shrinkWrap: true,
      itemCount: vm.pizzaShop.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return PizzaWidget(pizza: vm.pizzaShop[index],);
      }
    ));
  }
}

class TextMostPopularPizzas extends StatelessWidget {
  const TextMostPopularPizzas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text("Most Popular Pizzas 🔥", style:  TextStyle(fontSize: 20, color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold),),
          Text("See all", style:  TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),),

        ],
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.find_replace, color: Colors.grey,),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.deepOrangeAccent,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1.5, color: Colors.deepOrangeAccent),
                borderRadius: BorderRadius.all(Radius.circular(24)))),
      ),
    );
  }
}
