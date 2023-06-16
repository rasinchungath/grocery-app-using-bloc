import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example_1/data/cart_items.dart';
import 'package:bloc_example_1/data/wishlist_items.dart';
import 'package:flutter/material.dart';
import '../../home/models/home_product_data_model.dart';
part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailItemAddToWishlistEvent>(detailItemAddToWishlistEvent);
    on<DetailItemAddtoCartEvent>(detailItemAddtoCartEvent);
  }

  FutureOr<void> detailItemAddToWishlistEvent(
      DetailItemAddToWishlistEvent event, Emitter<DetailsState> emit) {
        wishlistItems.add(event.productDataModel);
        emit(DetailsAddToWishlistActionState());
      }

  FutureOr<void> detailItemAddtoCartEvent(
      DetailItemAddtoCartEvent event, Emitter<DetailsState> emit) {
        cartItems.add(event.productDataModel);
        emit(DetailsAddToCartActionState());
      }
}
