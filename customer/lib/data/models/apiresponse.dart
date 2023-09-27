import 'package:customer/data/models/rental.dart';
import 'food.dart';
import 'foodorder.dart';
import 'rentalrequest.dart';
import 'ride.dart';

class ApiResponse {
  final List<Food>? foodItems;
  final List<Rental>? rentalItems;
  final FoodOrder? foodOrder;
  final List<FoodOrder>? foodOrders;
  final Ride? ride;
  final List<Ride>? rideRequests;
  final List<RentalRequest>? rentalRequests;

  final String? accessToken;
  final String? refreshToken;
  final String? authToken;
  final bool? newUser;
  final String? phoneNumber;
  final String? userName;
  final String? userEmail;
  final String? roomNumber;

  ApiResponse({
    this.rideRequests,
    this.foodItems,
    this.ride,
    this.rentalItems,
    this.foodOrder,
    this.foodOrders,
    this.rentalRequests,
    this.accessToken,
    this.refreshToken,
    this.authToken,
    this.newUser,
    this.phoneNumber,
    this.userName,
    this.userEmail,
    this.roomNumber,
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
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'authToken': authToken,
      'newUser': newUser,
      'phoneNumber': phoneNumber,
      'userName': userName,
      'userEmail': userEmail,
      'roomNumber': roomNumber,
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
      foodOrders: (json['orders'] as List<dynamic>?)?.map((e) {
        return FoodOrder.fromJson(e as Map<String, dynamic>);
      }).toList(),
      rentalRequests: (json['rentalrequests'] as List<dynamic>?)
          ?.map((e) => RentalRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      rideRequests: (json['rides'] as List<dynamic>?)
          ?.map((e) => Ride.fromJson(e as Map<String, dynamic>))
          .toList(),
      accessToken: json['access'],
      refreshToken: json['refresh'],
      authToken: json['authToken'],
      newUser: json['new_user'],
      phoneNumber: json['phoneNumber'],
      userName: json['userName'],
      userEmail: json['userEmail'],
      roomNumber: json['roomNumber'],
    );
  }
}
