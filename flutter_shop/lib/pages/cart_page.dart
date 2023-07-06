/**
 * @author [Frederic Chien]
 * @email [contato@kyuubi.com.br]
 * @create date 06-07-2023 10:48:04
 * @modify date 06-07-2023 10:48:04
 * @desc [description]
 */
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/food_tile.dart';
import 'package:flutter_shop/models/shop.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Food food) {
    Provider.of<Shop>(context, listen: false).removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            children: [
              //heading
              Text('Your Cart'),

              //list of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    //get individual food
                    Food individualFood = value.cart[index];

                    return FoodTile(
                        food: individualFood,
                        onTap: () => removeFromCart(individualFood),
                        trailing: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ));
                  },
                ),
              ),

              //pay button
              Container(
                width: double.infinity,
                child: MaterialButton(
                  child: Text(
                    'PAY',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red[600],
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  onPressed: () => (),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
