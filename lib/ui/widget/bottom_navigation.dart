import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_on_block/ui/pages/cart.dart';
import 'package:shop_on_block/ui/pages/contact.dart';
import 'package:shop_on_block/ui/pages/home_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
     return  CupertinoTabScaffold(
      tabBar:  CupertinoTabBar(
        
        backgroundColor: const Color.fromRGBO(44, 42, 42, 1),
        items:  const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.food_bank,
              color: Colors.white,
            ),
            label: ('Главное меню'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            label: ('Корзина'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call,
              color: Colors.white,
            ),
            label: ('Контакты'),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.account_box,
          //     color: Colors.white,
          //   ),
          //   label: ('Профиль'),
          // ),
        ],
       
      ),
      tabBuilder: (context, index) {
        late final CupertinoTabView returnValue;
         switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: HomePage(),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: Cart(),
              );
            });
            break;
             case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: Contact(),
              );
            });
            break;
             case 3:
            // returnValue = CupertinoTabView(builder: (context) {
            //   return const CupertinoPageScaffold(
            //     child: Profile(),
            //   );
            // });
            // break;
        }
        return returnValue;
      }
    );
  }
}