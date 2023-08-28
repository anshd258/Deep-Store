class User {
  final int userID;
  final String name;
  final String contactNo;
  // provider.
  // room number.

  User(this.userID, this.name, this.contactNo);

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'name': name,
      'contactNo': contactNo,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['userID'],
      json['name'],
      json['contactNo'],
    );
  }
}
