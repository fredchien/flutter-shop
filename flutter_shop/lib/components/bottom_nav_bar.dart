/**
 * @author [Frederic Chien]
 * @email [contato@kyuubi.com.br]
 * @create date 06-07-2023 16:39:31
 * @modify date 06-07-2023 16:39:31
 * @desc [description]
 */
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.white,
        color: Colors.grey[400],
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.red,
        gap: 8,
        tabs: const [
          //shop tab
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
          //cart tab
          GButton(
            icon: Icons.shopping_bag,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}
