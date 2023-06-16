part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistItemRemoveFromWishlistEvent extends WishlistEvent {
  final ProductDataModel wishlistedItem;
  WishlistItemRemoveFromWishlistEvent({required this.wishlistedItem});
}

class WishlistItemAddToCartEvent extends WishlistEvent {
  final ProductDataModel wishlistedtem;
  WishlistItemAddToCartEvent({required this.wishlistedtem});
}
