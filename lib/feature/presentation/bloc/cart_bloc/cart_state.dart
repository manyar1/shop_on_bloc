part of 'cart_bloc.dart';

abstract class CartState extends Equatable{
  const CartState();
  @override
  List<Object?> get props => [];
}

//начальное состояние поиска
class CartEmpty extends CartState{

}
class CounterState extends CartState{
   final int counter;

  const CounterState({required this.counter});
  @override
  List<Object?> get props => [counter];
}
//отвечает за отображении цены 
class PriceCounterState extends CartState{
  final int price;

  const PriceCounterState({required this.price});
  @override
  List<Object?> get props => [price];
}

//отвечает за загрузку еды
class FoodCartLoading extends CartState{

}

//в корзину перенеслось загрузились
class LoadedCartState extends CartState{
  final List<FoodEntity> foods;

  const LoadedCartState({required this.foods});

  @override
  List<Object?> get props => [foods];
}

class CartError extends CartState {
  final String message;

  const CartError({required this.message});
  @override
 
  List<Object?> get props => [message];
}