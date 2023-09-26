import 'package:customer/data/models/fooddetail.dart';
import 'package:customer/data/models/user.dart'; // Import the User class

import '../../middleware/helpers/constants.dart';

class FoodOrder {
  final String id;
  final List<FoodDetails> items;
  final double discount;
  final double subTotalPrice;
  final double taxes;
  final double charges;
  final double totalPrice;
  final RequestStatus status;
  final DateTime eta;

  FoodOrder({
    required this.id,
    required this.status,
    required this.taxes,
    required this.charges,
    required this.discount,
    required this.totalPrice,
    required this.subTotalPrice,
    required this.items,
    required this.eta,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': _mapRequestStatusToInt(status),
      'taxes': taxes,
      'charges': charges,
      'discount': discount,
      'total': totalPrice,
      'items': items.map((foodDetails) => foodDetails.toJson()).toList(),
      'eta': eta.toIso8601String(),
      'subTotal': subTotalPrice
    };
  }

  factory FoodOrder.fromJson(Map<String, dynamic> json) {
    print('yayyy');
    return FoodOrder(
      id: json['id'].toString(),
      items: (json['items'] as List<Map<String, dynamic>>)
          .map((foodJson) => FoodDetails.fromBackendJson(foodJson))
          .toList(),
      discount: json['discount'],
      subTotalPrice: json['subtotal'],
      taxes: json['taxes'],
      charges: json['charges'],
      totalPrice: json['total'],
      status: _mapIntToRequestStatus(json['status']),
      eta: DateTime.parse(json['created']),
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
