import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/feature/presentation/bloc/get_food_bloc/food_bloc.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FoodBloc>().add(const GetFoodEvent());
    return BlocBuilder<FoodBloc, GetFoodState>(
      builder: (context, state) {
        if (state is GetFoodLoaded) {
          final foods = state.foodsList;
          return ListView.separated(
            itemCount: foods.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              return Text("${foods[index]}");
            },
          );
        }
        return _loadingindicator();
      },
    );
  }
}

Widget _loadingindicator() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
