

import 'package:customer/constants/enums.dart';

import 'rental.dart';
class RentalRequest {
  int id;
  Rental rental;
  String startLocation;
  String endLocation;
  String startCoordinates;
  String endCoordinates;
  DateTime? startTime;
  DateTime? endTime;
  RequestStatus status;
  double distance;
  double rating;

  RentalRequest({
    required this.id,
    required this.rental,
    required this.startLocation,
    required this.endLocation,
    required this.startCoordinates,
    required this.endCoordinates,
    this.startTime,
    this.endTime,
    required this.status,
    required this.distance,
    required this.rating,
  });

  factory RentalRequest.fromJson(Map<String, dynamic> json) {
    return RentalRequest(
      id: json['id'] as int,
      rental: Rental.fromJson(json['rental']),
      startLocation: json['start_location'] as String,
      endLocation: json['end_location'] as String,
      startCoordinates: json['start_coordinates'] as String,
      endCoordinates: json['end_coordinates'] as String,
      startTime: json['start_time'] != null
          ? DateTime.parse(json['start_time'] as String)
          : null,
      endTime: json['end_time'] != null
          ? DateTime.parse(json['end_time'] as String)
          : null,
      status: mapIntToRequestStatus(json['status'] as int),
      distance: json['distance'] as double,
      rating: json['rating'] as double,
    );
  }
}


