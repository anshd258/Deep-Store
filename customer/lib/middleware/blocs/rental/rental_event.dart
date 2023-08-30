part of 'rental_bloc.dart';

@immutable
sealed class RentalEvent {}

class FetchRentals extends RentalEvent {}

class FetchRentalRequests extends RentalEvent {}

class CreateRentalRequest extends RentalEvent{}
