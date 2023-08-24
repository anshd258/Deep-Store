part of 'order_bloc.dart';

@immutable
sealed class OrderEvent {}

class InitialOrderFetchEvent extends OrderEvent {}

class UpdateFoodOrderEvent extends OrderEvent {}

class UpdateRideRequestEvent extends OrderEvent {}

class UpdateRentalRequestEvent extends OrderEvent {}
