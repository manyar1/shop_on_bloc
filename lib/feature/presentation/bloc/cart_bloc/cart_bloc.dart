import 'dart:async';
import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_on_block/core/error/failure.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/feature/domain/usecases/get_all_food_cart.dart';
import 'package:shop_on_block/feature/domain/usecases/get_food_to_cart.dart';
import 'package:shop_on_block/feature/domain/usecases/remove_from_cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBlock extends Bloc<CartEvent, CartState> {
  final GetFoodToCartUseCase cartFood;
  final RemoveFoodToCartUseCase removefood;
  final GetAllFoodCartUseCase getAllFoodCart;
  CartBlock(this.cartFood, this.removefood, this.getAllFoodCart) : super(const CartLoading()) {
    _setupEvents();
  }
  void _setupEvents() {
    on<AddOnCartEvent>(_addOnCart, transformer: droppable());
    on<DeleteFromCartEvent>(_deleteFromCart, transformer: droppable());
    on<DeleteOneItemFromCartEvent>(_deleteOneItemFromCart, transformer: droppable());
    on<GetAllFoodCartEvent>(_getAllFoodCart, transformer: droppable());
  }

  Future<void> _addOnCart(AddOnCartEvent event, Emitter emit) async {
    var prevState = state;
    if (prevState is! CartLoaded) {
      final completer = Completer();
      add(GetAllFoodCartEvent(completer: completer));
      await completer.future;
    }
    prevState = state;
    if (prevState is! CartLoaded) {
      log('illegal ${state.runtimeType} for ${event.runtimeType}');
      return;
    }
    final addFoods = prevState.foods.toList()..add(event.food);
    await cartFood(PageCartParams(foods: addFoods));

    emit(CartLoaded(foods: addFoods));
  }

  Future<void> _deleteFromCart(DeleteFromCartEvent event, Emitter emit) async {
    var prevState = state;
    if (prevState is! CartLoaded) {
      final completer = Completer();
      add(GetAllFoodCartEvent(completer: completer));
      await completer.future;
    }
    prevState = state;

    if (prevState is! CartLoaded) {
      log('illegal ${state.runtimeType} for ${event.runtimeType}');
      return;
    }
    final addFoods = prevState.foods.toList()..removeWhere((food) => food.id == event.food.id);
    await removefood(RemoveCartParams(foods: addFoods));
    emit(CartLoaded(foods: addFoods));
  }

  Future<void> _deleteOneItemFromCart(DeleteOneItemFromCartEvent event, Emitter emit) async {
    var prevState = state;
    if (prevState is! CartLoaded) {
      final completer = Completer();
      add(GetAllFoodCartEvent(completer: completer));
      await completer.future;
    }
    prevState = state;

    if (prevState is! CartLoaded) {
      log('illegal ${state.runtimeType} for ${event.runtimeType}');
      return;
    }
    final addFoods = prevState.foods.toList();
    final removeIndex = addFoods.lastIndexWhere((food) => food.id == event.food.id);
    log(addFoods.toString());

    final updatedAddFoods = addFoods.toList()..removeAt(removeIndex);
    log(updatedAddFoods.toString());
    await cartFood(PageCartParams(foods: updatedAddFoods));
    emit(CartLoaded(foods: updatedAddFoods));
  }

  Future<void> _getAllFoodCart(GetAllFoodCartEvent event, Emitter emit) async {
    try {
      final prevState = state;
      if (prevState is! CartLoaded) {
        emit(const CartLoading());
      }
      final response = await getAllFoodCart(const PageCartFoodParams());
      await response.fold((failure) => _onStateFailure(emit, failure), (food) => _onGetAllFoodSuccessful(emit, food));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _onStateFailure(Emitter emit, Failure failure) async {
    emit(CartFailure(failure: failure));
  }

  Future<void> _onGetAllFoodSuccessful(Emitter emit, List<FoodEntity> foods) async {
    emit(CartLoaded(foods: foods));
  }
}
