import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/feature/presentation/bloc/get_food_bloc/food_bloc.dart';
import 'package:shop_on_block/ui/pages/food_main_screen/food_main_screen.dart';
import 'package:shop_on_block/ui/widget/home_page_widgets/menu.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FoodBloc>().add(const GetFoodEvent());
    return BlocBuilder<FoodBloc, GetFoodState>(
      builder: (context, state) {
        if (state is GetFoodLoaded) {
          final foods = state.foodsList;
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[Container()],
                ),
                SizedBox(
                  height: 170,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: foods.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      if (foods[index].id >= 1 && foods[index].id <= 6) {
                        return SizedBox(
                          width: 150,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => FoodMainScreen(
                                        foodsList: foods,
                                        indexFood: index,
                                      )));
                            },
                            child:
                                Image(image: AssetImage(foods[index].imgUrl2)),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                Row(
                  children: <Widget>[Container()],
                ),
                const Menu(),
              ],
            ),
          );
        }
        return _loadingindicator();
      },
    );
  }
}

Widget _loadingindicator() {
  return const Padding(
    padding: EdgeInsets.all(8),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
