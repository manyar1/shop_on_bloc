import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_on_block/core/error/failure.dart';
import 'package:shop_on_block/core/error/usecases/usecase.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/domain/repositories/food_repository.dart';

class GetAllFoodUseCase extends UseCase<List<FoodEntity>, PageFoodParams> {
  final FoodRepository foodRepository;
  GetAllFoodUseCase(this.foodRepository);

  @override
  Future<Either<Failure, List<FoodEntity>>> call(PageFoodParams params) async {
    return  foodRepository.getAllFood();
  }
}

class PageFoodParams extends Equatable {
  const PageFoodParams();
  @override
  List<Object?> get props => [];
}
