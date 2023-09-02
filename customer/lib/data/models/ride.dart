import '../../middleware/helpers/constants.dart';
import 'user.dart';

class Ride {
  final int? id;
  final String? pickUpLocation;
  final String? pickUpCoordinates;
  final String? dropOffLocation;
  final String? dropOffCoordinates;
  final RequestStatus status;
  final User user; // Add the user field here

  Ride({
    this.id,
    this.pickUpLocation,
    this.pickUpCoordinates,
    this.dropOffLocation,
    this.dropOffCoordinates,
    required this.status,
    required this.user, // Include the user field in the constructor
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pickUpLocation': pickUpLocation,
      'pickUpCoordinates': pickUpCoordinates,
      'dropOffLocation': dropOffLocation,
      'dropOffCoordinates': dropOffCoordinates,
      'status': _requestStatusToString(status),
      'user': user.toJson(), // Serialize the user field
    };
  }

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      id: json['id'],
      pickUpLocation: json['pickUpLocation'],
      pickUpCoordinates: json['pickUpCoordinates'],
      dropOffLocation: json['dropOffLocation'],
      dropOffCoordinates: json['dropOffCoordinates'],
      status: _stringToRequestStatus(json['status']),
      user: User.fromJson(json['user']), // Deserialize the user field
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
