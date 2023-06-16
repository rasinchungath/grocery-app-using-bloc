import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_example_1/data/cart_items.dart';
import 'package:flutter/material.dart';
import '../../../data/wishlist_items.dart';
import '../../home/models/home_product_data_model.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistItemRemoveFromWishlistEvent>(
        wishlistItemRemoveFromWishlistEvent);
    on<WishlistItemAddToCartEvent>(wishlistItemAddToCartEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistItemRemoveFromWishlistEvent(
      WishlistItemRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.wishlistedItem);
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
    emit(WishlistItemRemovedFromWishlistActionState());
  }

  FutureOr<void> wishlistItemAddToCartEvent(
      WishlistItemAddToCartEvent event, Emitter<WishlistState> emit) {
        cartItems.add(event.wishlistedtem);
        emit(WishlistItemAddToCartActionState());
      }
}
