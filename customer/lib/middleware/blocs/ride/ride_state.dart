part of 'ride_bloc.dart';

@immutable
sealed class RideState {
  final Ride? ride;
  final List<Ride>? rideRequests;
  const RideState({this.rideRequests, this.ride});
}

final class RideInitial extends RideState {
  const RideInitial();
}

// class UpdateRideState extends RideState {
//   final Ride? newRide;
//   final List<Ride>? requests;
//   const UpdateRideState({this.newRide, this.requests});
// }

class UpdateRideRequestsState extends RideState {

  UpdateRideRequestsState({super.rideRequests, super.ride});
}
