import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:shop_on_block/common/mocks/mocks.dart';
import 'package:shop_on_block/core/error/failure.dart';
import 'package:shop_on_block/feature/data/datasuorces/foods_local_data_source.dart';

import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/domain/repositories/food_repository.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodsLocalDataSource localDataSource;

  FoodRepositoryImpl({required this.localDataSource});
  @override
  Future<Either<Failure, List<FoodEntity>>> getAllFood() async {
    try {
      final allFoods = Mocks.listFoodEntity;

      return Right(allFoods);
    } on Exception catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FoodEntity>>> searchFood(String title) async {
    try {
      final allFoods = await searchFood(title);
      log('$allFoods');

      return Right(allFoods as List<FoodEntity>);
    } on Exception catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }

  @override
  Future<void> addFoodToCart(List<FoodEntity> foods) async {
     log('2222222');
    foods;

    await localDataSource.setNewsToCache(foods);
  }

  @override
  Future<void> removeFromCart(List<FoodEntity> foods) async {
    foods;
   
    await localDataSource.setNewsToCache(foods);
  }

  @override
  Future<Either<Failure, List<FoodEntity>>> getAllFoodCart() async {
    try {
      final cachedFoods = await localDataSource.getCachedNews();

      return Right(cachedFoods);
    } on Exception catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }
}
