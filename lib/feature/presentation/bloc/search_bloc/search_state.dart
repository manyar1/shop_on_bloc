part of 'search_bloc.dart';

abstract class SearchFoodState extends Equatable {
  const SearchFoodState();
  @override
  List<Object?> get props => [];
}

//начальное состояние поиска
class FoodEmpty extends SearchFoodState {}

//отвечает за загрузку еды
class FoodSearchLoading extends SearchFoodState {}

//персонажи загрузились
class FoodSearchLoaded extends SearchFoodState {
  final List<FoodEntity> foods;

  const FoodSearchLoaded({ required this.foods});
  FoodSearchLoaded copyWith({List<FoodEntity>? foundFoods, String? search}) {
    return FoodSearchLoaded( foods: foundFoods ?? foods);
  }

  @override
  List<Object?> get props => [foods];
}

//при загрузке произошла ошибка
class FoodSearchError extends SearchFoodState {
  final String message;

  const FoodSearchError({required this.message});
  @override
  List<Object?> get props => [message];
}
