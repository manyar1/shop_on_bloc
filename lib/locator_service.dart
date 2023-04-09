// ignore_for_file: cascade_invocations

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_on_block/feature/data/datasuorces/foods_local_data_source.dart';
import 'package:shop_on_block/feature/data/repositories/food_repository_impl.dart';
import 'package:shop_on_block/feature/domain/repositories/food_repository.dart';
import 'package:shop_on_block/feature/domain/usecases/get_all_food.dart';
import 'package:shop_on_block/feature/domain/usecases/get_all_food_cart.dart';
import 'package:shop_on_block/feature/domain/usecases/get_food_to_cart.dart';
import 'package:shop_on_block/feature/domain/usecases/remove_from_cart.dart';
import 'package:shop_on_block/feature/domain/usecases/search_food.dart';
import 'package:shop_on_block/feature/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:shop_on_block/feature/presentation/bloc/get_food_bloc/food_bloc.dart';
import 'package:shop_on_block/feature/presentation/bloc/search_bloc/search_bloc.dart';

final sl = GetIt.instance;

Future init() async {
  //Bloc
  sl.registerFactory(() => FoodBloc(sl()));
  sl.registerFactory(() => SearchFoodBloc(sl()));
  sl.registerFactory(() => CartBlock(sl(), sl(), sl()));
  //UseCases
  sl.registerLazySingleton(() => GetAllFoodUseCase(sl()));
  sl.registerLazySingleton(() => SearchFoodUseCase(sl()));
  sl.registerLazySingleton(() => GetFoodToCartUseCase(sl()));
  sl.registerLazySingleton(() => RemoveFoodToCartUseCase(sl()));
  sl.registerLazySingleton(() => GetAllFoodCartUseCase(sl()));
  //Repository
  sl.registerLazySingleton<FoodRepository>(() => FoodRepositoryImpl(localDataSource: sl()));
  sl.registerLazySingleton<FoodsLocalDataSource>(
    () => FoodsLocalDataSourceImpl(sharedPreferences: sl()),
  );
 //External
final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

}
