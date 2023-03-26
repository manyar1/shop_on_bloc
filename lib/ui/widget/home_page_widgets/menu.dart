import 'package:flutter/material.dart';
import 'package:shop_on_block/ui/pages/secondary_screens/bakery.dart';
import 'package:shop_on_block/ui/pages/secondary_screens/beverages.dart';
import 'package:shop_on_block/ui/pages/secondary_screens/grilled_vegetables.dart';
import 'package:shop_on_block/ui/pages/secondary_screens/shashlik.dart';
import 'package:shop_on_block/ui/pages/secondary_screens/side_dishes.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SideDishes(),
                ),
              );
            },
            child: Image.asset('lib/common/assets/images/Gruppa_garnirov.png'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Shashlik(),
                ),
              );
            },
            child: Image.asset('lib/common/assets/images/gruppa_Shashlyka.png'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Bakery(),
                ),
              );
            },
            child: Image.asset('lib/common/assets/images/gruppa_vypechki.png'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Beverages(),
                ),
              );
            },
            child: Image.asset('lib/common/assets/images/Gruppa_napitkov.png'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const GrilledVegetables(),
                ),
              );
            },
            child: Image.asset('lib/common/assets/images/gruppa_ovoschey.png'),
          ),
        ],
      ),
    );
  }
}
