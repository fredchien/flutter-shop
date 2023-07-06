/**
 * @author [Frederic Chien]
 * @email [contato@kyuubi.com.br]
 * @create date 06-07-2023 15:29:23
 * @modify date 06-07-2023 15:29:23
 * @desc [description]
 */

import 'package:flutter/material.dart';
import 'package:flutter_shop/models/food.dart';
import 'package:flutter_shop/models/shop.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final Food food;
  const OrderPage({super.key, required this.food});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  //customize slider
  double sizeValue = 0.5;
  double pepperValue = 0.5;

  void customizeSizeSlider(double newValue) {
    setState(() {
      sizeValue = newValue;
    });
  }

  void customizePepperSlider(double newValue) {
    setState(() {
      pepperValue = newValue;
    });
  }

  //add to cart
  void addToCart() {
    //add to cart
    Provider.of<Shop>(context, listen: false).addTocart(widget.food);

    //direct user back to shop page
    Navigator.pop(context);

    //show dialog for sucsess
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Successfully added to cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.food.name)),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //food image
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Image.asset(
              widget.food.imagePath,
              width: 300,
            ),
          ),

          //sliders to customize
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text(
                        'Size',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: sizeValue,
                        label: sizeValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeSizeSlider(value),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text(
                        'Pepper',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: pepperValue,
                        label: pepperValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizePepperSlider(value),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          //add to cart button
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(25.0),
            child: MaterialButton(
              child: Text(
                'Add to cart',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red[600],
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0)),
              onPressed: () => addToCart(),
            ),
          )
        ],
      ),
    );
  }
}
