part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent {}

class DetailItemAddtoCartEvent extends DetailsEvent {
  final ProductDataModel productDataModel;
  DetailItemAddtoCartEvent({required this.productDataModel});
}

class DetailItemAddToWishlistEvent extends DetailsEvent {
  final ProductDataModel productDataModel;
  DetailItemAddToWishlistEvent({required this.productDataModel});
}
