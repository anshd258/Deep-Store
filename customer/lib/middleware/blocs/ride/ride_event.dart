part of 'ride_bloc.dart';

@immutable
sealed class RideEvent {}

class FetchRideRequests extends RideEvent {}

class CreateRideRequest extends RideEvent {
  final Ride? ride;

  CreateRideRequest(
      this.ride,
     );
}
