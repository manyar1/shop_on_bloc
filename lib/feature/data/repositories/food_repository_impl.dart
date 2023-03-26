import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:shop_on_block/common/mocks/mocks.dart';
import 'package:shop_on_block/core/error/failure.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/domain/repositories/food_repository.dart';

class FoodRepositoryImpl implements FoodRepository {
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
  Future<Either<Failure, List<FoodEntity>>> getFoodToCart(String id) async {
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
}
