part of 'ride_bloc.dart';

@immutable
sealed class RideState {
  final Ride? ride;
  const RideState({this.ride});
}

final class RideInitial extends RideState {
  const RideInitial();
}

class UpdateRideState extends RideState {
  final Ride? newRide;
  const UpdateRideState(this.newRide);
}
