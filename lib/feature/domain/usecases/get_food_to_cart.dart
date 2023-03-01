import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_on_block/core/error/failure.dart';
import 'package:shop_on_block/core/error/usecases/usecase.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/domain/repositories/food_repository.dart';



class GetFoodToCart extends UseCase<List<FoodEntity>, PageCartParams> {
  final FoodRepository foodRepository;
  GetFoodToCart(this.foodRepository);
  
   Future<Either<Failure, List<FoodEntity>>> call(PageCartParams params) async {
    return await foodRepository.getAllFood(params.id);
   }
  }


  class PageCartParams extends Equatable {
    final int id;

  PageCartParams({required this.id}); 
    @override
  List<Object?> get props => [id];
  }