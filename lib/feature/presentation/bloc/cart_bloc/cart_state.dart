part of 'cart_bloc.dart';

//в корзину перенеслось загрузились
class CartState extends Equatable {
  final List<FoodEntity> foods;

  const CartState({this.foods = const []});

  double get price {
    var price = 0.0;
    for (final food in foods) {
      price += food.price;
    }
    return price;
  }

  @override
  List<Object?> get props => [foods];
}
