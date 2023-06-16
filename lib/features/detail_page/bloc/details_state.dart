part of 'details_bloc.dart';

@immutable
abstract class DetailsState {}

abstract class DetailsActionState extends DetailsState{}

class DetailsInitial extends DetailsState {}

class DetailsAddToCartActionState extends DetailsActionState{}

class DetailsAddToWishlistActionState extends DetailsActionState{}
