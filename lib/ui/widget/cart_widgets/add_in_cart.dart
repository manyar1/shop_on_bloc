import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/presentation/bloc/cart_bloc/cart_bloc.dart';

class AddInCart extends StatelessWidget {
  final int number;
  final int indexFood;
  final List<FoodEntity> foodsList;
  const AddInCart(
      {super.key,
      required this.number,
      required this.indexFood,
      required this.foodsList});
  void _addOnCart(BuildContext context) {
    context.read<CartBlock>().add(AddOnCartEvent(food: foodsList[indexFood]));
  }
  bool _isThereInTheCart(BuildContext context) {
    return true; 
  }

  @override
  Widget build(BuildContext context) {
    return _isThereInTheCart(context)
    ?  MaterialButton(
      minWidth: 15,
      color: const Color(0xFFCCFF90),
      child: const Text(
        'Добавить',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      onPressed: () => _addOnCart(context),
    )
    :Column(
                children: const <Widget>[
                 
                  Text(
                    'Товар уже в корзине',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  )
                ],
              );
  }
}
