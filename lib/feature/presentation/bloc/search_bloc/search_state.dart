part of 'search_bloc.dart';


abstract class SearchFoodState extends Equatable{
  const SearchFoodState();
  @override

  List<Object?> get props => [];
}
//начальное состояние поиска
class FoodEmpty extends SearchFoodState{

}
//отвечает за загрузку еды
class FoodSearchLoading extends SearchFoodState{

}
//персонажи загрузились
class FoodSearchLoaded extends SearchFoodState{
  final List<FoodEntity> food;

  const FoodSearchLoaded(this.food);

  @override
  List<Object?> get props => [food];
}
//при загрузке произошла ошибка
class PersonSearchError extends SearchFoodState {
  final String message;

  const PersonSearchError({required this.message});
  @override
 
  List<Object?> get props => [message];
}