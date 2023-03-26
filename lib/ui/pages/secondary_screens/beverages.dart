import 'package:flutter/material.dart';
import 'package:shop_on_block/ui/widget/secondary_screens_widgets/secondary_screens_list.dart';

final List<int> _mockListIdElementProducts = [
  8,
  9,
  10,
  11,
  12,
  13,
];

class Beverages extends StatelessWidget {
  const Beverages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Напитки',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: SecondaryScreensList(
          mockListIdElementProducts: _mockListIdElementProducts,
        ));
  }
}
