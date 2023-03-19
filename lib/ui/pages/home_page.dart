


import 'package:flutter/material.dart';
import 'package:shop_on_block/ui/widget/food_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Главное меню',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions:  [
          IconButton(onPressed:() {

          }, 
          color: Colors.white,
          icon: const Icon(Icons.search))
        ],
      ),
      body: const FoodList(),
    );
  }
}