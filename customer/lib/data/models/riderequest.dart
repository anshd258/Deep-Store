import 'package:customer/middleware/helpers/constants.dart';
import 'ride.dart';
import 'user.dart';

class RideRequest {
  final int rideId;
  final User user;
  final Ride ride;
  final String pickupLocation;
  final String dropOffLocation;
  final RequestStatus status;

  RideRequest(this.rideId, this.user, this.ride, this.pickupLocation, this.dropOffLocation, this.status);

  Map<String, dynamic> toJson() {
    return {
      'rideId': rideId,
      'user': user.toJson(),
      'ride': ride.toJson(),
      'pickupLocation': pickupLocation,
      'dropOffLocation': dropOffLocation,
      'status': _requestStatusToString(status),
    };
  }

  factory RideRequest.fromJson(Map<String, dynamic> json) {
    return RideRequest._fromJson(json);
  }

  static RideRequest _fromJson(Map<String, dynamic> json) {
    return RideRequest(
      json['rideId'],
      User.fromJson(json['user']),
      Ride.fromJson(json['ride']),
      json['pickupLocation'],
      json['dropOffLocation'],
      _stringToRequestStatus(json['status']),
    );
  }

  String _requestStatusToString(RequestStatus status) {
    return _requestStatusMap[status]!;
  }

  static RequestStatus _stringToRequestStatus(String status) {
    return _requestStatusMap.entries.firstWhere((entry) => entry.value == status).key;
  }

  static final Map<RequestStatus, String> _requestStatusMap = {
    RequestStatus.pending: 'pending',
    RequestStatus.ongoing: 'ongoing',
    RequestStatus.success: 'success',
    RequestStatus.failed: 'failed',
  };
}
