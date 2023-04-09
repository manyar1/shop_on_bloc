import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_on_block/core/error/failure.dart';
import 'package:shop_on_block/core/error/usecases/usecase.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/domain/repositories/food_repository.dart';

class GetAllFoodCartUseCase extends UseCase<List<FoodEntity>, PageCartFoodParams> {
  final FoodRepository foodRepository;
  GetAllFoodCartUseCase(this.foodRepository);

  @override
  Future<Either<Failure, List<FoodEntity>>> call(PageCartFoodParams params) async {
    return  foodRepository.getAllFoodCart();
  }
}

class PageCartFoodParams extends Equatable {

  const PageCartFoodParams();
  @override
  List<Object?> get props => [];
}
