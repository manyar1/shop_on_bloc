import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/common/colors/app_colors.dart';
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
        BlocProvider<FoodBloc>(
          create: (context) => sl<FoodBloc>(),
        ),
        BlocProvider<SearchFoodBloc>(
          create: (context) => sl<SearchFoodBloc>(),
        ),
        BlocProvider<CartBlock>(
          create: (context) => sl<CartBlock>(),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(fontFamily: 'Lato', scaffoldBackgroundColor: AppColors.mainBackground, colorScheme: const ColorScheme.dark()),
          home: const BottomNavigation(),),);
  }
}
// AnimatedSplashScreen(
//               duration: 3000,
//               splash: Image.asset('lib/common/assets/images/ikonka.webp'),
//               nextScreen: const BottomNavigation(),
//               splashTransition: SplashTransition.fadeTransition,
//               backgroundColor: Colors.white)),
//     );