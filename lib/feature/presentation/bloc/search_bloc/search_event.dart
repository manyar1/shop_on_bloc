part of 'search_bloc.dart';

//пользователь нажмет на кнопку
abstract class SearchFoodEvent extends Equatable{
  const SearchFoodEvent();
  @override
  List<Object?> get props => [];
}

class SearchFood extends SearchFoodEvent {
  final String foodQuery;

  const SearchFood(this.foodQuery);

}