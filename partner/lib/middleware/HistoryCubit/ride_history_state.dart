part of 'ride_history_cubit.dart';

@immutable
abstract class RideHistoryState {
  RidesRequestModal? rideRequest;
  RideHistoryState({this.rideRequest});
}

class RideHistoryInitial extends RideHistoryState {}

class RideHistoryLoading extends RideHistoryState {}

class RideHistoryLoaded extends RideHistoryState {
  RideHistoryLoaded({required super.rideRequest});
}

class RideHistoryError extends RideHistoryState {
  String message;
  RideHistoryError({required this.message});
}
