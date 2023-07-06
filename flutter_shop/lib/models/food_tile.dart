/**
 * @author [Frederic Chien]
 * @email [contato@kyuubi.com.br]
 * @create date 06-07-2023 15:38:20
 * @modify date 06-07-2023 15:38:20
 * @desc [description]
 */

import 'package:flutter/material.dart';
import 'package:flutter_shop/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  void Function()? onTap;
  final Widget trailing;
  FoodTile({
    super.key,
    required this.food,
    required this.onTap,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            title: Text(
              food.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              "R\$: ${food.price} ",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            leading: Image.asset(food.imagePath),
            trailing: trailing,
          ),
        ),
      ),
    );
  }
}
