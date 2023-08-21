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

  final String? token;
  final User user;
  final int providerID;

  ApiResponse({
    this.foodItems,
    this.rideItems,
    this.rentalItems,
    this.foodOrders,
    this.rideRequests,
    this.rentalRequests,
    this.token,
    required this.user,
    required this.providerID,
  });

  // Convert ApiResponse object to a Map (JSON representation)
  Map<String, dynamic> toJson() {
    return {
      'foodItems': foodItems?.map((item) => item.toJson()).toList(),
      'rideItems': rideItems?.map((item) => item.toJson()).toList(),
      'rentalItems': rentalItems?.map((item) => item.toJson()).toList(),
      'foodOrders': foodOrders?.map((order) => order.toJson()).toList(),
      'rideRequests': rideRequests?.map((request) => request.toJson()).toList(),
      'rentalRequests': rentalRequests?.map((request) => request.toJson()).toList(),
      'token': token,
      'user': user.toJson(),
      'providerID': providerID,
    };
  }

  // Create an ApiResponse object from a JSON map
  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      foodItems: (json['foodItems'] as List<dynamic>?)?.map((item) => Food.fromJson(item)).toList(),
      rideItems: (json['rideItems'] as List<dynamic>?)?.map((item) => Ride.fromJson(item)).toList(),
      rentalItems: (json['rentalItems'] as List<dynamic>?)?.map((item) => Rental.fromJson(item)).toList(),
      foodOrders: (json['foodOrders'] as List<dynamic>?)?.map((order) => FoodOrder.fromJson(order)).toList(),
      rideRequests: (json['rideRequests'] as List<dynamic>?)?.map((request) => RideRequest.fromJson(request)).toList(),
      rentalRequests: (json['rentalRequests'] as List<dynamic>?)?.map((request) => RentalRequest.fromJson(request)).toList(),
      token: json['token'],
      user: User.fromJson(json['user']),
      providerID: json['providerID'],
    );
  }
}

