import 'package:flutter/material.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/ui/pages/food_main_screen/food_main_screen.dart';

class SearchResult extends StatelessWidget {
  final FoodEntity foodResult;
  const SearchResult({super.key, required this.foodResult});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FoodMainScreen(foodsList: foodResult),
          ),
        );
      },
      child: SizedBox(
        height: 40,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 2,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  foodResult.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
