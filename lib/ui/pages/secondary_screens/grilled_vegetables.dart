import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(),
      ),
    );
  }
}
