import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:shop_on_block/ui/widget/cart_widgets/cart_item_list.dart';
import 'package:shop_on_block/ui/widget/cart_widgets/cart_price.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  void _getAllFoodCart(BuildContext context) {
    context.read<CartBlock>().add(const GetAllFoodCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    _getAllFoodCart(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Корзина: ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: BlocBuilder<CartBlock, CartState>(
        buildWhen: (previous, current) {
          
          return true;
        },
        builder: (context, state) {
          if (state is CartLoaded) {
            final food = state.foods;
            log(state.foods.length.toString());
            return food.isNotEmpty
                ? Column(
                    children: <Widget>[
                      CartPrice(price: state.price),
                      const Divider(),
                      Expanded(
                        child: ListView.separated(
                          itemCount: _length(food),
                          separatorBuilder: (_, __) => const Divider(),
                          itemBuilder: (context, index) {
                            return CartItemList(
                              foods: food[index],
                              price: state.price,
                              foodsList: food,
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Image.asset('lib/common/assets/images/korzina.png'),
                  );
          }
          return Center(
            child: Image.asset('lib/common/assets/images/korzina.png'),
          );
        },
      ),
    );
  }

  int _length(List<FoodEntity> foods) {
    final setFoods = foods.toSet();
    return setFoods.length;
  }
}
