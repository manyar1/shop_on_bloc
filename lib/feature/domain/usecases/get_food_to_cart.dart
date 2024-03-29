
import 'package:equatable/equatable.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/domain/repositories/food_repository.dart';

class GetFoodToCartUseCase  {
  final FoodRepository foodRepository;
  GetFoodToCartUseCase(this.foodRepository);

  Future<void> call(PageCartParams params) async {
    return  foodRepository.addFoodToCart(params.foods);
  }
}

class PageCartParams extends Equatable {

  final List<FoodEntity> foods;
  
  const PageCartParams({required this.foods});
  @override
  List<Object?> get props => [foods];
}
