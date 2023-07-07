import 'package:flutter/material.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/ui/pages/food_main_screen/food_main_screen.dart';

class OrederItemContainer extends StatelessWidget {
  final List<FoodEntity> cartData;
  final int index;
  final List<FoodEntity> allCartData;

  const OrederItemContainer({Key? key, required this.cartData, required this.index, required this.allCartData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int number = 0;
    for (final element in allCartData) {
      if (cartData[index].title == element.title) {
        number++;
      }
    }
    return ListTile(
      leading: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FoodMainScreen(foodsList: cartData[index]),
            ),
          );
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(
                cartData[index].imgUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(
        cartData[index].title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'x$number',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
