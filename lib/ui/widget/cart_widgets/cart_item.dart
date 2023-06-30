import 'package:flutter/material.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/ui/pages/food_main_screen/food_main_screen.dart';
import 'package:shop_on_block/ui/widget/cart_widgets/cart_amount.dart';

class CartItem extends StatelessWidget {
  final List<FoodEntity> foodsList;
  final FoodEntity food;
  final double price;
  const CartItem({super.key, required this.food, required this.price, required this.foodsList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 5,
          margin: const EdgeInsets.only(right: 20, left: 20),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Color.fromARGB(255, 41, 39, 39), width: 1),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10)),
          ),
          color: Colors.white,
          child: ListTile(
            leading: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FoodMainScreen(foodsList: food),
                  ),
                );
              },
              child: Container(
                width: 50,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 5,
                    image: AssetImage(
                      food.imgUrl,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              food.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${food.price} р',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
                CartAmount(food: food, price: price, foodsList: foodsList,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
