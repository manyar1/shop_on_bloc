import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:shop_on_block/ui/widget/cart_widgets/cart_item.dart';

class CartItemList extends StatelessWidget {
  final List<FoodEntity> foodsList;
  final List<FoodEntity> allFoodsList;
  final FoodEntity food;
  final int number;
  final double price;
  const CartItemList({super.key, required this.food, required this.price, required this.foodsList, required this.allFoodsList, required this.number});
  void _deleteFromCart(BuildContext context) {
    context.read<CartBlock>().add(DeleteFromCartEvent(food: food));
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(food),
        background: Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          padding: const EdgeInsets.only(right: 10),
          child: const Icon(
            Icons.delete,
            color: Colors.red,
            size: 30,
          ),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) => _deleteFromCart(context),
        child: CartItem(
          food: food,
          price: price, foodsList: allFoodsList, number: number,
        ));
  }
}
