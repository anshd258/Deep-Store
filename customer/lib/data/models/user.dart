class User {
  final String? name;
  final String? email;
  final String? contact;
  final String? room;
  final String? propertyId;

  User({this.name,
    this.propertyId, 
    this.email,
    this.contact,
    this.room,
  });

 factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['username'] as String?,
      email: json['email'] as String?,
      contact: json['contact'] as String?,
      room: json['room'] as String?,
      propertyId: json['property_id'] as String?,
    );
  }

}