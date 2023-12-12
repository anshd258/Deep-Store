
import 'orders.dart';

class TaxiDetails {
  final String pickup;
  final String destination;

  TaxiDetails({
    required this.pickup,
    required this.destination,
  });

  factory TaxiDetails.fromJson(Map<String, dynamic> json) {
    return TaxiDetails(
      pickup: json['pickup'],
      destination: json['destination'],
    );
  }
}

class TaxiOrder extends Order<TaxiDetails> {
  TaxiOrder({
    required String id,
    required String type,
    required int dateTime,
    required double totalAmount,
    required String orderedBy,
    required TaxiDetails details,
  }) : super(
          id: id,
          type: type,
          dateTime: dateTime,
          totalAmount: totalAmount,
          orderedBy: orderedBy,
          details: details,
        );

  factory TaxiOrder.fromJson(Map<String, dynamic> json) {
    return TaxiOrder(
      id: json['id'],
      type: json['type'],
      dateTime: json['date_time'],
      totalAmount: double.parse(json['total_amount'].toString()),
      orderedBy: json['ordered_by'],
      details: TaxiDetails.fromJson(json['details']),
    );
  }
}
