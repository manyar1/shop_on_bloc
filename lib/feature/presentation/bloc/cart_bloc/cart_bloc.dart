import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/domain/usecases/get_food_to_cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBlock extends Bloc<CartEvent, CartState> {
  final GetFoodToCartUseCase cartFood;
  CartBlock(this.cartFood) : super(const CartState()) {
    _setupEvents();
  }
  void _setupEvents() {
    on<AddOnCartEvent>(_addOnCart, transformer: droppable());
    on<DeleteFromCartEvent>(_deleteFromCart, transformer: droppable());
    on<DeleteOneItemFromCartEvent>(_deleteOneItemFromCart,
        transformer: droppable());
      on<IsThereInTheCartEvent>(_isThereInTheCart, transformer: droppable());
  }

  void _addOnCart(AddOnCartEvent event, Emitter emit) {
    final addFoods = state.foods.toList()..add(event.food);
    emit(CartState(foods: addFoods));
  }

  void _deleteFromCart(DeleteFromCartEvent event, Emitter emit) {
    final addFoods = state.foods.toList()
      ..removeWhere((food) => food.id == event.food.id);
    emit(CartState(foods: addFoods));
  }

  void _deleteOneItemFromCart(DeleteOneItemFromCartEvent event, Emitter emit) {
    final addFoods = state.foods.toList();
    final removeIndex = addFoods.indexWhere((food) => food.id == event.food.id);
    final updatedAddFoods = addFoods.toList()..removeAt(removeIndex);
    emit(CartState(foods: updatedAddFoods));
  }

  void _isThereInTheCart(IsThereInTheCartEvent event, Emitter emit) {
    final addFoods = state.foods.toList();
    final isThereIndex =
        addFoods.indexWhere((food) => food.id == event.food.id);
    final updatedAddFoods = addFoods.toList()..elementAt(isThereIndex); 
    emit(CartState(foods: updatedAddFoods));
  }
}
