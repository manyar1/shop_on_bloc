import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_on_block/core/error/failure.dart';
import 'package:shop_on_block/core/error/usecases/usecase.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/domain/repositories/food_repository.dart';



class GetAllFood extends UseCase<List<FoodEntity>, PageFoodParams> {
  final FoodRepository foodRepository;
  GetAllFood(this.foodRepository);
  
   @override
     Future<Either<Failure, List<FoodEntity>>> call(PageFoodParams params) async {
    return await foodRepository.getAllFood(params.id);
   }
  }


  class PageFoodParams extends Equatable {
    final int id;

  const PageFoodParams({required this.id}); 
    @override
  List<Object?> get props => [id];
  }