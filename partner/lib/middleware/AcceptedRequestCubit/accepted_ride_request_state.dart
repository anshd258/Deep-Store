part of 'accepted_ride_request_cubit.dart';

@immutable
abstract class AcceptedRideRequestState {
  RidesRequestModal? rideRequest;
  AcceptedRideRequestState({this.rideRequest});
}

class AcceptedRideRequestInitial extends AcceptedRideRequestState {}

class AcceptedRideRequestLoading extends AcceptedRideRequestState {}

class AcceptedRideRequestLoaded extends AcceptedRideRequestState {
  AcceptedRideRequestLoaded({super.rideRequest});
}

class AcceptedRideRequestError extends AcceptedRideRequestState {
  String message;
  AcceptedRideRequestError({required this.message});
}
