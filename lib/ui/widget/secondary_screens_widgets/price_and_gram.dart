import 'package:flutter/material.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';

class PriceAndGram extends StatelessWidget {
  final int indexFood;
  final List<FoodEntity> foodsList;
  final int i;

  const PriceAndGram(
      {super.key,
      required this.indexFood,
      required this.foodsList,
      required this.i});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '${foodsList[indexFood].gram} г',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${foodsList[indexFood].price * i} руб',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
