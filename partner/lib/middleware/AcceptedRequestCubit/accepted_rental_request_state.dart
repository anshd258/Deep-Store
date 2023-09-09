part of 'accepted_rental_request_cubit.dart';

@immutable
abstract class AcceptedRentalRequestState {
  RentalRequestModal? rentalRequest;
  AcceptedRentalRequestState({this.rentalRequest});
}

class AcceptedRentalRequestInitial extends AcceptedRentalRequestState {}

class AcceptedRentalRequestLoading extends AcceptedRentalRequestState {}

class AcceptedRentalRequestLoaded extends AcceptedRentalRequestState {
  AcceptedRentalRequestLoaded({super.rentalRequest});
}

class AcceptedRentalRequestError extends AcceptedRentalRequestState {
  String message;
  AcceptedRentalRequestError({required this.message});
}
