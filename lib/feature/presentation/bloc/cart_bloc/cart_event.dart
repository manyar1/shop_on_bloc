part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable{
  const CartEvent();
  @override
  List<Object?> get props => [];
}

class GetOnCartEvent extends CartEvent{
  const GetOnCartEvent();
}

class CartEventDecrement extends CartEvent{
  const CartEventDecrement();
}

class CartEventIncrement extends CartEvent{
  const CartEventIncrement();
}
class CartEventPrice extends CartEvent{
  const CartEventPrice();
}


