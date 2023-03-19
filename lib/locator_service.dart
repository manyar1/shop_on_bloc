import 'package:get_it/get_it.dart';
import 'package:shop_on_block/feature/domain/usecases/get_all_food.dart';
import 'package:shop_on_block/feature/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:shop_on_block/feature/presentation/bloc/get_food_bloc/food_bloc.dart';
import 'package:shop_on_block/feature/presentation/bloc/search_bloc/search_bloc.dart';

import 'feature/domain/usecases/get_food_to_cart.dart';
import 'feature/domain/usecases/search_food.dart';

final sl = GetIt.instance;

Future init() async{
  //Bloc
  sl.registerFactory(() => GetFoodBlock(getAllFood: sl()));
  sl.registerFactory(() => SearchFoodBloc(searchFood: sl()));
  sl.registerFactory(() => CartBlock(cartFood: sl()));
  //UseCases
  sl.registerLazySingleton(() => GetAllFood(sl()));
  sl.registerLazySingleton(() => SearchFood(sl()));
  sl.registerLazySingleton(() => GetFoodToCart(sl()));
  //Repository
 
}