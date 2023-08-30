part of 'ride_bloc.dart';

@immutable
sealed class RideState {
  final List<Ride>? rideList;
  final List<RideRequest>? rideRequestList;

  const RideState({ this.rideList, this.rideRequestList});
}

final class RideInitial extends RideState {}

class UpdateRideState extends RideState {
  final List<Ride>? rideList;
  final List<RideRequest>? rideRequestList;

  const UpdateRideState({ this.rideList, this.rideRequestList});
}
