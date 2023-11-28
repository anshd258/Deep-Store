part of 'services_cubit.dart';

@immutable
abstract class ServicesState {
  FoodService? food;
  TransportService? transport;
  RentalService? rental;
  HouseKeepingService? houseKeeping;
  LaundryService? laundry;
  ServicesState(
      {this.food,
      this.houseKeeping,
      this.laundry,
      this.rental,
      this.transport});
}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesLoaded extends ServicesState {
  ServicesLoaded(
      {super.food,
      super.houseKeeping,
      super.laundry,
      super.rental,
      super.transport});
}

class ServicesError extends ServicesState {
  String? message;
  ServicesError({this.message});
}

abstract class ServiceModal {
  void fromJson();
}

class FoodService extends ServiceModal {
  List<int>? data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

  @override
  void fromJson() {
    // TODO: implement fromJson
  }
}

class TransportService extends ServiceModal {
  List<int>? data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

  @override
  void fromJson() {
    // TODO: implement fromJson
  }
}

class RentalService extends ServiceModal {
  List<int>? data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

  @override
  void fromJson() {
    // TODO: implement fromJson
  }
}

class HouseKeepingService extends ServiceModal {
  List<int>? data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

  @override
  void fromJson() {
    // TODO: implement fromJson
  }
}

class LaundryService extends ServiceModal {
  List<int>? data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

  @override
  void fromJson() {
    // TODO: implement fromJson
  }
}
