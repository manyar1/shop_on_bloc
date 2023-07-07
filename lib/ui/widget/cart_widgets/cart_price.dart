import 'package:flutter/material.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/ui/pages/order_page.dart';

class CartPrice extends StatelessWidget {
  final double price;

  final List<FoodEntity> cartFood;
  final List<FoodEntity> allCartFood;
  const CartPrice({super.key, required this.price, required this.cartFood, required this.allCartFood, });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          'Стоимость: $price',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        MaterialButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OrderPage(cartData: cartFood, price: price, allCartData: allCartFood,),
              ),
            );
          },
          child: const Text(
            'Купить',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
