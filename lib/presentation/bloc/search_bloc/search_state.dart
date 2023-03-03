part of 'search_bloc.dart';

abstract class SearchFoodState extends Equatable{
  const SearchFoodState();
  @override

  List<Object?> get props => [];
}

class FoodEmpty extends SearchFoodState{

}

class FoodSearchLoading extends SearchFoodState{

}

class FoodSearchLoaded extends SearchFoodState{
  final List<FoodEntity> food;

  const FoodSearchLoaded(this.food);

  @override
  List<Object?> get props => [food];
}

class PersonSearchError extends SearchFoodState {
  final String message;

  const PersonSearchError(this.message);
  @override
 
  List<Object?> get props => [message];
}