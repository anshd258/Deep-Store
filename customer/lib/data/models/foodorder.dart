import 'package:customer/data/models/fooddetail.dart';
import 'package:customer/data/models/user.dart'; // Import the User class

import '../../middleware/helpers/constants.dart';

class FoodOrder {
  final int id;
  final User user; // New User variable

  final RequestStatus status;
  final double taxes;
  final double charges;
  final double discount;
  final double totalPrice;
  final List<FoodDetails> items;
  final DateTime eta;

  FoodOrder({
    required this.id,
    required this.user, // Include user parameter in the constructor
    required this.status,
    required this.taxes,
    required this.charges,
    required this.discount,
    required this.totalPrice,
    required this.items,
    required this.eta,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(), // Convert user to JSON representation
      'status': _mapRequestStatusToInt(status),
      'taxes': taxes,
      'charges': charges,
      'discount': discount,
      'totalPrice': totalPrice,
      'items': items.map((foodDetails) => foodDetails.toJson()).toList(),
      'eta': eta.toIso8601String(),
    };
  }

  factory FoodOrder.fromJson(Map<String, dynamic> json) {
    return FoodOrder(
      id: json['id'],
      user: User.fromJson(json['user']), // Parse user from JSON
      status: _mapIntToRequestStatus(json['status']),
      taxes: json['taxes'],
      charges: json['charges'],
      discount: json['discount'],
      totalPrice: json['totalPrice'],
      items: (json['items'] as List<dynamic>)
          .map((foodJson) => FoodDetails.fromJson(foodJson))
          .toList(),
      eta: DateTime.parse(json['eta']),
    );
  }



  static int _mapRequestStatusToInt(RequestStatus status) {
    switch (status) {
      case RequestStatus.pending:
        return 0;
      case RequestStatus.ongoing:
        return 1;
      case RequestStatus.success:
        return 2;
      case RequestStatus.failed:
        return 3;
      default:
        throw ArgumentError('Invalid RequestStatus value: $status');
    }
  }

  static RequestStatus _mapIntToRequestStatus(int status) {
    switch (status) {
      case 0:
        return RequestStatus.pending;
      case 1:
        return RequestStatus.ongoing;
      case 2:
        return RequestStatus.success;
      case 3:
        return RequestStatus.failed;
      default:
        throw ArgumentError('Invalid RequestStatus integer: $status');
    }
  }
}
