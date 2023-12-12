
import 'orders.dart';

class LaundryDetails {
  final int clothsCount;

  LaundryDetails({
    required this.clothsCount,
  });

  factory LaundryDetails.fromJson(Map<String, dynamic> json) {
    return LaundryDetails(
      clothsCount: json['cloths_count'],
    );
  }
}

class LaundryOrder extends Order<LaundryDetails> {
  LaundryOrder({
    required String id,
    required String type,
    required int dateTime,
    required double totalAmount,
    required String orderedBy,
    required LaundryDetails details,
  }) : super(
          id: id,
          type: type,
          dateTime: dateTime,
          totalAmount: totalAmount,
          orderedBy: orderedBy,
          details: details,
        );

  factory LaundryOrder.fromJson(Map<String, dynamic> json) {
    return LaundryOrder(
      id: json['id'],
      type: json['type'],
      dateTime: json['date_time'],
      totalAmount: double.parse(json['total_amount'].toString()),
      orderedBy: json['ordered_by'],
      details: LaundryDetails.fromJson(json['details']),
    );
  }
}
