import 'package:get_it/get_it.dart';
import 'package:shop_on_block/feature/data/repositories/food_repository_impl.dart';
import 'package:shop_on_block/feature/domain/repositories/food_repository.dart';
import 'package:shop_on_block/feature/domain/usecases/get_all_food.dart';
import 'package:shop_on_block/feature/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:shop_on_block/feature/presentation/bloc/get_food_bloc/food_bloc.dart';
import 'package:shop_on_block/feature/presentation/bloc/search_bloc/search_bloc.dart';

import 'feature/domain/usecases/get_food_to_cart.dart';
import 'feature/domain/usecases/search_food.dart';

final sl = GetIt.instance;

Future init() async{
  //Bloc
  sl.registerFactory(() => FoodBloc(sl()));
  sl.registerFactory(() => SearchFoodBloc(sl()));
  sl.registerFactory(() => CartBlock(sl()));
  //UseCases
  sl.registerLazySingleton(() => GetAllFoodUseCase(sl()));
  sl.registerLazySingleton(() => SearchFoodUseCase(sl()));
  sl.registerLazySingleton(() => GetFoodToCartUseCase(sl()));
  //Repository
  sl.registerLazySingleton<FoodRepository>(() => FoodRepositoryImpl());
 
 
}