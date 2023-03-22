import 'package:flutter/material.dart';

final List<int> _mockListIdElementProducts = [
  22,
  23,
  24,
  25,
  26,
];

class Bakery extends StatelessWidget {
  const Bakery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Выпечка',
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
