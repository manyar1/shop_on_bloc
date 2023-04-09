
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:shop_on_block/ui/widget/cart_widgets/cart_item.dart';

class CartItemList extends StatelessWidget {
   final FoodEntity foodsList;
final double price;
  const CartItemList({super.key, required this.foodsList, required this.price});
   void _deleteFromCart(BuildContext context) {
    context.read<CartBlock>().add(DeleteFromCartEvent(food: foodsList));
  }
  
  @override
  Widget build(BuildContext context) {
    return Dismissible(key: ValueKey(foodsList),  background: Container(
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
              child: CartItem(foodsList: foodsList, price: price,)
              
            );
  }
}
