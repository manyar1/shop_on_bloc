part of 'food_bloc.dart';

abstract class GetFoodEvent extends Equatable{
  const GetFoodEvent();
  @override
  List<Object?> get props => [];
}

class FoodEvent extends GetFoodEvent {
  const FoodEvent();
}

