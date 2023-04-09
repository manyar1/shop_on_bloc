
import 'package:equatable/equatable.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/domain/repositories/food_repository.dart';

class RemoveFoodToCartUseCase  {
  final FoodRepository foodRepository;
  RemoveFoodToCartUseCase(this.foodRepository);
  
  Future<void> call(RemoveCartParams params) async {
    return  foodRepository.removeFromCart(params.foods);
  }
}

class RemoveCartParams extends Equatable {

  final List<FoodEntity> foods;
  const RemoveCartParams({required this.foods});
  @override
  List<Object?> get props => [foods];
}
