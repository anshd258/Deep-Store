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
  Rental? rental;
  String? startLocation;
  String? endLocation;
  String? startCoordinates;
  String? endCoordinates;
  Null? startTime;
  Null? endTime;
  int? status;
  String? distance;
  String? rating;

  Rentals(
      {this.id,
      this.user,
      this.rental,
      this.startLocation,
      this.endLocation,
      this.startCoordinates,
      this.endCoordinates,
      this.startTime,
      this.endTime,
      this.status,
      this.distance,
      this.rating});

  Rentals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    rental =
        json['rental'] != null ? new Rental.fromJson(json['rental']) : null;
    startLocation = json['start_location'];
    endLocation = json['end_location'];
    startCoordinates = json['start_coordinates'];
    endCoordinates = json['end_coordinates'];
    startTime = json['start_time'];
    endTime = json['end_time'];
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
    if (this.rental != null) {
      data['rental'] = this.rental!.toJson();
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
  User? user;
  String? contact;
  String? username;
  String? room;
  int? propertyId;

  User(
      {this.id,
      this.user,
      this.contact,
      this.username,
      this.room,
      this.propertyId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    contact = json['contact'];
    username = json['username'];
    room = json['room'];
    propertyId = json['property_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['contact'] = this.contact;
    data['username'] = this.username;
    data['room'] = this.room;
    data['property_id'] = this.propertyId;
    return data;
  }
}

class Rental {
  int? id;
  String? name;
  String? description;
  String? price;
  String? image;
  String? engineCapacity;
  String? mileage;
  String? fuelType;
  int? seatingCapacity;
  String? sType;
  int? quantity;

  Rental(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.image,
      this.engineCapacity,
      this.mileage,
      this.fuelType,
      this.seatingCapacity,
      this.sType,
      this.quantity});

  Rental.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'].toString();
    image = json['image'];
    engineCapacity = json['engineCapacity'];
    mileage = json['mileage'];
    fuelType = json['fuelType'];
    seatingCapacity = json['seatingCapacity'];
    sType = json['_type'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    data['engineCapacity'] = this.engineCapacity;
    data['mileage'] = this.mileage;
    data['fuelType'] = this.fuelType;
    data['seatingCapacity'] = this.seatingCapacity;
    data['_type'] = this.sType;
    data['quantity'] = this.quantity;
    return data;
  }
}
