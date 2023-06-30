

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/presentation/bloc/cart_bloc/cart_bloc.dart';

class AddInCart extends StatelessWidget {
  final int number;
  final FoodEntity food;
  const AddInCart({super.key, required this.number, required this.food});
  void _addOnCart(BuildContext context) {

    context.read<CartBlock>().add(AddOnCartEvent(food: food));
  }

  bool _isThereInTheCart(FoodEntity food, CartState state) {
    if (state is! CartLoaded) {
      return true;
    }
    return state.foods.any((cartFood) => cartFood.id == food.id);
  }

 void _deleteFromCart(BuildContext context) {
    context.read<CartBlock>().add(DeleteFromCartEvent(food: food));
  }
  void _getAllFoodCart(BuildContext context) {
    context.read<CartBlock>().add(const GetAllFoodCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBlock, CartState>(builder: (context, state) {
      _getAllFoodCart(context);
      final isThereInTheCart = _isThereInTheCart(food, state);
      return isThereInTheCart
      ?MaterialButton(
              minWidth: 15,
              color: Colors.red,
              child: const Text(
                'Удалить из корзины',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              onPressed: () => _deleteFromCart(context),
            )
          : MaterialButton(
              minWidth: 15,
              color: Colors.green,
              child: const Text(
                'Добавить',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              onPressed: () => _addOnCart(context),
            );
    
    });
  }
}
