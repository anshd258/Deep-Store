import 'package:customer/data/models/rental.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'user.dart';

class RentalRequest {
  final int rentalId;
  final Rental rental;
  final String pickupLocation;
  final String dropOffLocation;
  final RequestStatus status;

  RentalRequest(this.rentalId,  this.rental, this.pickupLocation, this.dropOffLocation, this.status);

  Map<String, dynamic> toJson() {
    return {
      'rentalId': rentalId,
      'rental': rental.toJson(),
      'pickupLocation': pickupLocation,
      'dropOffLocation': dropOffLocation,
      'status': _requestStatusToString(status),
    };
  }

  factory RentalRequest.fromJson(Map<String, dynamic> json) {
    return RentalRequest._fromJson(json);
  }

  static RentalRequest _fromJson(Map<String, dynamic> json) {
    return RentalRequest(
      json['rentalId'],
      Rental.fromJson(json['rental']),
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
