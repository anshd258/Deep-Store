part of 'ride_bloc.dart';

@immutable
sealed class RideEvent {}


class FetchRideRequests extends RideEvent {}

class CreateRideRequest extends RideEvent {
  final String? pickUpLocation;
  final String? dropOffLocation;
  final String? pickUpCoordinates;
  final String? dropOffCoordinates;

  CreateRideRequest(
      {this.pickUpLocation,
      this.dropOffLocation,
      this.pickUpCoordinates,
      this.dropOffCoordinates});
}
