import 'package:customer/data/models/foodorder.dart';
import '../models/food.dart';
import '../models/rental.dart';
import '../models/rentalrequest.dart';
import '../models/ride.dart';
import '../models/riderequest.dart';



class DataRepository {
  List<Food>? foodList;
  List<Ride>? rideList;
  List<Rental>? rentalList;
  
  List<FoodOrder>? foodOrderList;
  List<RideRequest>? rideRequestList;
  List<RentalRequest>? rentalRequestList;

  FoodOrder? cartOrder;


  DataRepository(
      {this.foodList,
      this.rideList,
      this.rentalList,
      this.foodOrderList,
      this.rideRequestList,
      this.rentalRequestList,
      this.cartOrder,
     });

  void set({
    List<Food>? foodList,
    List<Ride>? rideList,
    List<Rental>? rentalList,
    List<FoodOrder>? foodOrderList,
    List<RideRequest>? rideRequestList,
    List<RentalRequest>? rentalRequestList,
    FoodOrder? cartOrder,

  }) {
    this.foodList = foodList;
    this.rideList = rideList;
    this.rentalList = rentalList;
    this.foodOrderList = foodOrderList;
    this.rideRequestList = rideRequestList;
    this.rentalRequestList = rentalRequestList;
    this.cartOrder = cartOrder;

  }
}
