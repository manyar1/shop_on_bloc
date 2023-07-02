import 'package:flutter/material.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/ui/widget/cart_widgets/add_in_cart_main.dart';
import 'package:shop_on_block/ui/widget/secondary_screens_widgets/price_and_gram.dart';

class FoodMainScreen extends StatelessWidget {
  final FoodEntity foodsList;
  const FoodMainScreen({super.key, required this.foodsList});

  @override
  Widget build(BuildContext context) {
    const i = 1;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            foodsList.title,
            style: const TextStyle(fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Hero(
              tag: foodsList.imgUrl,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(foodsList.imgUrl), fit: BoxFit.contain),
                ),
              ),
            ),
            Card(
              elevation: 5,
              margin: const EdgeInsets.only(right: 20, left: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(
                      foodsList.title,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    Text(
                      foodsList.description,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PriceAndGram(
                      foodsList: foodsList,
                      i: i,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AddInCartMain(
                food: foodsList,
                number: i,
              ),
            )
          ],
        ));
  }
}
