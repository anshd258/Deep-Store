class Order<T> {
  final String id;
  final String type;
  final int dateTime;
  final double totalAmount;
  final String orderedBy;
  final T details;

  Order({
    required this.id,
    required this.type,
    required this.dateTime,
    required this.totalAmount,
    required this.orderedBy,
    required this.details,
  });

  factory Order.fromJson(Map<String, dynamic> json,
      T Function(Map<String, dynamic>) fromJsonDetails) {
    return Order(
      id: json['id'],
      type: json['type'],
      dateTime: json['date_time'],
      totalAmount: double.parse(json['total_amount'].toString()),
      orderedBy: json['ordered_by'],
      details: fromJsonDetails(json['details']),
    );
  }
}
