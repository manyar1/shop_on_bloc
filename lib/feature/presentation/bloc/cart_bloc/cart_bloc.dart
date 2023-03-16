import "dart:developer";

import "package:bloc_concurrency/bloc_concurrency.dart";
import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:shop_on_block/feature/domain/entities/food_entity.dart";
import "package:shop_on_block/feature/domain/usecases/get_all_food.dart";
import "package:shop_on_block/feature/domain/usecases/get_food_to_cart.dart";

part 'cart_event.dart';
part 'cart_state.dart';

class CartBlock extends Bloc<CartEvent, CartState>{
  final GetFoodToCart cartFood;
  CartBlock({required this.cartFood}) : super (CartEmpty()){
    _setupEvents();
  }
  void _setupEvents()
  {
  on<CartEventDecrement>(_onDecrement, transformer: droppable());
  on<CartEventIncrement>(_onIncrement, transformer: droppable());
  on<CartEventPrice>(_onPrice, transformer: droppable());
  }
  void _onDecrement(CartEventDecrement event, Emitter emit){
  final prevState = state; 
  if (prevState is! CounterState){
    log('illegle ${prevState.runtimeType} for ${event.runtimeType}');
    return;
  }
    
    final counter = prevState.counter - 1;
    log('${prevState.counter}');
    emit(CounterState(counter: counter));
}
  void _onIncrement(CartEventIncrement event, Emitter emit){
    final prevState = state; 
    int counter = 0;
  if (prevState is CounterState){
    counter = prevState.counter + 1;
    log('$counter');
    emit(CounterState(counter: counter));
  }
 }
void _onPrice(CartEventPrice event, Emitter emit){
  final prevState = state; 
  int price = 0;
  int counter = 0;
  if (prevState is CounterState){
    counter = prevState.counter;
    log('$counter');
  }

  if (prevState is PriceCounterState){
    
  }
}

}