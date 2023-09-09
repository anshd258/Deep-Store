class RidesRequestModal {
  List<Rides>? rides;

  RidesRequestModal({this.rides});

  RidesRequestModal.fromJson(Map<String, dynamic> json) {
    if (json['rides'] != null) {
      rides = <Rides>[];
      json['rides'].forEach((v) {
        rides!.add(new Rides.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rides != null) {
      data['rides'] = this.rides!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rides {
  int? id;
  User? user;
  String? startLocation;
  String? endLocation;
  String? startCoordinates;
  String? endCoordinates;
  String? startTime;
  String? endTime;
  int? status;
  double? distance;
  double? price;
  double? rating;

  Rides(
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
      this.price,
      this.rating});

  Rides.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    startLocation = json['start_location'];
    endLocation = json['end_location'];
    startCoordinates = json['start_coordinates'];
    endCoordinates = json['end_coordinates'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    status = json['status'];
    distance = json['distance'];
    price = json['price'];
    rating = json['rating'];
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
    data['price'] = this.price;
    data['rating'] = this.rating;
    return data;
  }
}

class User {
  int? id;

  String? contact;
  String? otp;
  String? username;
  Null? room;

  User({this.id, this.contact, this.otp, this.username, this.room});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    contact = json['contact'];
    otp = json['otp'];
    username = json['username'];
    room = json['room'];
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
