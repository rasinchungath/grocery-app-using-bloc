part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final ProductDataModel productDataModel;
  CartRemoveFromCartEvent({required this.productDataModel});
}

class CartItemAddToWishlistEvent extends CartEvent{
  final ProductDataModel productDataModel;
  CartItemAddToWishlistEvent({required this.productDataModel});
}
