part of 'data_bloc.dart';

@immutable
sealed class DataState {
  final List<Food>? foodList;
  final List<Ride>? rideList;
  final List<Rental>? rentalList;
  final List<FoodOrder>? foodOrderList;
  final List<RideRequest>? rideRequestList;
  final List<RentalRequest>? rentalRequestList;

  const DataState(
      {this.foodList,
      this.rideList,
      this.rentalList,
      this.foodOrderList,
      this.rideRequestList,
      this.rentalRequestList});
}

final class DataInitial extends DataState {}

 class UpdateDataState extends DataState{
  // final List<Food>? foodList;
  // final List<Ride>? rideList;
  // final List<Rental>? rentalList;
  // final List<FoodOrder>? foodOrderList;
  // final List<RideRequest>? rideRequestList;
  // final List<RentalRequest>? rentalRequestList;

  const UpdateDataState(
      {super.foodList,
      super.rideList,
      super.rentalList,
      super.foodOrderList,
      super.rideRequestList,
      super.rentalRequestList});
}