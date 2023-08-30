part of 'rental_bloc.dart';


@immutable
sealed class RentalState {
  final List<Rental>? rentalList;
  final List<RentalRequest>? rentalRequestList;

  const RentalState({ this.rentalList, this.rentalRequestList});
}

final class RentalInitial extends RentalState {}


 class UpdateRentalState extends RentalState {
  final List<Rental>? rentalList;
  final List<RentalRequest>? rentalRequestList;

  const UpdateRentalState({ this.rentalList, this.rentalRequestList});
}