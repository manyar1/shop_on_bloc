import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_on_block/core/error/failure.dart';
import 'package:shop_on_block/core/error/usecases/usecase.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/domain/repositories/food_repository.dart';

class SearchFood extends UseCase<List<FoodEntity>, SearchFoodParams>{
  final FoodRepository foodRepository;
  SearchFood(this.foodRepository);
  
   Future<Either<Failure, List<FoodEntity>>> call(SearchFoodParams params) async {
    return await foodRepository.searchFood(params.title);
   }
  }


   class SearchFoodParams extends Equatable {
    final String title;

  SearchFoodParams({required this.title}); 
    @override
  List<Object?> get props => [title];
  }