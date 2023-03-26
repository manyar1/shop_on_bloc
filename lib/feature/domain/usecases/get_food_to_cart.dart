import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_on_block/core/error/failure.dart';
import 'package:shop_on_block/core/error/usecases/usecase.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/domain/repositories/food_repository.dart';

class GetFoodToCartUseCase extends UseCase<List<FoodEntity>, PageCartParams> {
  final FoodRepository foodRepository;
  GetFoodToCartUseCase(this.foodRepository);

  @override
  Future<Either<Failure, List<FoodEntity>>> call(PageCartParams params) async {
    return  foodRepository.getFoodToCart(params.id);
  }
}

class PageCartParams extends Equatable {
  final String id;

  const PageCartParams({required this.id});
  @override
  List<Object?> get props => [id];
}
