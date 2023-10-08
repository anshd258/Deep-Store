part of 'ride_cubit.dart';


@immutable
sealed class RideState {
  final Ride? ride;
  final List<Ride>? rideRequests;
  const RideState({this.rideRequests, this.ride});
}

final class RideInitial extends RideState {
  const RideInitial();
}



class UpdateRideRequestsState extends RideState {

  UpdateRideRequestsState({super.rideRequests, super.ride});
}
