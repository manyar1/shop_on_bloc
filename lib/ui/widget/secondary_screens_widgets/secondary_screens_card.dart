import 'package:flutter/material.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/ui/widget/cart_widgets/add_in_cart.dart';
import 'package:shop_on_block/ui/widget/secondary_screens_widgets/price_and_gram.dart';

class SecondaryScreensCard extends StatelessWidget {
  final int indexFood;
  final List<FoodEntity> foodsList;
  const SecondaryScreensCard(
      {super.key, required this.foodsList, required this.indexFood});

  @override
  Widget build(BuildContext context) {
    const i = 1;
    return Column(
      children: <Widget>[
        SizedBox(
          height: 200,
          width: 190,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(foodsList[indexFood].imgUrl),
                    fit: BoxFit.contain),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 130,
          width: 195,
          child: Card(
            elevation: 5,
            margin: const EdgeInsets.only(right: 10, left: 20),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10)),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    foodsList[indexFood].title,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  PriceAndGram(
                    indexFood: indexFood,
                    foodsList: foodsList,
                    i: i,
                  ),
                  const Divider(),
                  AddInCart(
                      number: i, indexFood: indexFood, foodsList: foodsList)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
