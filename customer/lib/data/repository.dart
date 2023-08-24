import 'package:customer/data/models/foodorder.dart';
import 'package:customer/data/models/user.dart';

import 'models/food.dart';
import 'models/rental.dart';
import 'models/rentalrequest.dart';
import 'models/ride.dart';
import 'models/riderequest.dart';

class Repository {
  List<Food>? foodList;
  List<Ride>? rideList;
  List<Rental>? rentalList;
  List<FoodOrder>? foodOrderList;
  List<RideRequest>? rideRequestList;
  List<RentalRequest>? rentalRequestList;
  FoodOrder? cartOrder;
  User? user;
  int? roomNumber;
  int? providerId;

  Repository(
      {this.foodList,
      this.rideList,
      this.rentalList,
      this.foodOrderList,
      this.rideRequestList,
      this.rentalRequestList,
      this.cartOrder,
      this.user,
      this.roomNumber,
      this.providerId}); 
  
  void set({
    List<Food>? foodList,
    List<Ride>? rideList,
    List<Rental>? rentalList,
    List<FoodOrder>? foodOrderList,
    List<RideRequest>? rideRequestList,
    List<RentalRequest>? rentalRequestList,
    FoodOrder? cartOrder,
    User? user,
    int? roomNumber,
    int? providerId,
  }) {
    this.foodList = foodList;
    this.rideList = rideList;
    this.rentalList = rentalList;
    this.foodOrderList = foodOrderList;
    this.rideRequestList = rideRequestList;
    this.rentalRequestList = rentalRequestList;
    this.cartOrder = cartOrder;
    this.user = user;
    this.roomNumber = roomNumber;
    this.providerId = providerId;
  }
}
