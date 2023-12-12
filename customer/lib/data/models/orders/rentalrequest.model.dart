
import 'orders.dart';

class RentalOrder extends Order<List<RentalRequestDetails>> {
  RentalOrder({
    required String id,
    required String type,
    required int dateTime,
    required double totalAmount,
    required String orderedBy,
    required List<RentalRequestDetails> details,
  }) : super(
          id: id,
          type: type,
          dateTime: dateTime,
          totalAmount: totalAmount,
          orderedBy: orderedBy,
          details: details,
        );

  factory RentalOrder.fromJson(Map<String, dynamic> json) {
    return RentalOrder(
      id: json['id'],
      type: json['type'],
      dateTime: json['date_time'],
      totalAmount: double.parse(json['total_amount'].toString()),
      orderedBy: json['ordered_by'],
      details: (json['details'] as List<dynamic>)
          .map((rental) => RentalRequestDetails.fromJson(rental))
          .toList(),
    );
  }
}



class RentalRequestDetails {
  final String name;
  final String startDate;
  final String endDate;
  final double rate;
  final int quantity;

  RentalRequestDetails({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.rate,
    required this.quantity,
  });

  factory RentalRequestDetails.fromJson(Map<String, dynamic> json) {
    return RentalRequestDetails(
      name: json['name'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      rate: double.parse(json['rate'].toString()),
      quantity: json['quantity'],
    );
  }
}
