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
            final foodsList = state.foods;
            log(foodsList.toString());
            final seen = <String>{};
            final List<FoodEntity> foods = foodsList.where((element) => seen.add(element.title)).toList();
            return foodsList.isNotEmpty
                ? Column(
                    children: <Widget>[
                      CartPrice(
                        price: state.price,
                        cartFood: foods,
                      ),
                      const Divider(),
                      Expanded(
                        child: ListView.separated(
                          itemCount: _length(foods),
                          separatorBuilder: (_, __) => const Divider(),
                          itemBuilder: (context, index) {
                            int number = 0;
                            for (final element in foodsList) {
                              if (foods[index].title == element.title) {
                                number++;
                              }
                            }
                            return CartItemList(
                              food: foods[index],
                              price: foods[index].price,
                              foodsList: foods,
                              allFoodsList: foodsList,
                              number: number,
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
