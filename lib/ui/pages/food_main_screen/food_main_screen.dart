
import 'package:flutter/material.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';


class FoodMainScreen extends StatelessWidget {
  final int indexFood;
  final List<FoodEntity> foodsList;
  const FoodMainScreen({super.key, required this.indexFood, required this.foodsList, required });
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text(
            foodsList[indexFood].title,
            style: const TextStyle(fontSize: 20),
          ),
          backgroundColor: const Color.fromARGB(255, 41, 39, 39),
        ),
        backgroundColor: const Color.fromRGBO(41, 39, 39, 1),
        body: Container()
    );
  }
}