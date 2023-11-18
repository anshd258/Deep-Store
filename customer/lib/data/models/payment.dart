class OrderPaymentData {
  String id;
  String entity;
  int amount;
  int amountPaid;
  int amountDue;
  String currency;
  String? receipt;
  String? offerId;
  String status;
  int attempts;
  List<dynamic> notes;
  int createdAt;

  OrderPaymentData({
    required this.id,
    required this.entity,
    required this.amount,
    required this.amountPaid,
    required this.amountDue,
    required this.currency,
    this.receipt,
    this.offerId,
    required this.status,
    required this.attempts,
    required this.notes,
    required this.createdAt,
  });

  factory OrderPaymentData.fromJson(Map<String, dynamic> json) {
    return OrderPaymentData(
      id: json['id'],
      entity: json['entity'],
      amount: json['amount'],
      amountPaid: json['amount_paid'],
      amountDue: json['amount_due'],
      currency: json['currency'],
      receipt: json['receipt'],
      offerId: json['offer_id'],
      status: json['status'],
      attempts: json['attempts'],
      notes: json['notes'],
      createdAt: json['created_at'],
    );
  }
}
