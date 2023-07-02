import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/presentation/bloc/cart_bloc/cart_bloc.dart';

class AddInCartMain extends StatelessWidget {
  final int number;
  final FoodEntity food;
  const AddInCartMain({super.key, required this.number, required this.food});
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
          ? Card(
              color: Colors.red,
              elevation: 5,
              margin: const EdgeInsets.only(right: 20, left: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: MaterialButton(
                child: const Text(
                  'Удалить из корзины',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                onPressed: () => _deleteFromCart(context),
              ),
            )
          : Card(
              color: Colors.green,
              elevation: 5,
              margin: const EdgeInsets.only(right: 20, left: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: MaterialButton(
                child: const Text(
                  'Добавить',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                onPressed: () => _addOnCart(context),
              ),
            );
    });
  }
}
