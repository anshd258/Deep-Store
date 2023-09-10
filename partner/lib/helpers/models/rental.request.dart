class RentalRequestModal {
  List<Rentals>? rentals;

  RentalRequestModal({this.rentals});

  RentalRequestModal.fromJson(Map<String, dynamic> json) {
    if (json['rentals'] != null) {
      rentals = <Rentals>[];
      json['rentals'].forEach((v) {
        rentals!.add(new Rentals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rentals != null) {
      data['rentals'] = this.rentals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rentals {
  int? id;
  int? user;
  String? startLocation;
  String? endLocation;
  String? startCoordinates;
  String? endCoordinates;
  String? startTime;
  String? endTime;
  int? status;
  double? distance;
  double? rating;
  int? rental;

  Rentals(
      {this.id,
      this.user,
      this.startLocation,
      this.endLocation,
      this.startCoordinates,
      this.endCoordinates,
      this.startTime,
      this.endTime,
      this.status,
      this.distance,
      this.rating,
      this.rental});

  Rentals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    startLocation = json['start_location'];
    endLocation = json['end_location'];
    startCoordinates = json['start_coordinates'];
    endCoordinates = json['end_coordinates'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    status = json['status'];
    distance = json['distance'];
    rating = json['rating'];
    rental = json['rental'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['user'] = this.user;

    data['start_location'] = this.startLocation;
    data['end_location'] = this.endLocation;
    data['start_coordinates'] = this.startCoordinates;
    data['end_coordinates'] = this.endCoordinates;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['status'] = this.status;
    data['distance'] = this.distance;
    data['rating'] = this.rating;
    data['rental'] = this.rental;
    return data;
  }
}

// class User {
//   int? id;

//   String? contact;
//   String? otp;
//   String? username;
//   Null? room;

//   User({this.id, this.contact, this.otp, this.username, this.room});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];

//     contact = json['contact'];
//     otp = json['otp'];
//     username = json['username'];
//     room = json['room'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;

//     data['contact'] = this.contact;
//     data['otp'] = this.otp;
//     data['username'] = this.username;
//     data['room'] = this.room;
//     return data;
//   }
// }
