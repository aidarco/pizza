


import 'package:flutter/material.dart';
import 'package:pizza/pizzaApp/models/pizzaModel.dart';

class Cart extends ChangeNotifier{
  List<Pizza> pizzaShop =
  [
    Pizza(name: "Двойная пеперони", description: "Пеперони с двойными пеперони", imagePath: "lib/images/двойная пеперони.png", price: 14),
    Pizza(name: "Деревенская пицца", description: "Пицца от бабушки", imagePath: "lib/images/деревенская.png", price: 22),
    Pizza(name: "Комбо", description: "Две пиццы", imagePath: "lib/images/комбо.png", price: 21),
    Pizza(name: "Пеперони", description: "Классическая пеперони", imagePath: "lib/images/пеперони.png", price: 15),
    Pizza(name: "Острая пеперони", description: "Пеперони с с перцем халапенью", imagePath: "lib/images/острая пеперони.png", price: 25),

  ];
  double  Price = 0;
  List<Pizza> userCart = [];

  List<Pizza> getUserCart()
  {
    return userCart;
  }
//добавление
  void addingCart(Pizza pizza)
  {
    userCart.add(pizza);
    notifyListeners();
  }
//Удаление

  void deleteCart(Pizza pizza)
  {
    userCart.remove(pizza);
    notifyListeners();
  }
//ЦЕНА
  double getPrice()
  {
    for(int i = 0; i < userCart.length; i++)
      {
        Price += userCart[i].price;
      }
    return Price;

  }

}