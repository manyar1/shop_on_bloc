part of 'food_bloc.dart';

abstract class GetFoodState extends Equatable{

  @override
  
  List<Object?> get props => [];
}
class GetFoodEmpty extends GetFoodState{
 
  @override
  List<Object?> get props => [];

}

class GetFoodLoading extends GetFoodState{
final List<FoodEntity> oldFoodList;

  GetFoodLoading(this.oldFoodList);

  @override
  List<Object?> get props => [];
}

class GetFoodLoaded extends GetFoodState{
final List<FoodEntity> foodsList;

  GetFoodLoaded(this.foodsList);
  @override
  List<Object?> get props => [foodsList];
}
 

 class FoodError extends GetFoodState{
  final Failure failure;

  FoodError({required this.failure});
  @override
  
  List<Object?> get props => [failure];
  

 }