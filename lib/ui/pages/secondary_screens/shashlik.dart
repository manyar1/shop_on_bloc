import 'package:flutter/material.dart';
import 'package:shop_on_block/ui/widget/secondary_screens_widgets/secondary_screens_list.dart';

final List<int> _mockListIdElementProducts = [
  19,
  20,
  21,
];

class Shashlik extends StatelessWidget {
  const Shashlik({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Шашлык',
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
