part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object?> get props => [];
}

class AddOnCartEvent extends CartEvent {
  final FoodEntity food;
  const AddOnCartEvent({required this.food});
}

class DeleteFromCartEvent extends CartEvent {
  final FoodEntity food;
  const DeleteFromCartEvent({required this.food});
}

class DeleteOneItemFromCartEvent extends CartEvent {
  final FoodEntity food;
  const DeleteOneItemFromCartEvent({required this.food});
}

class GetAllFoodCartEvent extends CartEvent {
  final Completer? completer;
  const GetAllFoodCartEvent({this.completer});
  @override
  List<Object?> get props => [completer];
}
