class User {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? contact;
  final String? room;
  final String? propertyId;

  User({this.firstName, this.lastName, 
    this.propertyId, 
    this.email,
    this.contact,
    this.room,
  });

 factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['user']['first_name'] as String?,
      lastName: json['user']['last_name'] as String?,
      email: json['user']['email'] as String?,
      contact: json['contact'] as String?,
      room: json['room'] as String?,
      propertyId: json['property_id'].toString(),
    );
  }
}