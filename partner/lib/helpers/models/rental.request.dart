class RentalRequestModal {
  List<Rentals>? rentals;

  RentalRequestModal({this.rentals});

  RentalRequestModal.fromJson(Map<String, dynamic> json) {
    if (json['rentals'] != null) {
      rentals = <Rentals>[];
      json['rentals'].forEach((v) {
        rentals!.add(Rentals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rentals != null) {
      data['rentals'] = rentals!.map((v) => v.toJson()).toList();
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
  String? startTime;
  String? endTime;
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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    rental =
        json['rental'] != null ? Rental.fromJson(json['rental']) : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (rental != null) {
      data['rental'] = rental!.toJson();
    }
    data['start_location'] = startLocation;
    data['end_location'] = endLocation;
    data['start_coordinates'] = startCoordinates;
    data['end_coordinates'] = endCoordinates;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['status'] = status;
    data['distance'] = distance;
    data['rating'] = rating;
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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    contact = json['contact'];
    username = json['username'];
    room = json['room'];
    propertyId = json['property_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['contact'] = contact;
    data['username'] = username;
    data['room'] = room;
    data['property_id'] = propertyId;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['image'] = image;
    data['engineCapacity'] = engineCapacity;
    data['mileage'] = mileage;
    data['fuelType'] = fuelType;
    data['seatingCapacity'] = seatingCapacity;
    data['_type'] = sType;
    data['quantity'] = quantity;
    return data;
  }
}
