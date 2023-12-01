class UserModal {
  Userdata? userdata;

  UserModal({this.userdata});

  UserModal.fromJson(Map<String, dynamic> json) {
    userdata = json['userdata'] != null
        ? Userdata.fromJson(json['userdata'])
        : null;
  }
}

class Userdata {
  int? id;
  User? user;
  String? contact;
  String? username;
  String? room;
  String? propertyId;

  Userdata(
      {this.id,
      this.user,
      this.contact,
      this.username,
      this.room,
      this.propertyId});

  Userdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    contact = json['contact'];
    username = json['username'];
    room = json['room'].toString();
    propertyId = json['property_id'].toString();
  }
}

class User {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;

  User({this.id, this.username, this.firstName, this.lastName, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }
}
