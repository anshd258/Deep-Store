part of 'rental_history_cubit.dart';

@immutable
abstract class RentalHistoryState {
  RentalRequestModal? rentalRequest;
  RentalHistoryState({this.rentalRequest});
}

class RentalHistoryInitial extends RentalHistoryState {}

class RentalHistoryLoading extends RentalHistoryState {}

class RentalHistoryLoaded extends RentalHistoryState {
  RentalHistoryLoaded({super.rentalRequest});
}

class RentalHistoryError extends RentalHistoryState {
  String message;
  RentalHistoryError({required this.message});
}
