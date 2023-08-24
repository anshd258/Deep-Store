part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

class InitialProductFetchEvent extends ProductsEvent {}

class UpdateFoodListEvent extends ProductsEvent {}

class UpdateRideListEvent extends ProductsEvent {}

class UpdateRentalListEvent extends ProductsEvent {}
