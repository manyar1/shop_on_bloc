import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/presentation/bloc/cart_bloc/cart_bloc.dart';

class CartAmount extends StatefulWidget {
  final List<FoodEntity> foodsList;
  final int indexFood;
  final double price;
  const CartAmount(
      {super.key,
      required this.foodsList,
      required this.indexFood,
      required this.price});

  @override
  // ignore: no_logic_in_create_state
  State<CartAmount> createState() => _CartAmountState(
      foodsList: foodsList, price: price, indexFood: indexFood);
}

class _CartAmountState extends State<CartAmount> {
  final List<FoodEntity> foodsList;
  final int indexFood;
  final double price;

  int number = 1;

  _CartAmountState(
      {required this.foodsList, required this.indexFood, required this.price});



  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(41, 39, 39, 1),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.white, width: 1),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(10)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                number--;
              });
              _deleteOneItemFromCart(context);
              if (number == 0) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Предупреждение'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: const <Widget>[
                          Text('Вы точно хотите удалить?'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Да'),
                        onPressed: () {
                          number = 0;
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Нет'),
                        onPressed: () {
                          setState(() {
                            number++;
                          });
                        },
                      ),
                    ],
                  ),
                );
                if (number == 0) {
                  _deleteFromCart(context);
                }
              }
            },
            icon: const Icon(Icons.remove_circle_outline),
            color: Colors.white,
          ),
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white)),
              child: Center(
                  child: Text(
                'x$number',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ))),
          IconButton(
            onPressed: () {
              setState(() {
                number++;
              });
              _addOnCart(context);
            },
            icon: const Icon(Icons.add_circle_outline),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
    void _deleteFromCart(BuildContext context) {
    context
        .read<CartBlock>()
        .add(DeleteFromCartEvent(food: widget.foodsList[widget.indexFood]));
  }
  void _deleteOneItemFromCart(BuildContext context) {
    context
        .read<CartBlock>()
        .add(DeleteOneItemFromCartEvent(food: widget.foodsList[widget.indexFood]));
  }
   void _addOnCart(BuildContext context) {
    context
        .read<CartBlock>()
        .add(AddOnCartEvent(food: widget.foodsList[widget.indexFood]));
  }

}
