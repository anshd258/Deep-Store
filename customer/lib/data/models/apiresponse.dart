import 'food.dart';
import 'foodorder.dart';
import 'rental.dart';
import 'rentalrequest.dart';
import 'ride.dart';
import 'riderequest.dart';
import 'user.dart';

class ApiResponse {
  final List<Food>? foodItems;
  final List<Ride>? rideItems;
  final List<Rental>? rentalItems;

  final List<FoodOrder>? foodOrders;
  final List<RideRequest>? rideRequests;
  final List<RentalRequest>? rentalRequests;

  final User user;
  final int providerID;

  // we can add params like status code, error message, tokens etc

  ApiResponse({
    this.foodItems,
    this.rideItems,
    this.rentalItems,
    this.foodOrders,
    this.rideRequests,
    this.rentalRequests,
    required this.user,
    required this.providerID,
  });

  Map<String, dynamic> toJson() {
    return {
      'foodItems': foodItems?.map((item) => item.toJson()).toList(),
      'rideItems': rideItems?.map((item) => item.toJson()).toList(),
      'rentalItems': rentalItems?.map((item) => item.toJson()).toList(),
      'foodOrders': foodOrders?.map((order) => order.toJson()).toList(),
      'rideRequests': rideRequests?.map((request) => request.toJson()).toList(),
      'rentalRequests': rentalRequests?.map((request) => request.toJson()).toList(),
      'user': user.toJson(),
      'providerID': providerID,
    };
  }

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      foodItems: (json['foodItems'] as List<dynamic>?)?.map((item) => Food.fromJson(item)).toList(),
      rideItems: (json['rideItems'] as List<dynamic>?)?.map((item) => Ride.fromJson(item)).toList(),
      rentalItems: (json['rentalItems'] as List<dynamic>?)?.map((item) => Rental.fromJson(item)).toList(),
      foodOrders: (json['foodOrders'] as List<dynamic>?)?.map((order) => FoodOrder.fromJson(order)).toList(),
      rideRequests: (json['rideRequests'] as List<dynamic>?)?.map((request) => RideRequest.fromJson(request)).toList(),
      rentalRequests: (json['rentalRequests'] as List<dynamic>?)?.map((request) => RentalRequest.fromJson(request)).toList(),
      user: User.fromJson(json['user']),
      providerID: json['providerID'],
    );
  }
}

