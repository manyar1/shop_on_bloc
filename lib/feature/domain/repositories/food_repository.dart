import 'package:dartz/dartz.dart';
import 'package:shop_on_block/core/error/failure.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';

abstract class FoodRepository {
  Future<Either<Failure, List<FoodEntity>>> getAllFood();
  Future<void> addFoodToCart(List<FoodEntity> foods);
  Future<void> removeFromCart(List<FoodEntity> foods);
  Future<Either<Failure, List<FoodEntity>>> searchFood(String title);
  Future<Either<Failure, List<FoodEntity>>> getAllFoodCart();
}
