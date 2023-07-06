/**
 * @author [Frederic Chien]
 * @email [contato@kyuubi.com.br]
 * @create date 06-07-2023 10:48:00
 * @modify date 06-07-2023 10:48:00
 * @desc [description]
 */
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/food.dart';
import 'package:flutter_shop/models/food_tile.dart';
import 'package:flutter_shop/models/shop.dart';
import 'package:flutter_shop/pages/order_page.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //user selected a food, go to order page
  void goToOrderPage(Food food) {
    //navigate to order page
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderPage(food: food),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // heading
              const Text(
                'Asian Food Shop',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),

              // list of foods for sale
              Expanded(
                child: ListView.builder(
                  itemCount: value.shop.length,
                  itemBuilder: (context, index) {
                    //get individua food
                    Food individualFood = value.shop[index];

                    // return that food on tile
                    return FoodTile(
                      food: individualFood,
                      onTap: () => goToOrderPage(individualFood),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
