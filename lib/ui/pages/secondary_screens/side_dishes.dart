import 'package:flutter/material.dart';
import 'package:shop_on_block/ui/widget/secondary_screens_widgets/secondary_screens_list.dart';

final List<int> _mockListIdElementProducts = [
  14,
  15,
  16,
  17,
  18,
];

class SideDishes extends StatelessWidget {
  const SideDishes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Гарниры',
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
