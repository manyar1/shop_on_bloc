import 'package:flutter/material.dart';

final List<int> _mockListIdElementProducts = [
  7,
  8,
  9,
  10,
  11,
  12,
  13,
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(),
      ),
    );
  }
}
