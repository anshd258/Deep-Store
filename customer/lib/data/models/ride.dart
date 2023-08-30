class Ride {
  final int? id;
  final String? pickUpLocation;
  final String? pickUpCoordinates;
  final String? dropOffLocation;
  final String? dropOffCoordinates;

  Ride({
    this.id,
    this.pickUpLocation,
    this.pickUpCoordinates,
    this.dropOffLocation,
    this.dropOffCoordinates,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pickUpLocation': pickUpLocation,
      'pickUpCoordinates': pickUpCoordinates,
      'dropOffLocation': dropOffLocation,
      'dropOffCoordinates': dropOffCoordinates,
    };
  }

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      id: json['id'],
      pickUpLocation: json['pickUpLocation'],
      pickUpCoordinates: json['pickUpCoordinates'],
      dropOffLocation: json['dropOffLocation'],
      dropOffCoordinates: json['dropOffCoordinates'],
    );
  }
}
