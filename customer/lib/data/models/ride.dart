

import '../../constants/enums.dart';

class Ride {
  final int? id;
  final String? pickUpLocation;
  final String? pickUpCoordinates;
  final String? dropOffLocation;
  final String? dropOffCoordinates;
  final DateTime? pickUpTime;
  final DateTime? dropOffTime;
  final RequestStatus status;
  final double? distance;
  final double? price;
  final double rating;

  Ride({
    this.id,
    this.pickUpLocation,
    this.pickUpCoordinates,
    this.dropOffLocation,
    this.dropOffCoordinates,
    this.pickUpTime,
    this.dropOffTime,
    required this.status,
    this.distance,
    this.price,
    required this.rating,
  });

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      id: json['id'],
      pickUpLocation: json['start_location'],
      pickUpCoordinates: json['start_coordinates'],
      dropOffLocation: json['end_location'],
      dropOffCoordinates: json['end_coordinates'],
      pickUpTime: json['start_time'] != null
          ? DateTime.parse(json['start_time'])
          : null,
      dropOffTime:
          json['end_time'] != null ? DateTime.parse(json['end_time']) : null,
      status: mapIntToRequestStatus(json['status']),
      distance: json['distance']?.toDouble(),
      price: json['price']?.toDouble(),
      rating: json['rating']?.toDouble() ?? 0.0,
    );
  }



  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pickUpLocation': pickUpLocation,
      'pickUpCoordinates': pickUpCoordinates,
      'dropOffLocation': dropOffLocation,
      'dropOffCoordinates': dropOffCoordinates,
      'pickUpTime': pickUpTime?.toIso8601String(),
      'dropOffTime': dropOffTime?.toIso8601String(),
      'status': status.index, // Store the enum as an integer in JSON.
      'distance': distance,
      'price': price,
      'rating': rating,
    };
  }
}
