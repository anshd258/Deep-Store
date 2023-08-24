part of 'order_bloc.dart';

@immutable
sealed class OrderState {
  final List<FoodOrder>? foodOrderList;
  final List<RideRequest>? rideRequestList;
  final List<RentalRequest>? rentalRequestList;

  const OrderState(
      {this.foodOrderList, this.rideRequestList, this.rentalRequestList});
}

final class OrderInitial extends OrderState {}

final class UpdateOrderState extends OrderState {
  const UpdateOrderState({super.foodOrderList, super.rentalRequestList, super.rideRequestList});
}
