class RidesRequestModal {
  List<Rides>? rides;

  RidesRequestModal({this.rides});

  RidesRequestModal.fromJson(Map<String, dynamic> json) {
    if (json['rides'] != null) {
      rides = <Rides>[];
      json['rides'].forEach((v) {
        rides!.add(Rides.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rides != null) {
      data['rides'] = rides!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rides {
  String? id;
  User? user;
  String? startLocation;
  String? endLocation;
  String? startCoordinates;
  String? endCoordinates;
  String? startTime;
  String? endTime;
  int? status;
  String? distance;
  String? price;
  String? rating;

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
    id = json['id'].toString();
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    startLocation = json['start_location'].toString();
    endLocation = json['end_location'].toString();
    startCoordinates = json['start_coordinates'].toString();
    endCoordinates = json['end_coordinates'].toString();
    startTime = json['start_time'].toString();
    endTime = json['end_time'].toString();
    status = json['status'];
    distance = json['distance'].toString();
    price = json['price'].toString();
    rating = json['rating'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['start_location'] = startLocation;
    data['end_location'] = endLocation;
    data['start_coordinates'] = startCoordinates;
    data['end_coordinates'] = endCoordinates;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['status'] = status;
    data['distance'] = distance;
    data['price'] = price;
    data['rating'] = rating;
    return data;
  }
}

class User {
  String? id;

  String? contact;
  String? username;
  String? room;
  String? propertyId;

  User({this.id, this.contact, this.username, this.room, this.propertyId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();

    contact = json['contact'].toString();
    username = json['username'].toString();
    room = json['room'].toString();
    propertyId = json['property_id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['contact'] = contact;
    data['username'] = username;
    data['room'] = room;
    data['property_id'] = propertyId;
    return data;
  }
}
