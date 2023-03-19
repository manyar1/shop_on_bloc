import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/feature/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:shop_on_block/feature/presentation/bloc/get_food_bloc/food_bloc.dart';
import 'package:shop_on_block/feature/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:shop_on_block/locator_service.dart' as di;
import 'package:shop_on_block/locator_service.dart';

import 'ui/widget/bottom_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const Shop());
}

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetFoodBlock>(
          create: (context) => sl<GetFoodBlock>(),
        ),
        BlocProvider<SearchFoodBloc>(
          create: (context) => sl<SearchFoodBloc>(),
        ),
        BlocProvider<CartBlock>(
          create: (context) => sl<CartBlock>(),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(fontFamily: 'Lato'),
          home: AnimatedSplashScreen(
              duration: 3000,
              splash: Image.asset('assets/images/ikonka.webp'),
              nextScreen: const HomePage(),
              splashTransition: SplashTransition.fadeTransition,
              backgroundColor: Colors.white)),
    );
  }
}
