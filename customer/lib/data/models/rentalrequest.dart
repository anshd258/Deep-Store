import 'package:customer/middleware/helpers/constants.dart';

class RentalRequest {
  final int requestId;
  final int rentalId;
  final String pickupLocation;
  final String dropOffLocation;
  final RequestStatus status;

  RentalRequest({
    required this.rentalId,
    required this.pickupLocation,
    required this.dropOffLocation,
    required this.status,
    required this.requestId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': requestId,
      'rental': rentalId,
      'start_location': pickupLocation,
      'end_location': dropOffLocation,
      'status': status.toString(), 
    };
  }

  factory RentalRequest.fromJson(Map<String, dynamic> json) {
    return RentalRequest(
      requestId: json['id'],
      rentalId: json['rental'],
      pickupLocation: json['start_location'],
      dropOffLocation: json['end_location'],
      status: mapIntToRequestStatus(json['status'])
    );
  }
}


