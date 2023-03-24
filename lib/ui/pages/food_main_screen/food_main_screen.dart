import 'package:flutter/material.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/ui/widget/secondary_screens_widgets/price_and_gram.dart';

class FoodMainScreen extends StatelessWidget {
  final int indexFood;
  final List<FoodEntity> foodsList;
  const FoodMainScreen(
      {super.key, required this.indexFood, required this.foodsList, required});

  @override
  Widget build(BuildContext context) {
    var i = 1;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            foodsList[indexFood].title,
            style: const TextStyle(fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Hero(
              tag: foodsList[indexFood].imgUrl,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(foodsList[indexFood].imgUrl),
                      fit: BoxFit.contain),
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              margin: const EdgeInsets.only(right: 20, left: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  (10),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      foodsList[indexFood].title,
                      style: const TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    Text(
                      foodsList[indexFood].description,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PriceAndGram(
                      indexFood: indexFood,
                      foodsList: foodsList,
                      i: i,
                    ),
                    
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
