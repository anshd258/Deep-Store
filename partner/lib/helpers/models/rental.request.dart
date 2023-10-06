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
  User? user;
  String? startLocation;
  String? endLocation;
  String? startCoordinates;
  String? endCoordinates;
  String? startTime;
  String? endTime;
  int? status;
  String? distance;
  String? rating;


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
    });

  Rentals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    startLocation = json['start_location'].toString();
    endLocation = json['end_location'].toString();
    startCoordinates = json['start_coordinates'].toString();
    endCoordinates = json['end_coordinates'].toString();
    startTime = json['start_time'].toString();
    endTime = json['end_time'].toString();
    status = json['status'];
    distance = json['distance'].toString();
    rating = json['rating'].toString();
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['start_location'] = this.startLocation;
    data['end_location'] = this.endLocation;
    data['start_coordinates'] = this.startCoordinates;
    data['end_coordinates'] = this.endCoordinates;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['status'] = this.status;
    data['distance'] = this.distance;
    data['rating'] = this.rating;
    
    return data;
  }
}

class User {
  int? id;

  String? contact;
  String? otp;
  String? username;
  String? room;

  User({this.id, this.contact, this.otp, this.username, this.room});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    contact = json['contact'].toString();
    otp = json['otp'].toString();
    username = json['username'].toString();
    room = json['room'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['contact'] = this.contact;
    data['otp'] = this.otp;
    data['username'] = this.username;
    data['room'] = this.room;
    return data;
  }
}
