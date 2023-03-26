import 'package:flutter/material.dart';
import 'package:shop_on_block/ui/widget/secondary_screens_widgets/secondary_screens_list.dart';

final List<int> _mockListIdElementProducts = [
  27,
  28,
  29,
];

class GrilledVegetables extends StatelessWidget {
  const GrilledVegetables({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Овощи на гриле',
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
