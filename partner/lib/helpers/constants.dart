enum RequestStatus { pending, ongoing, success, failed }

enum QueryType { get, post }

enum RequestType { food, ride, rental }

enum StatusRideRental {
  pending(0),
  accepted(1),
  completed(2),
  cancelled(3),
  rejected(4);

  final int code;
  const StatusRideRental(this.code);
}

enum StatusFood {
  failed(0),
  hold(1),
  processing(2),
  confirmed(3),
  ready(4),
  delicered(5),
  completed(6),
  ;

  final int code;
  const StatusFood(this.code);
}

const baseUrl = "nestafar-2023.web.app";
