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
}
