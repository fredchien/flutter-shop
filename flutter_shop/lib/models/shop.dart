/**
 * @author [Frederic Chien]
 * @email [contato@kyuubi.com.br]
 * @create date 06-07-2023 10:46:39
 * @modify date 06-07-2023 10:46:39
 * @desc [description]
 */
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/food.dart';

class Shop extends ChangeNotifier {
  //list of food for sale
  final List<Food> _shop = [
    Food(
      name: "Sushi",
      price: "5.50",
      imagePath: "assets/images/food.png",
    ),
    Food(
      name: "Bentô",
      price: "35.50",
      imagePath: "assets/images/food_1.png",
    ),
    Food(
      name: "Niguiri",
      price: "19.90",
      imagePath: "assets/images/food_2.png",
    ),
    Food(
      name: "Salmão",
      price: "21.90",
      imagePath: "assets/images/food_3.png",
    ),
    Food(
      name: "Sushi doce",
      price: "9.90",
      imagePath: "assets/images/food_4.png",
    ),
  ];
  // list of food in user cart
  final List<Food> _userCart = [];

  //get foods for sale
  List<Food> get shop => _shop;

  //get user cart
  List<Food> get cart => _userCart;

  //add food to cart
  void addTocart(Food food) {
    _userCart.add(food);
    notifyListeners();
  }

  //remove food from cart
  void removeFromCart(Food food) {
    _userCart.remove(food);
    notifyListeners();
  }
}
