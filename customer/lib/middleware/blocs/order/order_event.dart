part of 'order_bloc.dart';

@immutable
sealed class OrderEvent {}

class InitialOrderFetchEvent extends OrderEvent {}

class UpdateFoodOrderEvent extends OrderEvent {}

class UpdateRideRequestEvent extends OrderEvent {

}

class UpdateRentalRequestEvent extends OrderEvent {}

class CreateRideRequest extends OrderEvent {
    final String pickUpLocation;
  final String dropOffLocation;
  final String pickUpCoordinates;
  final String dropOffCoordinates;

  CreateRideRequest(
      {required this.pickUpLocation,
      required this.dropOffLocation,
      required this.pickUpCoordinates,
      required this.dropOffCoordinates});
}
