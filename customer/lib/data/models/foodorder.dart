import 'package:customer/data/models/fooddetail.dart';
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
      'status': mapRequestStatusToInt(status),
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
    return FoodOrder(
      id: json['id'].toString(),
      items: (json['items'] as List<dynamic>).map((foodJson) {
        return FoodDetails.fromBackendJson(foodJson);
      }).toList(),
      discount: json['discount'],
      subTotalPrice: json['subtotal'],
      taxes: json['taxes'],
      charges: json['charges'],
      totalPrice: json['total'],
      status: mapIntToRequestStatus(json['status']),
      eta: DateTime.parse(json['created']),
    );
  }

 
}
