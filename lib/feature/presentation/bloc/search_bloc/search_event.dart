part of 'search_bloc.dart';

//пользователь нажмет на кнопку
abstract class SearchFoodEvent extends Equatable {
  const SearchFoodEvent();
  @override
  List<Object?> get props => [];
}

class FoodSearch extends SearchFoodEvent {
  final String foodTitle;
  const FoodSearch(this.foodTitle);
}
