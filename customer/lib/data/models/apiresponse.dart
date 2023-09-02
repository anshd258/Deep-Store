import 'food.dart';
import 'foodorder.dart';
import 'rental.dart';
import 'rentalrequest.dart';
import 'ride.dart';
import 'user.dart';

class ApiResponse {
  final List<Food>? foodItems;
  final List<Rental>? rentalItems;
  final FoodOrder? foodOrder;
  final Ride? rideRequest;
  final List<FoodOrder>? foodOrders;
  final List<RentalRequest>? rentalRequests;
  final User user;
  final int providerID;

  ApiResponse({
    this.foodItems,
    this.rideRequest,
    this.rentalItems,
    this.foodOrder,
    this.foodOrders,
    this.rentalRequests,
    required this.user,
    required this.providerID,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'foodItems': foodItems?.map((e) => e.toJson()).toList(),
      'rentalItems': rentalItems?.map((e) => e.toJson()).toList(),
      'foodOrder': foodOrder?.toJson(),
      'rideRequest': rideRequest?.toJson(),
      'foodOrders': foodOrders?.map((e) => e.toJson()).toList(),
      'rentalRequests': rentalRequests?.map((e) => e.toJson()).toList(),
      'user': user.toJson(),
      'providerID': providerID,
    };
    return data;
  }

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      foodItems: (json['foodItems'] as List<dynamic>?)
          ?.map((e) => Food.fromJson(e as Map<String, dynamic>))
          .toList(),
      rentalItems: (json['rentalItems'] as List<dynamic>?)
          ?.map((e) => Rental.fromJson(e as Map<String, dynamic>))
          .toList(),
      foodOrder: json['foodOrder'] != null
          ? FoodOrder.fromJson(json['foodOrder'] as Map<String, dynamic>)
          : null,
      rideRequest: json['rideRequest'] != null
          ? Ride.fromJson(json['rideRequest'] as Map<String, dynamic>)
          : null,
      foodOrders: (json['foodOrders'] as List<dynamic>?)
          ?.map((e) => FoodOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      rentalRequests: (json['rentalRequests'] as List<dynamic>?)
          ?.map((e) => RentalRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      providerID: json['providerID'] as int,
    );
  }
}

