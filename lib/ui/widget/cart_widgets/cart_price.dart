import 'package:flutter/material.dart';


class CartPrice extends StatelessWidget {
  final double price;
  const CartPrice(
      {super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
                  'Стоимость: $price' ,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
        MaterialButton(
          onPressed: () {},
          child: const Text(
            'Купить',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
