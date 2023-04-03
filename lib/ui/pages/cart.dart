import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/feature/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:shop_on_block/ui/widget/cart_widgets/cart_item_list.dart';
import 'package:shop_on_block/ui/widget/cart_widgets/cart_price.dart';


class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
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
        builder: (context, state) {
          final food = state.foods;
          
          return food.isEmpty
              ? Center(
                  child: Image.asset('lib/common/assets/images/korzina.png'),
                )
              : Column(
                children: <Widget>[
                  CartPrice(price: state.price),
                  const Divider(),
                  Expanded(
                    child: ListView.separated(
                        itemCount: food.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, index) {
                          return CartItemList(foodsList: food, indexFood: index, price: state.price,);
                        },
                      ),
                  ),
                ],
              );
        },
      ),
    );
  }
}
