import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pizza/pizzaApp/models/cart.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;

  BottomNavBar({Key? key, required this.onTabChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<Cart>();
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GNav(
          curve: Curves.easeOutExpo,
          duration: Duration(milliseconds: 300),
          activeColor: Colors.deepOrangeAccent[100],
          color: Colors.deepOrangeAccent[100],
          haptic: true,
          tabActiveBorder: Border.all(color: Colors.deepOrangeAccent),
/*
          tabBackgroundColor: Colors.grey,
*/
          mainAxisAlignment: MainAxisAlignment.center,
          tabBorderRadius: 24,
          onTabChange: (value) => onTabChange!(value),
          tabs: [
            const GButton(
              icon: Icons.local_pizza,
              text: "Shop",
            ),
            GButton(
                icon: Icons.safety_check,
                text: "Cart",
                leading: Row(
                  children: [
                    Text(
                      vm.userCart.isEmpty
                          ? ""
                          : vm.userCart.length.toString(),
                      style: TextStyle(color: Colors.deepOrangeAccent),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Icon(Icons.shopping_cart,
                        color: Colors.deepOrangeAccent[100])
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
