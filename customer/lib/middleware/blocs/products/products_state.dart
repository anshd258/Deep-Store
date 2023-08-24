part of 'products_bloc.dart';

@immutable
sealed class ProductsState {
  final List<Food>? foodList;
  final List<Ride>? rideList;
  final List<Rental>? rentalList;

  const ProductsState({this.foodList, this.rideList, this.rentalList});
}

final class ProductsInitial extends ProductsState {}

final class UpdateProductState extends ProductsState {
  const UpdateProductState({super.foodList, super.rentalList, super.rideList});
}