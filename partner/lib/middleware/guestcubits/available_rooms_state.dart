part of 'available_rooms_cubit.dart';

@immutable
abstract class AvailableRoomsState {
  
}

class AvailableRoomsInitial extends AvailableRoomsState {}
class AvailableRoomsLoading extends AvailableRoomsState {}
class AvailableRoomsLoaded extends AvailableRoomsState {}
class AvailableRoomsError extends AvailableRoomsState {}
