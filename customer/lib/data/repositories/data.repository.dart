import 'package:customer/data/models/foodorder.dart';
import '../models/food.dart';
import '../models/rental.dart';
import '../models/rentalrequest.dart';
import '../models/ride.dart';

class DataRepository {
  List<Food>? foodList;
  List<Rental>? rentalList;

  Ride? rideRequest;
  List<FoodOrder>? foodOrderList;
  List<RentalRequest>? rentalRequestList;

  FoodOrder? cartOrder;

  DataRepository({
    this.foodList,
    this.rideRequest,
    this.rentalList,
    this.foodOrderList,
    this.rentalRequestList,
    this.cartOrder,
  });

  void set({
    List<Food>? foodList,
    Ride? rideRequest,
    List<Ride>? rideRequestList,
    List<Rental>? rentalList,
    List<FoodOrder>? foodOrderList,
    List<RentalRequest>? rentalRequestList,
    FoodOrder? cartOrder,
  }) {
    this.rideRequest = rideRequest;
    this.foodList = foodList;
    this.rentalList = rentalList;
    this.foodOrderList = foodOrderList;
    this.rentalRequestList = rentalRequestList;
    this.cartOrder = cartOrder;
  }
}
