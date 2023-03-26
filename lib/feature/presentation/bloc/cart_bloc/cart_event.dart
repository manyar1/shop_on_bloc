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
