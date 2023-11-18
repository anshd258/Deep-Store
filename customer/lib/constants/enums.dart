enum RequestStatus { pending, accepted, completed, cancelled, rejected }

enum OrderStatus {
  failed,
  hold,
  processing,
  confirmed,
  ready,
  delivered,
  completed
}





OrderStatus mapIntToOrderStatus(int status) {
  switch (status) {
    case 0:
      return OrderStatus.failed;
    case 1:
      return OrderStatus.hold;
    case 2:
      return OrderStatus.processing;
    case 3:
      return OrderStatus.confirmed;
    case 4:
      return OrderStatus.ready;
    case 5:
      return OrderStatus.delivered;
    case 6:
      return OrderStatus.completed;
    default:
      throw ArgumentError('Invalid OrderStatus integer: $status');
  }
}


RequestStatus mapIntToRequestStatus(int status) {
  switch (status) {
    case 0:
      return RequestStatus.pending;
    case 1:
      return RequestStatus.accepted;
    case 2:
      return RequestStatus.completed;
    case 3:
      return RequestStatus.cancelled;
    case 4:
      return RequestStatus.rejected;
    default:
      throw ArgumentError('Invalid RequestStatus integer: $status');
  }
}
