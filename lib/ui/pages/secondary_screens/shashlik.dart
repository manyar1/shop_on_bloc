import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(),
      ),
    );
  }
}
