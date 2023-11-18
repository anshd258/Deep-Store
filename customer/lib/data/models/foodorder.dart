import 'package:customer/data/models/fooddetail.dart';
import '../../constants/enums.dart';

class FoodOrder {
  final String id;
  final List<FoodDetails> items;
  final double discount;
  final double subTotalPrice;
  final double taxes;
  final double charges;
  final double totalPrice;
  final OrderStatus status;
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

  

  factory FoodOrder.fromJson(Map<String, dynamic> json) {
    return FoodOrder(
      id: json['id'].toString(),
      items: (json['items'] as List<dynamic>).map((foodJson) {
        return FoodDetails.fromJson(foodJson);
      }).toList(),
      discount: json['discount'],
      subTotalPrice: json['subtotal'],
      taxes: json['taxes'],
      charges: json['charges'],
      totalPrice: json['total'],
      status: mapIntToOrderStatus(json['status']),
      eta: DateTime.parse(json['created']),
    );
  }

 
}
