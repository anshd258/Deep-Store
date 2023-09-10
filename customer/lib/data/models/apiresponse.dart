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
  final List<FoodOrder>? foodOrders;
  final Ride? ride;
  final List<Ride>? rideRequests;
  final List<RentalRequest>? rentalRequests;
  // final User? user;
 
  final String? access;
  final String? refresh;

  ApiResponse({
    this.rideRequests,
    this.foodItems,
    this.ride,
    this.rentalItems,
    this.foodOrder,
    this.foodOrders,
    this.rentalRequests,
    // required this.user,
    this.access,
    this.refresh,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'foodItems': foodItems?.map((e) => e.toJson()).toList(),
      'rentalItems': rentalItems?.map((e) => e.toJson()).toList(),
      'foodOrder': foodOrder?.toJson(),
      'ride': ride?.toJson(),
      'foodOrders': foodOrders?.map((e) => e.toJson()).toList(),
      'rentalRequests': rentalRequests?.map((e) => e.toJson()).toList(),
      'rideRequests': rideRequests?.map((e) => e.toJson()).toList(),
      // 'user': user.toJson(),
      'access': access,
      'refresh': refresh,
    };
    return data;
  }

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      foodItems: (json['catalog'] as List<dynamic>?)
          ?.map((e) => Food.fromJson(e as Map<String, dynamic>))
          .toList(),
      rentalItems: (json['rentals'] as List<dynamic>?)
          ?.map((e) => Rental.fromJson(e as Map<String, dynamic>))
          .toList(),
      foodOrder: json['order'] != null
          ? FoodOrder.fromJson(json['order'] as Map<String, dynamic>)
          : null,
      ride: json['ride'] != null
          ? Ride.fromJson(json['ride'] as Map<String, dynamic>)
          : null,
      foodOrders: (json['foodorders'] as List<dynamic>?)
          ?.map((e) => FoodOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      rentalRequests: (json['rentalrequests'] as List<dynamic>?)
          ?.map((e) => RentalRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      rideRequests: (json['riderequests'] as List<dynamic>?)
          ?.map((e) => Ride.fromJson(e as Map<String, dynamic>))
          .toList(),
      // user: User.fromJson(json['user'] as Map<String, dynamic>),
      access: json['access'],
      refresh: json['refresh'],
    );
  }
}
