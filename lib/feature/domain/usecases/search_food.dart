import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_on_block/core/error/failure.dart';
import 'package:shop_on_block/core/error/usecases/usecase.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/domain/repositories/food_repository.dart';

class SearchFoodUseCase extends UseCase<List<FoodEntity>, SearchFoodParams> {
  final FoodRepository foodRepository;
  SearchFoodUseCase(this.foodRepository);

  @override
  Future<Either<Failure, List<FoodEntity>>> call(
      SearchFoodParams params) async {
    return  foodRepository.searchFood(params.title);
  }
}

class SearchFoodParams extends Equatable {
  final String title;

  const SearchFoodParams({required this.title});
  @override
  List<Object> get props => [title];
}
