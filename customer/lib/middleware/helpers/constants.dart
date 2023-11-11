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

enum QueryType { get, post }

enum VehicleType { TWO_WHEELER, FOUR_WHEELER }

class LocalStorageKeys {
  static const String accessToken = 'accessToken';
  static const String name = 'userName';
  static const String email = 'userName';
  static const String refreshToken = 'refreshToken';
  static const String room = 'room';
  static const String propertyId = 'propertyId';
  static const String userPhoneNumber = 'phoneNumber';
  static const String location = 'location';
}

int mapOrderStatusToInt(OrderStatus status) {
  switch (status) {
    case OrderStatus.failed:
      return 0;
    case OrderStatus.hold:
      return 1;
    case OrderStatus.processing:
      return 2;
    case OrderStatus.confirmed:
      return 3;
    case OrderStatus.ready:
      return 4;
    case OrderStatus.delivered:
      return 5;
    case OrderStatus.completed:
      return 6;
    default:
      throw ArgumentError('Invalid OrderStatus value: $status');
  }
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

int mapRequestStatusToInt(RequestStatus status) {
  switch (status) {
    case RequestStatus.pending:
      return 0;
    case RequestStatus.accepted:
      return 1;
    case RequestStatus.completed:
      return 2;
    case RequestStatus.cancelled:
      return 3;
    case RequestStatus.rejected:
      return 4;
    default:
      throw ArgumentError('Invalid RequestStatus value: $status');
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
