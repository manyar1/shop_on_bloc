import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/feature/presentation/bloc/get_food_bloc/food_bloc.dart';
import 'package:shop_on_block/ui/widget/secondary_screens_widgets/secondary_screens_card.dart';

class SecondaryScreensList extends StatelessWidget {
  final List<int> mockListIdElementProducts;

  const SecondaryScreensList(
      {super.key, required this.mockListIdElementProducts});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: BlocBuilder<FoodBloc, GetFoodState>(builder: (context, state) {
        if (state is GetFoodLoaded) {
          final foods = state.foodsList;
          return SingleChildScrollView(
            child: Wrap(
              children: List.generate(
                foods.length,
                (index) {
                  for (int i = 0; i < mockListIdElementProducts.length; i++) {
                    if (foods[index].id == mockListIdElementProducts[i]) {
                      return SecondaryScreensCard(
                        indexFood: index,
                        foodsList: foods,
                      );
                    }
                  }
                  return Container(
                    color: Colors.amber,
                  );
                },
              ),
            ),
          );
        }
        return Container();
      }),
    );
  }
}
