
import 'package:flutter/material.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';

class PriceAndGram extends StatelessWidget {
  final int indexFood;
  final List<FoodEntity> foodsList;
  
  const PriceAndGram({super.key, required this.indexFood, required this.foodsList});

  @override
  Widget build(BuildContext context) {
    int i  = 1;
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '${foodsList[indexFood].gram} г',
              style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,),
            ),
            Text(
              '${foodsList[indexFood].price * i} руб',
              style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
            ),
          ],
        );
  }
}