part of 'incoming_rental_request_cubit.dart';

@immutable
abstract class IncomingRentalRequestState {}

class IncomingRentalRequestInitial extends IncomingRentalRequestState {}

class IncomingRentalRequestLoading extends IncomingRentalRequestState {}

class IncomingRentalRequestCompleted extends IncomingRentalRequestState {
  RentalRequestModal? rentalRequest;
  IncomingRentalRequestCompleted({required this.rentalRequest});
}

class IncomingRentalRequestError extends IncomingRentalRequestState {
  String message;
  IncomingRentalRequestError({required this.message});
}
