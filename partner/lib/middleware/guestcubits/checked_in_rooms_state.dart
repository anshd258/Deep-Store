part of 'checked_in_rooms_cubit.dart';

@immutable
abstract class CheckedInRoomsState {}

class CheckedInRoomsInitial extends CheckedInRoomsState {}
class CheckedInRoomsLoading extends CheckedInRoomsState {}
class CheckedInRoomsLoaded extends CheckedInRoomsState {}
class CheckedInRoomsError extends CheckedInRoomsState {}
