part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
  @override
  List<Object> get props => [];
}

//в корзину перенеслось загрузились
class CartLoaded extends CartState {
  final List<FoodEntity> foods;

  const CartLoaded({required this.foods});

  double get price {
    var price = 0.0;
    for (final food in foods) {
      price += food.price;
    }
    return price;
  }

  @override
  List<Object> get props => [foods];
}

class CartLoading extends CartState {
  const CartLoading();
  @override
  List<Object> get props => [];
}

class CartFailure extends CartState {
  final Failure failure;

  const CartFailure({required this.failure});
  @override
  List<Object> get props => [failure];
}
