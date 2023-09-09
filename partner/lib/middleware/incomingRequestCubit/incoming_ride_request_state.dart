part of 'incoming_ride_request_cubit.dart';

@immutable
abstract class IncomingRideRequestState {
  RidesRequestModal? rideRequest;
  IncomingRideRequestState({this.rideRequest});
}

class IncomingRideRequestInitial extends IncomingRideRequestState {}

class IncomingRideRequestLoading extends IncomingRideRequestState {}

class IncomingRideRequestLoaded extends IncomingRideRequestState {
  IncomingRideRequestLoaded({super.rideRequest});
}

class IncomingRideRequestError extends IncomingRideRequestState {
  String message;
  IncomingRideRequestError({required this.message});
}
