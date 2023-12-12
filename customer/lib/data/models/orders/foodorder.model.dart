

import 'orders.dart';

class FoodOrder extends Order<FoodOrderDetails> {
  FoodOrder({
    required String id,
    required String type,
    required int dateTime,
    required double totalAmount,
    required String orderedBy,
    required FoodOrderDetails details,
  }) : super(
          id: id,
          type: type,
          dateTime: dateTime,
          totalAmount: totalAmount,
          orderedBy: orderedBy,
          details: details,
        );

  factory FoodOrder.fromJson(Map<String, dynamic> json) {
    return FoodOrder(
      id: json['id'],
      type: json['type'],
      dateTime: json['date_time'],
      totalAmount: double.parse(json['total_amount'].toString()),
      orderedBy: json['ordered_by'],
      details: FoodOrderDetails.fromJson(json['details']),
    );
  }
}


class FoodOrderDetails {
  final List<Item> items;

  FoodOrderDetails({required this.items});

  factory FoodOrderDetails.fromJson(Map<String, dynamic> json) {
    return FoodOrderDetails(
      items: (json['items'] as List<dynamic>)
          .map((item) => Item.fromJson(item))
          .toList(),
    );
  }
}

class Item {
  final int foodId;
  final String name;
  final double price;
  final int quantity;

  Item({
    required this.foodId,
    required this.name,
    required this.price,
    required this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      foodId: json['food_id'],
      name: json['name'],
      price: double.parse(json['price'].toString()),
      quantity: json['quantity'],
    );
  }
}
